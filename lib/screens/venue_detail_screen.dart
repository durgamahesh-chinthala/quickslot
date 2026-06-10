import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../models/venue.dart';
import '../providers/booking_provider.dart';
import '../providers/auth_provider.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/error_view.dart';
import '../widgets/slot_tile.dart';

class VenueDetailScreen extends StatefulWidget {
  final Venue venue;

  const VenueDetailScreen({super.key, required this.venue});

  @override
  State<VenueDetailScreen> createState() => _VenueDetailScreenState();
}

class _VenueDetailScreenState extends State<VenueDetailScreen> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    _loadSlots();
  }

  void _loadSlots() {
    context.read<BookingProvider>().loadSlots(widget.venue.id, selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthProvider>().currentUser;

    return Scaffold(
      appBar: AppBar(title: Text(widget.venue.name)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.venue.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.venue.location,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select Date:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                OutlinedButton.icon(
                  icon: const Icon(Icons.calendar_today),
                  label: Text(DateFormat('MMM dd, yyyy').format(selectedDate)),
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 30)),
                    );
                    if (picked != null && picked != selectedDate) {
                      setState(() => selectedDate = picked);
                      _loadSlots();
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Consumer<BookingProvider>(
              builder: (context, bookingProvider, _) {
                if (bookingProvider.isLoadingSlots) {
                  return const LoadingIndicator(message: 'Loading slots...');
                }

                if (bookingProvider.error != null) {
                  return ErrorView(
                    message: 'Failed to load slots: ${bookingProvider.error}',
                    onRetry: _loadSlots,
                  );
                }

                if (bookingProvider.currentSlots.isEmpty) {
                  return const Center(child: Text('No slots available'));
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: bookingProvider.currentSlots.length,
                  itemBuilder: (context, index) {
                    final slot = bookingProvider.currentSlots[index];
                    final time = DateFormat('HH:mm').format(slot.startTime);

                    return SlotTile(
                      timeLabel: time,
                      isBooked: slot.isBooked,
                      onTap: () =>
                          _showBookingConfirmation(context, slot, user!.id),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showBookingConfirmation(
    BuildContext context,
    dynamic slot,
    String userId,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Booking'),
        content: Text(
          'Book slot from ${DateFormat('HH:mm').format(slot.startTime)} to ${DateFormat('HH:mm').format(slot.endTime)}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              await _performBooking(context, slot, userId);
            },
            child: const Text('Book'),
          ),
        ],
      ),
    );
  }

  Future<void> _performBooking(
    BuildContext context,
    dynamic slot,
    String userId,
  ) async {
    final bookingProvider = context.read<BookingProvider>();
    final success = await bookingProvider.bookSlot(
      userId: userId,
      venueId: widget.venue.id,
      slotId: slot.id,
      venueName: widget.venue.name,
      startTime: slot.startTime,
      endTime: slot.endTime,
    );

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Booking successful!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(bookingProvider.bookingError ?? 'Booking failed'),
          backgroundColor: Colors.red,
        ),
      );
      bookingProvider.clearBookingError();
    }
  }
}

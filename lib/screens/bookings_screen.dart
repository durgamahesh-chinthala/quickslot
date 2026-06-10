import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/auth_provider.dart';
import '../providers/booking_provider.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/error_view.dart';
import '../theme.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = context.read<AuthProvider>().currentUser;
      if (user != null) {
        context.read<BookingProvider>().loadUserBookings(user.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingProvider>(
      builder: (context, bookingProvider, _) {
        if (bookingProvider.isLoadingBookings) {
          return const LoadingIndicator(message: 'Loading bookings...');
        }

        if (bookingProvider.error != null) {
          return ErrorView(message: 'Failed to load bookings: ${bookingProvider.error}', onRetry: () {
            final user = context.read<AuthProvider>().currentUser;
            if (user != null) bookingProvider.loadUserBookings(user.id);
          });
        }

        if (bookingProvider.userBookings.isEmpty) {
          return const Center(child: Text('No bookings yet'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: bookingProvider.userBookings.length,
          itemBuilder: (context, index) {
            final booking = bookingProvider.userBookings[index];
            return Card(
              child: ListTile(
                leading: const Icon(Icons.event_available, color: AppColors.primary),
                title: Text(booking.venueName, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(
                  '${DateFormat('MMM dd, HH:mm').format(booking.startTime)} - ${DateFormat('HH:mm').format(booking.endTime)}',
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _showCancelDialog(context, booking.id, booking.slotId),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showCancelDialog(
    BuildContext context,
    String bookingId,
    String slotId,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Booking'),
        content: const Text('Are you sure you want to cancel this booking?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<BookingProvider>().cancelBooking(bookingId, slotId);
            },
            child: const Text('Yes, Cancel'),
          ),
        ],
      ),
    );
  }
}

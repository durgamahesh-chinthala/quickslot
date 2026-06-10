import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/venue_provider.dart';
import 'venue_detail_screen.dart';

class VenuesScreen extends StatefulWidget {
  const VenuesScreen({super.key});

  @override
  State<VenuesScreen> createState() => _VenuesScreenState();
}

class _VenuesScreenState extends State<VenuesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VenueProvider>().loadVenues();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VenueProvider>(
      builder: (context, venueProvider, _) {
        if (venueProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (venueProvider.error != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: ${venueProvider.error}'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => venueProvider.loadVenues(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (venueProvider.venues.isEmpty) {
          return const Center(child: Text('No venues available'));
        }

        return ListView.builder(
          itemCount: venueProvider.venues.length,
          itemBuilder: (context, index) {
            final venue = venueProvider.venues[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(venue.name),
                subtitle: Text(venue.location),
                trailing: Text('⭐ ${venue.rating}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => VenueDetailScreen(venue: venue),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

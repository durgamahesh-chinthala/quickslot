import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/venue_provider.dart';
import 'venue_detail_screen.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/error_view.dart';
import '../theme.dart';

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
          return const LoadingIndicator();
        }

        if (venueProvider.error != null) {
          return ErrorView(message: 'Failed to load venues: ${venueProvider.error}', onRetry: () => venueProvider.loadVenues());
        }

        if (venueProvider.venues.isEmpty) {
          return const Center(child: Text('No venues available'));
        }

        return ListView.builder(
          itemCount: venueProvider.venues.length,
          itemBuilder: (context, index) {
            final venue = venueProvider.venues[index];
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                  child: const Icon(Icons.sports_tennis, color: AppColors.primary),
                ),
                title: Text(venue.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(venue.location),
                trailing: Chip(label: Text('⭐ ${venue.rating}')),
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

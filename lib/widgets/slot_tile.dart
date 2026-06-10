import 'package:flutter/material.dart';

class SlotTile extends StatelessWidget {
  final String timeLabel;
  final bool isBooked;
  final VoidCallback? onTap;

  const SlotTile({
    super.key,
    required this.timeLabel,
    required this.isBooked,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bg = isBooked
        ? Theme.of(context).colorScheme.error
        : Theme.of(context).primaryColor;
    return Material(
      color: bg,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: isBooked ? null : onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(isBooked ? Icons.lock : Icons.schedule, color: Colors.white),
              const SizedBox(height: 8),
              Text(
                timeLabel,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                isBooked ? 'Booked' : 'Available',
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

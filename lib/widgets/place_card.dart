import 'package:flutter/material.dart';

class PlaceCard extends StatelessWidget {
  final String text;
  const PlaceCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.grey.shade100,
      elevation: 0.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: ListTile(
          leading: Icon(
            Icons.location_on_outlined,
            size: 55,
            color: Theme.of(context).colorScheme.primary,
          ),
          trailing: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.amber.shade400,
              ),
              Text(
                "4.3",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
          title: Text(text, style: Theme.of(context).textTheme.displayMedium),
          subtitle: const Text('Ortahisar'),
        ),
      ),
    );
  }
}

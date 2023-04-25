import 'package:flutter/material.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({super.key});

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
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
              title: Text("Fenomen Cafe",
                  style: Theme.of(context).textTheme.headline2),
              subtitle: const Text('Ortahisar')),
        ));
  }
}

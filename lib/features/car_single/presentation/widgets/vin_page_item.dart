import 'package:flutter/material.dart';

class VinPageItem extends StatelessWidget {
  final String description;
  final String data;

  const VinPageItem({required this.data, required this.description, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Text(
              description,
              style: Theme.of(context).textTheme.headline2,
            ),
            const Expanded(
              child: Divider(),
            ),
            Text(
              data,
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
      );
}

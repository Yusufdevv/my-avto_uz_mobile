import 'package:flutter/material.dart';

class CarInfoRow extends StatelessWidget {
  final String title;
  final String info;
  const CarInfoRow({
    required this.info,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.headline2),
            Expanded(
                child: Container(
                    margin: const EdgeInsets.only(top: 13),
                    height: 1,
                    color: Theme.of(context).textTheme.headline2!.color)),
            Text(
              info,
              style: Theme.of(context).textTheme.headline2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
}

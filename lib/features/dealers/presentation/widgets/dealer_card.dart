import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DealerCard extends StatefulWidget {
  const DealerCard({Key? key}) : super(key: key);

  @override
  State<DealerCard> createState() => _DealerCardState();
}

class _DealerCardState extends State<DealerCard> {
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset('assetName'),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('data'),
                    Text('data'),
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                SvgPicture.asset('assetName'),
                Text('data'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SvgPicture.asset('assetName'),
                Text('data'),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              children: const [
                Expanded(child: Text('data')),
                Text('data'),
              ],
            ),
          ],
        ),
      );
}

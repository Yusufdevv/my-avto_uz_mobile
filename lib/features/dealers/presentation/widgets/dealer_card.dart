import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DealerCard extends StatefulWidget {
  final Widget picture;
  const DealerCard({Key? key, required this.picture}) : super(key: key);

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
                widget.picture,
                Column(
                  children: [const Text('data'), const Text('data')],
                )
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(AppIcons.vehicleCar),
                const SizedBox(width: 8),
                const Text('data')
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SvgPicture.asset(AppIcons.vehicleCar),
                const SizedBox(width: 8),
                const Text('data')
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              children: const [Expanded(child: Text('Contacts')), Text('+998 97 123 45 67')],
            )
          ],
        ),
      );
}

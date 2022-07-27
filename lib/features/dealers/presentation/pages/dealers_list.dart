import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/dealer_card.dart';

class DealersList extends StatefulWidget {
  const DealersList({Key? key}) : super(key: key);

  @override
  State<DealersList> createState() => _DealersListState();
}

class _DealersListState extends State<DealersList> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView(
          children: [
            DealerCard(
              picture: SvgPicture.asset(AppIcons.facebook),
            ),
            DealerCard(
              picture: SvgPicture.asset(AppIcons.facebook),
            ),
            DealerCard(
              picture: SvgPicture.asset(AppIcons.facebook),
            ),
          ],
        ),
      );
}

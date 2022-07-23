import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/dealers/presentation/pages/dealers_filter.dart';
import 'package:auto/features/dealers/presentation/widgets/segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dealerslist extends StatefulWidget {
  const Dealerslist({Key? key}) : super(key: key);

  @override
  State<Dealerslist> createState() => _DealerslistState();
}

class _DealerslistState extends State<Dealerslist> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverSafeArea(
                    top: false,
                    sliver: SliverAppBar(
                      leadingWidth: 0,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            child: SvgPicture.asset(AppIcons.chevronLeft),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: WTextField(
                              hintText: 'Марка, Модель',
                              onChanged: (value) {},
                              hasSearch: true,
                              borderRadius: 8,
                            ),
                          ),
                          SizedBox(width: 11),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DealersFilter()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                              padding: const EdgeInsets.all(8),
                              child: SvgPicture.asset(AppIcons.filter),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: SegmentedControl(maxHeight: 160.0, minHeight: 40.0),
                ),
              ],
              body: TabBarView(
                children: [
                  Text('green'),
                  Text('yellow'),
                ],
              ),
            ),
          ),
        ),
      );
}

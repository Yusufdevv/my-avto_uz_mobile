import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/reviews/presentation/widgets/floatingActionButton.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: floatingActionButton(),
        appBar: WAppBar(
          //title: LocaleKeys.reviews.tr(),
          extraActions: [
            Container(
              color: Colors.amberAccent,
              height: 10,
              width: 40,
            ),
          ],
          //childWithButton: Container(color: Colors.amberAccent, height: 10),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      );
}

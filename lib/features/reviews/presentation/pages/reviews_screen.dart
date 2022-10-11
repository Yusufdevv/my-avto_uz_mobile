import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/reviews/presentation/widgets/item_container.dart';
import 'package:auto/features/reviews/presentation/widgets/add_bottomsheet.dart';
import 'package:auto/features/reviews/presentation/widgets/model_mark.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              context: context,
              builder: (context) => const ModalBottomSheet(),
            );
          },
          backgroundColor: LightThemeColors.button,
          child: SvgPicture.asset(
            AppIcons.plus,
            color: Colors.white,
            height: 22,
            width: 22,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          leading: SvgPicture.asset(AppIcons.appbar_back),
          leadingWidth: 10,
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              LocaleKeys.reviews.tr(),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              margin: const EdgeInsets.all(16),
              height: 38,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromRGBO(118, 118, 128, 0.12),
              ),
              child: TabBar(
                padding: const EdgeInsets.all(2),
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                indicatorColor: Colors.transparent,
                tabs: [
                  Tab(child: typeMobile(LocaleKeys.passenger_cars.tr())),
                  Tab(child: typeMobile(LocaleKeys.commercial.tr())),
                  Tab(child: typeMobile(LocaleKeys.moto.tr())),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            modelContainer(),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => itemContainer(context),
                itemCount: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget typeMobile(String text) => Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
    );

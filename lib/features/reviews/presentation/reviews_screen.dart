import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/reviews/presentation/widgets/floating_action_button.dart';
import 'package:auto/features/reviews/presentation/widgets/item_container.dart';
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
        floatingActionButton: floatingActionButton(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          shadowColor: const Color.fromRGBO(23, 23, 27, 0.08),
          leading: Row(
            children: [
              const SizedBox(width: 24),
              SvgPicture.asset(
                AppIcons.appbar_back,
                width: 20,
                height: 20,
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          title: Text(
            LocaleKeys.reviews.tr(),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Theme(
              data: ThemeData(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
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
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            modelContainer(context),
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
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );

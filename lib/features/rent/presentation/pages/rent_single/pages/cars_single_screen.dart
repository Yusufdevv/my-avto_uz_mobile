import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/rent/domain/entities/rent_entity.dart';
import 'package:auto/features/rent/presentation/pages/rent_period/presentation/pages/rent_period_screen.dart';
import 'package:auto/features/rent/presentation/pages/rent_single/widgets/additional_options.dart';
import 'package:auto/features/rent/presentation/pages/rent_single/widgets/all_rating_item.dart';
import 'package:auto/features/rent/presentation/pages/rent_single/widgets/car_single_preview.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CarsSingleScreen extends StatefulWidget {
  const CarsSingleScreen({Key? key}) : super(key: key);

  @override
  State<CarsSingleScreen> createState() => _CarsSingleScreenState();
}

class _CarsSingleScreenState extends State<CarsSingleScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: WAppBar(
          title: LocaleKeys.for_dates.tr(),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              CarSinglePreview(
                rentEntity: RentEntity(),
              ),
               AdditionalOptions(),
               AllRationItem(),
            ],
          ),
        ),
        bottomNavigationBar: WButton(
          height: 44,
          onTap: () =>
              Navigator.push(context, fade(page: const RentPeriodScreen())),
          margin: EdgeInsets.fromLTRB(
              16, 0, 16, MediaQuery.of(context).padding.bottom + 16),
          text: LocaleKeys.further.tr(),
          shadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 20,
                color: orange.withOpacity(0.2)),
          ],
        ),
      );
}

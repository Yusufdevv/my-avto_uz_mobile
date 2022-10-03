import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/rent/domain/entities/rent_entity.dart';
import 'package:auto/features/rent/presentation/pages/confimation/presentation/widgets/details_item.dart';
import 'package:auto/features/rent/presentation/pages/confimation/presentation/widgets/milage_price_item.dart';
import 'package:auto/features/rent/presentation/pages/confimation/presentation/widgets/place_item.dart';
import 'package:auto/features/rent/presentation/pages/confimation/presentation/widgets/requirement_item.dart';
import 'package:auto/features/rent/presentation/pages/registration_lease/presentation/pages/registration_lease.dart';
import 'package:auto/features/rent/presentation/pages/rent_single/widgets/car_single_preview.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: WAppBar(
          title: LocaleKeys.confirmation.tr(),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              CarSinglePreview(
                rentEntity: RentEntity(),
                hasCarInfo: false,
              ),
              RequirementItem(
                age: '16',
                experience: '2',
              ),
              DetailsItem(),
              MileagePriceItem(),
              PlaceItem(),
            ],
          ),
        ),
        bottomNavigationBar: WButton(
          height: 44,
          onTap: () => Navigator.push(
              context, fade(page: const RegistrationLeaseScreen())),
          margin: EdgeInsets.fromLTRB(
              16, 0, 16, MediaQuery.of(context).padding.bottom + 16),
          text: LocaleKeys.form_order.tr(),
          shadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 20,
                color: orange.withOpacity(0.2)),
          ],
        ),
      );
}

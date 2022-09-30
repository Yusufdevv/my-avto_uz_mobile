import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/rent/domain/entities/rent_list_entity.dart';
import 'package:auto/features/rent/presentation/pages/rent_period/presentation/pages/rent_period_screen.dart';
import 'package:auto/features/rent/presentation/pages/rent_single/widgets/additional_options.dart';
import 'package:auto/features/rent/presentation/pages/rent_single/widgets/all_rating_item.dart';
import 'package:auto/features/rent/presentation/pages/rent_single/widgets/car_single_preview.dart';
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
        appBar: const WAppBar(
          title: 'Для свиданий',
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              CarSinglePreview(
                rentEntity: RentListEntity(),
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
          text: 'Далее',
          shadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 20,
                color: orange.withOpacity(0.2)),
          ],
        ),
      );
}

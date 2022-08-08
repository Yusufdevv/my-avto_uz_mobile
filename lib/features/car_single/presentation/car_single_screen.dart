import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/presentation/parts/car_actions.dart';
import 'package:auto/features/car_single/presentation/parts/car_details.dart';
import 'package:auto/features/car_single/presentation/parts/car_seller_card.dart';
import 'package:auto/features/car_single/presentation/parts/description_tabs.dart';
import 'package:auto/features/car_single/presentation/parts/descriptions/vin_info_list.dart';
import 'package:auto/features/car_single/presentation/parts/owner_actions.dart';
import 'package:auto/features/car_single/presentation/parts/statistics.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarSingleScreen extends StatelessWidget {
  const CarSingleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xff121212),
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(color: dark1, padding: EdgeInsets.fromLTRB(
                  16, 12, 16, 4 + MediaQuery.of(context).padding.bottom),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mercedes-Benz CLS 400 II (C218) AMG Рестайлинг Mercedes-Benz CLS 400 II (C218) AMG',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 12),
                      child: Row(
                        children: [
                          Text(
                            '123 488 000 000 UZS',
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          WButton(
                            onTap: () {},
                            height: 24,
                            borderRadius: 6,
                            color: blue,
                            width: 24,
                            child: SvgPicture.asset(
                              AppIcons.chevronDown,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    CarStatistics(),
                    const Divider(
                      height: 32,
                      thickness: 1,
                      color: strokeDark,
                    ),
                    const CarActions(),
                    Container(
                        margin: const EdgeInsets.only(top: 4, bottom: 12),
                        child: const Divider(
                          thickness: 1,
                          color: strokeDark,
                        )),
                    CarDetails(),
                  ],
                ),
              ),
              Container(color: background,padding: EdgeInsets.symmetric(vertical: 12),
                child: OwnerActions(),
              ),
              Container(color: dark1,padding: EdgeInsets.symmetric(vertical: 16),
                child: CarSellerCard(),
              ),
              DescriptionTabs(),
              VinInfoList()
            ],
          ),
        ),
      );
}

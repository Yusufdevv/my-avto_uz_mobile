import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/dealers/domain/entities/marks_with_announcements.dart';
import 'package:auto/features/dealers/presentation/pages/all_marks_with_announcements.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_info.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_info_sliver_delegate.dart';
import 'package:auto/features/dealers/presentation/widgets/mark_with_announcement.dart';
import 'package:auto/features/main/presentation/widgets/ads_item.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Seller extends StatelessWidget {
  //final String dealerType;
  final String dealerName;
  final String dealerInfo;
  final String contactFrom;
  final String contactTo;
  final String phoneNumber;
  final double latitude;
  final double longitude;
  final int carCount;

  Seller({
    //required this.dealerType,
    required this.dealerName,
    required this.dealerInfo,
    required this.latitude,
    required this.longitude,
    required this.carCount,
    required this.contactFrom,
    required this.contactTo,
    required this.phoneNumber,
  });

  List<MarksWithAnnouncementEntity> marks = [
    MarksWithAnnouncementEntity(imageUrl: '', mark: 'BMW', quantity: 24),
    MarksWithAnnouncementEntity(imageUrl: '', mark: 'BMW', quantity: 24),
    MarksWithAnnouncementEntity(imageUrl: '', mark: 'BMW', quantity: 24),
    MarksWithAnnouncementEntity(imageUrl: '', mark: 'BMW', quantity: 24),
    MarksWithAnnouncementEntity(imageUrl: '', mark: 'BMW', quantity: 24),
    MarksWithAnnouncementEntity(imageUrl: '', mark: 'BMW', quantity: 24),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate: SellerSliverDelegate(
                  minHeight: MediaQuery.of(context).size.height * 0.11,
                  showroomOrPerson: 'Avtasalon'),
            ),
          ],
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SellerInfo(
                  //dealerType: dealerType,
                  dealerName: dealerName,
                  quantityOfCars: carCount,
                  contactFrom: contactFrom,
                  contactTo: contactTo,
                  contact: phoneNumber,
                  additionalInfo: dealerInfo,
                  longitude: longitude,
                  latitude: latitude,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          LocaleKeys.all_brands_with_ads.tr(),
                          style: const TextStyle(
                            color: orange,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              fade(
                                  page:
                                      AllMarksWithAnnouncements(marks: marks)));
                        },
                        child: Row(
                          children: [
                            Text(
                              LocaleKeys.all.tr(),
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: greyText),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            SvgPicture.asset(AppIcons.chevronRightBlack,
                                color: greyText)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      marks.length,
                      (index) => const MarksWithAnnouncements(
                        quantity: 12,
                        imageUrl: AppImages.placeHolder,
                        mark: 'BMW',
                      ),
                    ),
                  ),
                ),
                // if (dealerType == 'showroom') ...{
                //   },
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 12),
                  child: Row(
                    children: [
                      const Expanded(
                          child: Text('Автомобили от Orient Motors',
                              style: TextStyle(
                                  color: orange,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600))),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              LocaleKeys.all.tr(),
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: greyText),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            SvgPicture.asset(AppIcons.chevronRightBlack,
                                color: greyText)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      marks.length,
                          (index) => const AdsItem(name: '', price: '', location: '', description: '', image: '',),
                    ),
                  ),
                ),
                // const CarsCard(),
                // const CarsCard(),
                // const CarsCard(),
              ],
            ),
          ),
        ),
      );
}

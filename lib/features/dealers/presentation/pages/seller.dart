import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/dealers/domain/entities/models/marks_with_announcements.dart';
import 'package:auto/features/dealers/presentation/pages/all_marks_with_announcements.dart';
import 'package:auto/features/dealers/presentation/widgets/automobile_card.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_info.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_info_sliver_delegate.dart';
import 'package:auto/features/dealers/presentation/widgets/mark_with_announcement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Seller extends StatelessWidget {
  final String dealerType;
  Seller({required this.dealerType});
  List<MarksWithAnnouncementModel> marks = [
    MarksWithAnnouncementModel(imageUrl: '', mark: 'BMW', quantity: 24),
    MarksWithAnnouncementModel(imageUrl: '', mark: 'BMW', quantity: 24),
    MarksWithAnnouncementModel(imageUrl: '', mark: 'BMW', quantity: 24),
    MarksWithAnnouncementModel(imageUrl: '', mark: 'BMW', quantity: 24),
    MarksWithAnnouncementModel(imageUrl: '', mark: 'BMW', quantity: 24),
    MarksWithAnnouncementModel(imageUrl: '', mark: 'BMW', quantity: 24),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor:
            Theme.of(context).extension<ThemedColors>()!.solitudeTo1Black,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate: SellerSliverDelegate(
                  minHeight: MediaQuery.of(context).size.height * 0.11,
                  showroomOrPerson: dealerType),
            )
          ],
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SellerInfo(
                    dealerType: dealerType,
                    dealerName: dealerType,
                    quantityOfCars: 164,
                    workingHours: '9:00 - 21:00',
                    contact: '+998 90 872 54 45',
                    additionalInfo:
                        'Автомобили от популярных брендов, линейки всех категорий от семейного до представительского, шикарный дизайн! Плюс гарантия на год!',
                    longitude: 12.2,
                    latitude: 12.2),
                if (dealerType == 'showroom') ...{
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 12),
                    child: Row(
                      children: [
                        const Expanded(
                            child: Text('Все марки с объявлениями',
                                style: TextStyle(
                                    color: orange,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600))),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    AllMarksWithAnnouncements(marks: marks)));
                          },
                          child: Row(
                            children: [
                              const Text(
                                'все',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: greyText),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              SvgPicture.asset(AppIcons.chevronRight)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          marks.length,
                          (index) => const MarksWithAnnouncements(
                                quantity: 12,
                                imageUrl: AppImages.placeHolder,
                                mark: 'BMW',
                              )),
                    ),
                  ),
                },
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
                            const Text(
                              'все',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: greyText),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            SvgPicture.asset(AppIcons.chevronRight)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const CarsCard(),
                const CarsCard(),
                const CarsCard(),
              ],
            ),
          ),
        ),
      );
}

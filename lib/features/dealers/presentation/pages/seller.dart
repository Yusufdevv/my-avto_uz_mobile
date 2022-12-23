import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/dealers/domain/entities/marks_with_announcements.dart';
import 'package:auto/features/dealers/presentation/pages/all_marks_with_announcements.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_info.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_info_sliver_delegate.dart';
import 'package:auto/features/dealers/presentation/widgets/mark_with_announcement.dart';
import 'package:auto/features/main/domain/entities/ads_entity.dart';
import 'package:auto/features/main/domain/usecases/get_top_ads.dart';
import 'package:auto/features/main/presentation/bloc/top_ad/top_ad_bloc.dart';
import 'package:auto/features/main/presentation/widgets/ads_item.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Seller extends StatefulWidget {
  final String dealerType;
  final String dealerName;

  Seller({required this.dealerType, required this.dealerName});

  @override
  State<Seller> createState() => _SellerState();
}

class _SellerState extends State<Seller> {
  late TopAdBloc topAdBloc;
  List<MarksWithAnnouncementEntity> marks = [
    MarksWithAnnouncementEntity(imageUrl: '', mark: 'BMW', quantity: 24),
    MarksWithAnnouncementEntity(imageUrl: '', mark: 'BMW', quantity: 24),
    MarksWithAnnouncementEntity(imageUrl: '', mark: 'BMW', quantity: 24),
    MarksWithAnnouncementEntity(imageUrl: '', mark: 'BMW', quantity: 24),
    MarksWithAnnouncementEntity(imageUrl: '', mark: 'BMW', quantity: 24),
    MarksWithAnnouncementEntity(imageUrl: '', mark: 'BMW', quantity: 24),
  ];

  final List<AdsEntity> adsEntity = [
    const AdsEntity(
        imageUrl:
            'https://cdn.motor1.com/images/mgl/LBl63/s1/2021-genesis-g80.jpg',
        place: 'г. Ташкент',
        price: 13442343,
        aboutCar: 'Land Cruiser, 145 894 км,\nВнедорожник 5дв, АКПП, Дизел...',
        carName: 'Hyundai Genesis G90 long'),
    const AdsEntity(
        imageUrl:
            'https://cdn.motor1.com/images/mgl/LBl63/s1/2021-genesis-g80.jpg',
        place: 'г. Ташкент',
        price: 13442343,
        aboutCar: 'Land Cruiser, 145 894 км,\nВнедорожник 5дв, АКПП, Дизел...',
        carName: 'Hyundai Genesis G90 long'),
    const AdsEntity(
        imageUrl:
            'https://cdn.motor1.com/images/mgl/LBl63/s1/2021-genesis-g80.jpg',
        place: 'г. Ташкент',
        price: 13442343,
        aboutCar: 'Land Cruiser, 145 894 км,\nВнедорожник 5дв, АКПП, Дизел...',
        carName: 'Hyundai Genesis G90 long'),
    const AdsEntity(
        imageUrl:
            'https://cdn.motor1.com/images/mgl/LBl63/s1/2021-genesis-g80.jpg',
        place: 'г. Ташкент',
        price: 13442343,
        aboutCar: 'Land Cruiser, 145 894 км,\nВнедорожник 5дв, АКПП, Дизел...',
        carName: 'Hyundai Genesis G90 long'),
  ];
  @override
  void initState() {
    topAdBloc = TopAdBloc(GetTopAdsUseCase())..add(TopAdEvent.getTopAds());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: topAdBloc,
          ),
        ],
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
              SliverPersistentHeader(
                pinned: true,
                delegate: SellerSliverDelegate(
                    minHeight: MediaQuery.of(context).size.height * 0.11,
                    showroomOrPerson: widget.dealerType),
              ),
            ],
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SellerInfo(
                      dealerType: widget.dealerType,
                      dealerName: widget.dealerName,
                      quantityOfCars: 164,
                      workingHours: '9:00 - 21:00',
                      contact: '+998 90 872 54 45',
                      additionalInfo:
                          'Автомобили от популярных брендов, линейки всех категорий от семейного до представительского, шикарный дизайн! Плюс гарантия на год!',
                      longitude: 12.2,
                      latitude: 12.2),
                  //if (dealerType == 'showroom') ...{
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 12),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(LocaleKeys.all_brands_with_ads.tr(),
                                style: const TextStyle(
                                    color: orange,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600))),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                fade(
                                    page: AllMarksWithAnnouncements(
                                        marks: marks)));
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
                  // },
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
                  BlocBuilder<TopAdBloc, TopAdState>(
                      builder: (context, state) => SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                state.topAds.length,
                                (index) =>
                                    AdsItem(adsEntity: state.topAds[index]),
                              ),
                            ),
                          )),
                  // const CarsCard(),
                  // const CarsCard(),
                  // const CarsCard(),
                ],
              ),
            ),
          ),
        ),
      );
}

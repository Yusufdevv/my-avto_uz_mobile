import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/features/dealers/data/datasource/dealer_single_datasource.dart';
import 'package:auto/features/dealers/data/repositories/dealer_single_repository.dart';
import 'package:auto/features/dealers/domain/entities/marks_with_announcements.dart';
import 'package:auto/features/dealers/domain/usecases/dealer_single_usecase.dart';
import 'package:auto/features/dealers/presentation/blocs/dealer_single_bloc/dealer_single_bloc.dart';
import 'package:auto/features/dealers/presentation/pages/all_marks_with_announcements.dart';
import 'package:auto/features/dealers/presentation/widgets/automobile_card.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_info.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_info_sliver_delegate.dart';
import 'package:auto/features/dealers/presentation/widgets/mark_with_announcement.dart';
import 'package:auto/features/main/domain/entities/ads_entity.dart';
import 'package:auto/features/main/presentation/widgets/ads_item.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Seller extends StatefulWidget {
  //final String dealerType;
  final String slug;

  const Seller({
    //required this.dealerType,
    required this.slug,
  });

  @override
  State<Seller> createState() => _SellerState();
}

class _SellerState extends State<Seller> {
  late DealerSingleBloc dealerSingleBloc;

  List<MarksWithAnnouncementEntity> marks = [
    MarksWithAnnouncementEntity(imageUrl: '', mark: 'BMW', quantity: 24),
    MarksWithAnnouncementEntity(imageUrl: '', mark: 'BMW', quantity: 24),
    MarksWithAnnouncementEntity(imageUrl: '', mark: 'BMW', quantity: 24),
    MarksWithAnnouncementEntity(imageUrl: '', mark: 'BMW', quantity: 24),
    MarksWithAnnouncementEntity(imageUrl: '', mark: 'BMW', quantity: 24),
    MarksWithAnnouncementEntity(imageUrl: '', mark: 'BMW', quantity: 24),
  ];

  @override
  void initState() {
    dealerSingleBloc = DealerSingleBloc(
      dealerSingleUseCase: DealerSingleUseCase(
        dealerSingle: DealerSingleRepositoryImpl(
          dataSource: DealerSingleDataSource(DioSettings().dio),
        ),
      ),
    )..add(DealerSingleEvent.getResults(slug: widget.slug));
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    dealerSingleBloc.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: dealerSingleBloc),
        ],
        child: Scaffold(
          body: BlocBuilder<DealerSingleBloc, DealerSingleState>(
            builder: (context, state1) => NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SellerSliverDelegate(
                      avatarImage: state1.dealerSingleEntity.avatar,
                      dealerName: state1.dealerSingleEntity.name,
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
                      dealerName: state1.dealerSingleEntity.name,
                      quantityOfCars: state1.dealerSingleEntity.carCount,
                      contactFrom: state1.dealerSingleEntity.contactFrom,
                      contactTo: state1.dealerSingleEntity.contactTo,
                      contact: state1.dealerSingleEntity.phoneNumber,
                      additionalInfo: state1.dealerSingleEntity.description,
                      longitude: state1.dealerSingleEntity.longitude,
                      latitude: state1.dealerSingleEntity.latitude,
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
                          (index) =>  AdsItem(id:  2,image: '',name: 'BMW7',currency: 'UZS',description: 'One day it will be my new car!',isLiked: false,location: 'Tashkent',onTapLike: (){},price: '2308',)
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
          ),
        ),
      );
}

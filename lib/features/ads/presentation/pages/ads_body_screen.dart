import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ads/presentation/widgets/filters_buttons_widget.dart';
import 'package:auto/features/ads/presentation/widgets/no_data_widget.dart';
import 'package:auto/features/car_single/presentation/car_single_screen.dart';
import 'package:auto/features/commercial/presentation/widgets/commercial_car_model_item.dart';
import 'package:auto/features/commercial/presentation/widgets/info_container.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/comparison/domain/entities/announcement_list_entity.dart';
import 'package:auto/features/comparison/presentation/pages/choose_car_brand.dart';
import 'package:auto/features/comparison/presentation/pages/choose_model.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AdsBodyScreen extends StatefulWidget {
  final ScrollController scrollController;
  final bool? isNew;
  final bool isEmpty;
  const AdsBodyScreen({
    required this.scrollController,
    required this.isEmpty,
    this.isNew,
    super.key,
  });

  @override
  State<AdsBodyScreen> createState() => _AdsBodyScreenState();
}

class _AdsBodyScreenState extends State<AdsBodyScreen> {
  late List<AnnouncementListEntity> announcementList;
  @override
  void initState() {
    if (widget.isEmpty) {
      context.read<AnnouncementListBloc>().add(AnnouncementListEvent.getFilter(
          context.read<AnnouncementListBloc>().state.filter.copyWith(
                isNew: widget.isNew,
              )));
      context
          .read<AnnouncementListBloc>()
          .add(AnnouncementListEvent.getAnnouncementList());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).extension<ThemedColors>()!;
    return BlocBuilder<AnnouncementListBloc, AnnouncementListState>(
      builder: (context, state) {
        if (widget.isNew == true) {
          announcementList = state.announcementListNew;
        } else if (widget.isNew == false) {
          announcementList = state.announcementListOld;
        } else {
          announcementList = state.announcementList;
        }
        final list = List<AnnouncementListEntity>.from(state.announcementList);
        if (state.status == FormzStatus.submissionInProgress) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state.status == FormzStatus.submissionSuccess ||
            state.status == FormzStatus.submissionFailure) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            controller: widget.scrollController,
            children: [
              const SizedBox(height: 16),
              CommercialCarModelItem(
                  title: context.read<GetMakesBloc>().state.name,
                  subtitle: context.read<GetCarModelBloc>().state.name,
                  imageUrl: context.read<GetMakesBloc>().state.imageUrl,
                  onTap: () {
                    Navigator.push(
                        context,
                        fade(
                            page: ChooseCarBrandComparison(
                                isClear: false,
                                onTap: () => Navigator.of(context)
                                        .push(fade(
                                            page: ChooseCarModelComparison(
                                                isClear: false,
                                                onTap: () {
                                                  context
                                                      .read<
                                                          AnnouncementListBloc>()
                                                      .add(AnnouncementListEvent
                                                          .getFilter(
                                                        state.filter.copyWith(
                                                            make: context
                                                                .read<
                                                                    GetMakesBloc>()
                                                                .state
                                                                .selectId,
                                                            model: context
                                                                .read<
                                                                    GetCarModelBloc>()
                                                                .state
                                                                .selectedId),
                                                      ));
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                })))
                                        .then((value) {
                                      context.read<AnnouncementListBloc>().add(
                                          AnnouncementListEvent.getIsHistory(
                                              context
                                                      .read<GetMakesBloc>()
                                                      .state
                                                      .selectId <=
                                                  0));
                                      context.read<AnnouncementListBloc>().add(
                                          AnnouncementListEvent
                                              .getAnnouncementList());
                                    }))));
                  }),
              const SizedBox(height: 12),
              FilterButtonsWidget(size: size, theme: theme),
              const SizedBox(height: 16),
              if (announcementList.isNotEmpty)
                ...List.generate(
                  announcementList.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(fade(
                            page: CarSingleScreen(
                                id: announcementList[index].id)));
                      },
                      child: InfoContainer(
                        index: index,
                        phone: announcementList[index].userType == 'owner'
                            ? announcementList[index].user.phoneNumber
                            : announcementList[index].dealer.phoneNumber,
                        avatarPicture: announcementList[index].user.avatar,
                        carModel: announcementList[index].model,
                        hasDiscount: announcementList[index].discount != 0,
                        location: announcementList[index].region,
                        owner: announcementList[index].user.name.isNotEmpty
                            ? announcementList[index].user.name
                            : announcementList[index].user.fullName,
                        ownerType: announcementList[index].userType,
                        publishTime: MyFunctions.getDateNamedMonthEdit(
                            announcementList[index].publishedAt),
                        subtitle: announcementList[index].description,
                        year: announcementList[index].year,
                        price: MyFunctions.getFormatCost(
                            announcementList[index].price.toString()),
                        discountPrice: announcementList[index].discount == 0
                            ? ''
                            : announcementList[index].discount.toString(),
                        sellType: '',
                        hasStatusInfo: announcementList[index].isNew,
                        gallery: announcementList[index].gallery,
                        currency: announcementList[index].currency,
                        initialLike: list[index].isWishlisted,
                        id: announcementList[index].id,
                        onTapComparsion: () {},
                        onTapFavorites: () {},
                        initialComparsions: list[index].isComparison,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 90),
              if (announcementList.isEmpty) const NoDataWidget(),
            ],
          );
        }
        return const Center(
          child: Text('Error'),
        );
      },
    );
  }
}

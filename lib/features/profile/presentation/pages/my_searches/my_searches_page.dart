import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/ads/presentation/pages/ads_screen.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/features/profile/domain/entities/my_searches_entity.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/bloc/user_wishlists_notifications/user_wishlists_notification_bloc.dart';
import 'package:auto/features/profile/presentation/widgets/custom_profile_bottomsheet.dart';
import 'package:auto/features/profile/presentation/widgets/empty_item_body.dart';
import 'package:auto/features/profile/presentation/widgets/my_search_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class MySearchesPage extends StatefulWidget {
  const MySearchesPage({super.key});

  @override
  State<MySearchesPage> createState() => _MySearchesPageState();
}

class _MySearchesPageState extends State<MySearchesPage> {
  late UserWishListsBloc bloc;

  @override
  void initState() {
    bloc = UserWishListsBloc()..add(GetMySearchesEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  List<MySearchesEntity> mySearches = [];
  List<MySearchesEntity> deletedList = [];
  bool isToggled = false;
  bool isDeleted = false;

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: bloc,
        child: CustomScreen(
          child: BlocBuilder<UserWishListsBloc, UserWishListsState>(
            builder: (context, st) {
              if (st.myAdsStatus.isSubmissionInProgress) {
                return const Center(child: CupertinoActivityIndicator());
              }
              if (st.myAdsStatus.isSubmissionSuccess) {
                mySearches = st.mySearches;
                return Scaffold(
                  appBar: WAppBar(
                    textWithButton: LocaleKeys.my_searchs.tr(),
                    extraActions: [
                      if (st.myAdsStatus.isSubmissionSuccess)
                        if (mySearches.isNotEmpty)
                          WScaleAnimation(
                            onTap: () {
                              if (mySearches.isNotEmpty) {
                                if (isToggled) {
                                  deletedList.clear();
                                }
                                setState(() {
                                  isToggled = !isToggled;
                                });
                              }
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: isToggled
                                  ? Text(
                                      LocaleKeys.cancell.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(color: red, height: 1.3),
                                    )
                                  : SvgPicture.asset(AppIcons.delete,
                                      color: grey),
                            ),
                          )
                    ],
                  ),
                  body: Builder(builder: (context) {
                    if (st.myAdsStatus.isSubmissionSuccess) {
                      return mySearches.isNotEmpty
                          ? Paginator(
                              errorWidget: const SizedBox(),
                              hasMoreToFetch: st.moreFetchMySearches,
                              fetchMoreFunction: () {
                                bloc.add(GetMoreMySearchesEvent());
                              },
                              paginatorStatus: st.myAdsStatus,
                              itemCount: mySearches.length,
                              itemBuilder: (context, index) {
                                final item = mySearches[index];
                                return MySearchItem(
                                    onTap: () {
                                      if (isToggled) {
                                        if (deletedList
                                            .contains(mySearches[index])) {
                                          setState(() {
                                            deletedList
                                                .remove(mySearches[index]);
                                          });
                                        } else {
                                          setState(() {
                                            deletedList.add(mySearches[index]);
                                          });
                                        }
                                      } else {
                                        Navigator.push(
                                          context,
                                          fade(
                                              page: AdsScreen(
                                            historyId: mySearches[index].id,
                                            historySaved: true,
                                            makeId: mySearches[index].make?.id,
                                            modelId: mySearches[index]
                                                .model
                                                ?.first
                                                ?.id,
                                            makeName:
                                                mySearches[index].make?.name,
                                            modelName: mySearches[index]
                                                .model
                                                ?.first
                                                ?.name,
                                            makeLogo:
                                                mySearches[index].make?.logo,
                                            queryData:
                                                mySearches[index].queryData,
                                          )),
                                        );
                                      }
                                    },
                                    item: item,
                                    index: index,
                                    isToggled: isToggled,
                                    deletedList: deletedList,
                                    mySearches: mySearches);
                              },
                            )
                          : Center(
                              child: EmptyItemBody(
                                  title: LocaleKeys.no_results.tr(),
                                  subtitle:
                                      LocaleKeys.your_saved_searches_will.tr(),
                                  image: AppIcons.emptyFolder),
                            );
                    }
                    return const SizedBox();
                  }),
                  bottomNavigationBar: isToggled
                      ? WButton(
                          text: LocaleKeys.delete.tr(),
                          color: deletedList.isNotEmpty ? orange : grey,
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.h(16),
                              vertical: SizeConfig.v(16)),
                          onTap: () {
                            deletedList.isNotEmpty
                                ? showModalBottomSheet(
                                    context: context,
                                    builder: (context) =>
                                        CustomProfileBottomsheet(
                                      title: LocaleKeys.a_y_s_y_w_to_d.tr(),
                                      subTitle:
                                          LocaleKeys.del_is_non_refundable.tr(),
                                      betweenHeight: 36,
                                      onTap: () {
                                        isDeleted = !isDeleted;
                                        bloc.add(DeleteMySearchesEvent(
                                            ids: deletedIds(deletedList)));
                                        setState(() {});
                                        mySearches.removeWhere(
                                            (e) => deletedList.contains(e));
                                        context
                                            .read<ProfileBloc>()
                                            .add(GetProfileEvent());
                                        deletedList.clear();
                                        isToggled = false;
                                        Navigator.pop(context);
                                        context
                                            .read<ProfileBloc>()
                                            .add(GetProfileEvent());
                                      },
                                    ),
                                  )
                                : context.read<ShowPopUpBloc>().add(ShowPopUp(
                                    status: PopStatus.error,
                                    message: LocaleKeys.select_first_to_delete
                                        .tr()));
                          },
                        )
                      : const SizedBox(),
                );
              }
              return Center(child: Text(LocaleKeys.error.tr()));
            },
          ),
        ),
      );

  List<int> deletedIds(List<MySearchesEntity> list) {
    final result = <int>[];

    for (var i = 0; i < list.length; i++) {
      if (list[i].id != null) {
        result.add(list[i].id!);
      }
    }
    return result;
  }
}

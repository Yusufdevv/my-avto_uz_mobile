import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/ads/presentation/pages/ads_screen.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';
import 'package:auto/features/profile/domain/entities/my_searches_entity.dart';
import 'package:auto/features/profile/domain/usecases/get_my_searches_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_notification_single_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_notification_usecase.dart';
import 'package:auto/features/profile/domain/usecases/profil_favorites_usecase.dart';
import 'package:auto/features/profile/presentation/bloc/user_wishlists_notifications/user_wishlists_notification_bloc.dart';
import 'package:auto/features/profile/presentation/widgets/custom_profile_bottomsheet.dart';
import 'package:auto/features/profile/presentation/widgets/empty_item_body.dart';
import 'package:auto/features/profile/presentation/widgets/my_search_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class MySearchesPage extends StatefulWidget {
  const MySearchesPage({super.key});

  @override
  State<MySearchesPage> createState() => _MySearchesPageState();
}

class _MySearchesPageState extends State<MySearchesPage> {
  late UserWishListsBloc bloc;

  @override
  void initState() { 
    bloc = UserWishListsBloc(
         )
      ..add(GetMySearchesEvent());
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
          child: Scaffold(
            appBar: WAppBar(
              textWithButton: LocaleKeys.my_searchs.tr(),
              extraActions: [
                if (mySearches.isNotEmpty)
                  WScaleAnimation(
                    onTap: () {
                      if (mySearches.isNotEmpty) {
                        setState(() {
                          isToggled = !isToggled;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: isToggled
                          ? Text(
                              LocaleKeys.cancell.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(color: red, height: 1.3),
                            )
                          : SvgPicture.asset(AppIcons.delete, color: grey),
                    ),
                  )
              ],
            ),
            body: BlocBuilder<UserWishListsBloc, UserWishListsState>(
              builder: (context, st) {
                if (st.myAdsStatus.isSubmissionInProgress) {
                  return const Center(child: CupertinoActivityIndicator());
                }
                if (st.myAdsStatus.isSubmissionSuccess) {
                  mySearches = st.mySearches;
                  return mySearches.isNotEmpty
                      ? ListView.builder(
                          itemCount: mySearches.length,
                          itemBuilder: (context, index) {
                            final item = mySearches[index];
                            return GestureDetector(
                              onTap: () {
                                if (isToggled) {
                                  if (deletedList.contains(mySearches[index])) {
                                    setState(() {
                                      deletedList.remove(mySearches[index]);
                                    });
                                  } else {
                                    setState(() {
                                      deletedList.add(mySearches[index]);
                                    });
                                  }
                                } else {
                                  context.read<AnnouncementListBloc>().add(
                                      AnnouncementListEvent.getFilter(context
                                          .read<AnnouncementListBloc>()
                                          .state
                                          .filter
                                          .copyWith(
                                              make: item.make?.id,
                                              model: item.model?[0]?.id)));
                                  context.read<AnnouncementListBloc>().add(
                                      AnnouncementListEvent
                                          .getAnnouncementList());
                                  Navigator.push(
                                      context,
                                      fade(
                                          page: AdsScreen(
                                        isBack: false,
                                        onTap: () {},
                                      )));
                                }
                              }, behavior: HitTestBehavior.opaque,
                              child: MySearchItem(
                                  item: item,
                                  index: index,
                                  isToggled: isToggled,
                                  deletedList: deletedList,
                                  mySearches: mySearches),
                            );
                          },
                        )
                      :   Center(
                          child: EmptyItemBody(
                              title:LocaleKeys.no_notice.tr(),
                              subtitle:
                                  LocaleKeys.your_saved_searches_will.tr(),
                              image: AppIcons.emptyFolder),
                        );
                }
                return   Center(child: Text(LocaleKeys.error.tr()));
              },
            ),
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
                              builder: (context) => CustomProfileBottomsheet(
                                title: LocaleKeys.a_y_s_y_w_to_d.tr(),
                                subTitle:  LocaleKeys.del_is_non_refundable.tr(),
                                betweenHeight: 36,
                                onTap: () {
                                  isDeleted = !isDeleted;
                                  bloc.add(DeleteMySearchesEvent(
                                      ids: deletedIds(deletedList)));
                                  setState(() {});
                                  mySearches.removeWhere(
                                      (e) => deletedList.contains(e));
                                  deletedList.clear();
                                  isToggled = false;
                                  Navigator.pop(context);
                                },
                              ),
                            )
                          : context.read<ShowPopUpBloc>().add(ShowPopUp(
                              isSucces: false,
                              message: LocaleKeys.select_first_to_delete.tr()));
                    },
                  )
                : const SizedBox(),
          ),
        ),
      );

  List<int> deletedIds(List<MySearchesEntity> list) {
    List<int> result = <int>[];

    for (var i = 0; i < list.length; i++) {
      if (list[i].id != null) {
        result.add(list[i].id!);
      }
    }
    return result;
  }
}

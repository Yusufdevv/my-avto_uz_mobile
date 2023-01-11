import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/ad/presentation/pages/ads/ads_screen.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';
import 'package:auto/features/profile/domain/entities/my_searches_entity.dart';
import 'package:auto/features/profile/domain/usecases/get_my_searches_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_notification_single.dart';
import 'package:auto/features/profile/domain/usecases/get_notification_usecase.dart';
import 'package:auto/features/profile/domain/usecases/profil_favorites_usecase.dart';
import 'package:auto/features/profile/presentation/bloc/user_wishlists_notifications/user_wishlists_notification_bloc.dart';
import 'package:auto/features/profile/presentation/widgets/empty_item_body.dart';
import 'package:auto/features/profile/presentation/widgets/log_out_bottomsheet.dart';
import 'package:auto/features/profile/presentation/widgets/my_search_item.dart';
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
    final repo = serviceLocator<GetUserListRepoImpl>();
    bloc = UserWishListsBloc(
        profileFavoritesMyAdsUseCase:
            GetUserFavoritesMyAdsUseCase(repository: repo),
        getNotificationSingleUseCase:
            GetNotificationSingleUseCase(repository: repo),
        getNotificationsUseCase: GetNotificationsUseCase(repository: repo),
        getMySearchesUseCase: GetMySearchesUseCase(repository: repo))
      ..add(GetMySearchesEvent());
    super.initState();
  }

  List mySearches = [];
  List deletedList = [];
  bool isToggled = false;
  bool isDeleted = false;
  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: bloc,
        child: CustomScreen(
          child: Scaffold(
            appBar: WAppBar(
              textWithButton: 'Мои поиски',
              extraActions: [
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
                            'Отменить',
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
                            final MySearchesEntity item = mySearches[index];
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
                                              make: item.make!.id,
                                              model: item.model![0]!.id)));
                                  context.read<AnnouncementListBloc>().add(
                                      AnnouncementListEvent
                                          .getAnnouncementList());
                                  Navigator.push(context, fade(page: AdsScreen(
                                    onBack: () {
                                      Navigator.pop(context);
                                    },
                                  )));
                                }
                              },
                              child: MySearchItem(
                                  item: item,
                                  index: index,
                                  isToggled: isToggled,
                                  deletedList: deletedList,
                                  mySearches: mySearches),
                            );
                          },
                        )
                      : const Center(
                          child: EmptyItemBody(
                              title: 'Нет уведомлении',
                              subtitle:
                                  'Ваши сохранённые поиски будут отображаться в данном разделе.',
                              image: AppIcons.emptyFolder),
                        );
                }
                return const Center(child: Text('Xatolik!'));
              },
            ),
            bottomNavigationBar: isToggled
                ? WButton(
                    text: 'Удалить',
                    color: deletedList.isNotEmpty ? orange : grey,
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.h(16),
                        vertical: SizeConfig.v(16)),
                    onTap: () {
                      deletedList.isNotEmpty
                          ? showModalBottomSheet(
                              context: context,
                              builder: (context) => CustomProfileBottomsheet(
                                title: 'Вы действительно \nхотите удалить?',
                                subTitle: 'Удаление возврату не поддлежит',
                                betweenHeight: 36,
                                onTap: () {
                                  isDeleted = !isDeleted;
                                  mySearches.removeWhere(
                                      (e) => deletedList.contains(e));
                                  deletedList.clear();
                                  isToggled = false;

                                  Navigator.pop(context);
                                  // context.read<WishlistAddBloc>().add(
                            // WishlistAddEvent.removeWishlist(widget.id,
                            //     '/users/wishlist/announcement/remove/'));
                                  setState(() {});
                                },
                              ),
                            )
                          : context.read<ShowPopUpBloc>().add(ShowPopUp(
                              isSucces: false,
                              message: "O'chirish uchun avval tanlang"));
                    },
                  )
                : const SizedBox(),
          ),
        ),
      );
}

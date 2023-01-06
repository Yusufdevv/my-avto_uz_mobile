import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/widgets/empty_item_body.dart';
import 'package:auto/features/search/presentation/widgets/info_result_container.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({required this.profileBloc, Key? key}) : super(key: key);
  final ProfileBloc profileBloc;

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  void initState() {
    widget.profileBloc.add(GetProfileFavoritesEvent(
        endpoint: '/users/wishlist/announcement/list/'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: widget.profileBloc,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: WAppBar(
            title: LocaleKeys.favorites.tr(),
            centerTitle: false,
          ),
          body: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state.secondStatus.isSubmissionFailure) {
                return const Center(
                  child: Text('Xatolik!'),
                );
              }
              if (state.secondStatus.isSubmissionInProgress) {
                return const Center(
                    child: CupertinoActivityIndicator(
                  color: white,
                ));
              }
              if (state.secondStatus.isSubmissionSuccess &&
                  state.autoEntity.isNotEmpty) {
                final favorites = state.autoEntity;
                ListView.builder(
                    itemCount: favorites.length,
                    itemBuilder: (context, index) {
                      final item = favorites[index];
                      return InfoResultContainer(
                          gallery: item.gallery,
                          carModelName: item.model.name,
                          carYear: item.year,
                          contactPhone: item.contactPhone,
                          description: item.description,
                          districtTitle: item.district.title,
                          isNew: item.isNew,
                          isWishlisted: item.isWishlisted,
                          price: item.price,
                          id: item.id,
                          publishedAt: item.publishedAt,
                          userFullName: item.user.fullName,
                          userImage: item.user.image,
                          userType: item.userType,
                          hasComparison: item.isComparison,
                          callFrom: item.contactAvailableFrom,
                          callTo: item.contactAvailableTo,
                          discount: item.discount);
                    });
              }
              if (state.secondStatus.isSubmissionSuccess &&
                  state.autoEntity.isEmpty) {
                return const EmptyItemBody(title: 'У вас еще нет объявлений');
              }
              return const EmptyItemBody(title: 'Xatolik!');
            },
          ),
        ),
      );
}

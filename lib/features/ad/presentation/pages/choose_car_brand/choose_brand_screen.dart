import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ad/presentation/bloc/bloc/choose_make_anime_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/car_items.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/persistant_header.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/persistent_header_search.dart';
import 'package:auto/features/common/widgets/car_brand_item.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/main/presentation/widgets/brand_shimmer_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ChooseCarBrand extends StatefulWidget {
  final int tabLength;
  final Function(MakeEntity) onTopBrandPressed;
  final PostingAdBloc postingAddBloc;

  const ChooseCarBrand({
    required this.tabLength,
    required this.postingAddBloc,
    required this.onTopBrandPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<ChooseCarBrand> createState() => _ChooseCarBrandState();
}

class _ChooseCarBrandState extends State<ChooseCarBrand> {
  late ScrollController _nestsController;
  late ScrollController _makesController;
  late ColorTween _bgTweenColor;
  late ColorTween _fillTweenColor;
  late ColorTween _headerTextTweenColor;

  @override
  void initState() {
    _fillTweenColor = ColorTween(
      begin: whiteSmoke,
      end: white,
    );
    _bgTweenColor = ColorTween(
      begin: white,
      end: whiteSmoke,
    );
    _headerTextTweenColor = ColorTween(
      begin: white,
      end: const Color(0xff171725),
    );
    _nestsController = ScrollController()..addListener(_nestListener);
    _makesController = ScrollController()..addListener(_makesListener);
    super.initState();
  }

  void _nestListener() {
    if (ScrollDirection.reverse ==
        _nestsController.position.userScrollDirection) {
      if (!BlocProvider.of<ChooseMakeAnimeBloc>(context, listen: false)
              .state
              .isAnimating &&
          !BlocProvider.of<ChooseMakeAnimeBloc>(context, listen: false)
              .state
              .isCollapsed) {
        context.read<ChooseMakeAnimeBloc>().add(
            ChooseMakeAnimeChangeParamsEvent(
                where: 'Nest if', isAnimating: true, isCollapsed: true));
        context
            .read<ChooseMakeAnimeBloc>()
            .state
            .animationController
            .forward()
            .then((value) => context.read<ChooseMakeAnimeBloc>().add(
                ChooseMakeAnimeChangeParamsEvent(
                    where: 'Nest if then', isAnimating: false)))
            .then((value) {
          widget.postingAddBloc
              .add(PostingAdChangeAppBarShadowEvent(value: false));
        });
      }
    } else {
      if (!BlocProvider.of<ChooseMakeAnimeBloc>(context, listen: false)
              .state
              .isAnimating &&
          BlocProvider.of<ChooseMakeAnimeBloc>(context, listen: false)
              .state
              .isCollapsed) {
        context.read<ChooseMakeAnimeBloc>().add(
            ChooseMakeAnimeChangeParamsEvent(
                where: 'Nest else', isAnimating: true, isCollapsed: false));
        widget.postingAddBloc
            .add(PostingAdChangeAppBarShadowEvent(value: true));
        context
            .read<ChooseMakeAnimeBloc>()
            .state
            .animationController
            .reverse()
            .then((value) => context.read<ChooseMakeAnimeBloc>().add(
                ChooseMakeAnimeChangeParamsEvent(
                    where: 'Nest else then', isAnimating: false)));
      }
    }
  }

  void _makesListener() {
    if (ScrollDirection.reverse ==
        _makesController.position.userScrollDirection) {
      if (!BlocProvider.of<ChooseMakeAnimeBloc>(context, listen: false)
              .state
              .isAnimating &&
          !BlocProvider.of<ChooseMakeAnimeBloc>(context, listen: false)
              .state
              .isCollapsed) {
        context.read<ChooseMakeAnimeBloc>().add(
            ChooseMakeAnimeChangeParamsEvent(
                where: 'Make if ', isAnimating: true, isCollapsed: true));
        context
            .read<ChooseMakeAnimeBloc>()
            .state
            .animationController
            .forward()
            .then((value) => context.read<ChooseMakeAnimeBloc>().add(
                ChooseMakeAnimeChangeParamsEvent(
                    where: 'Make if then',
                    isAnimating: false,
                    isCollapsed: true)))
            .then((value) {
          widget.postingAddBloc
              .add(PostingAdChangeAppBarShadowEvent(value: false));
        });
      }
    } else {
      if (!BlocProvider.of<ChooseMakeAnimeBloc>(context, listen: false)
              .state
              .isAnimating &&
          BlocProvider.of<ChooseMakeAnimeBloc>(context, listen: false)
              .state
              .isCollapsed) {
        context.read<ChooseMakeAnimeBloc>().add(
            ChooseMakeAnimeChangeParamsEvent(
                where: 'Make else', isAnimating: true, isCollapsed: false));
        widget.postingAddBloc
            .add(PostingAdChangeAppBarShadowEvent(value: true));
        context
            .read<ChooseMakeAnimeBloc>()
            .state
            .animationController
            .reverse()
            .then((value) => context.read<ChooseMakeAnimeBloc>().add(
                ChooseMakeAnimeChangeParamsEvent(
                    where: 'Make else then',
                    isAnimating: false,
                    isCollapsed: false)));
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ChooseMakeAnimeBloc, ChooseMakeAnimeState>(
        builder: (context, animeState) => KeyboardDismisser(
          child: BlocConsumer<PostingAdBloc, PostingAdState>(
            listener: (context, postingAddState) {
              if (postingAddState.makeLetterIndex != null &&
                  postingAddState.makeLetterIndex! > -1) {
                _makesController.animateTo(
                    postingAddState.makeLetterIndex! * 54,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear);
              }
            },
            builder: (context, state) => Scaffold(
              backgroundColor:
                  _bgTweenColor.evaluate(animeState.scaleAnimation),
              body: NestedScrollView(
                physics: const BouncingScrollPhysics(),
                controller: _nestsController,
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  /// HEADER TEXT
                  SliverToBoxAdapter(
                    child: FadeTransition(
                      opacity: animeState.scaleAnimation,
                      child: SizeTransition(
                        axis: Axis.vertical,
                        sizeFactor: animeState.scaleAnimation,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 16,
                          ),
                          child: Text(
                            LocaleKeys.choose_brand_auto.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    color: _headerTextTweenColor
                                        .evaluate(animeState.scaleAnimation)),
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// SEARCH FIELD WITH PERSISTENT HEADER

                  SliverSafeArea(
                    top: false,
                    bottom: false,
                    sliver: SliverPersistentHeader(
                      delegate: PersistentHeaderSearch(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          color:
                              _bgTweenColor.evaluate(animeState.scaleAnimation),
                          padding: const EdgeInsets.only(top: 16, bottom: 12),
                          child: WTextField(
                            focusColor: _fillTweenColor
                                .evaluate(animeState.scaleAnimation),
                            fillColor: _fillTweenColor
                                .evaluate(animeState.scaleAnimation),
                            filled: true,
                            margin: const EdgeInsets.only(left: 16, right: 16),
                            onChanged: (value) => widget.postingAddBloc
                                .add(PostingAdSearchMakesEvent(name: value)),
                            borderRadius: 12,
                            borderColor: purple,
                            hasSearch: true,
                            hintText: LocaleKeys.search.tr(),
                            height: 40,
                            controller: state.searchController,
                            hasClearButton: true,
                            textStyle: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                            onClear: () {
                              context
                                  .read<PostingAdBloc>()
                                  .add(PostingAdSerchControllerClearEvent());
                            },
                          ),
                        ),
                      ),
                      pinned: true,
                    ),
                  ),

                  /// TOP CAR BRANDS
                  SliverToBoxAdapter(
                    child: SizeTransition(
                      axis: Axis.vertical,
                      sizeFactor: animeState.scaleAnimation,
                      child: FadeTransition(
                        opacity: animeState.scaleAnimation,
                        child: SizedBox(
                          height: 120,
                          child: state.status ==
                                  FormzStatus.submissionInProgress
                              ? ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(width: 12),
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, top: 16, bottom: 16),
                                  itemCount: 5,
                                  itemBuilder: (context, index) =>
                                      BrandShimmerItem(),
                                )
                              : ListView.separated(
                                  itemCount: state.topMakes.length,
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 0, 16, 20),
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => CarBrandItem(
                                        carBrandEntity: state.topMakes[index],
                                        onTap: () {
                                          widget.onTopBrandPressed(
                                              state.topMakes[index]);
                                        },
                                      ),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(width: 12)),
                        ),
                      ),
                    ),
                  ),

                  /// SIZED BOX
                  SliverToBoxAdapter(
                    child: SizeTransition(
                      axis: Axis.vertical,
                      sizeFactor: animeState.scaleAnimation,
                      child: Container(
                        height: 20,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .whiteToDark,
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20),
                            )),
                      ),
                    ),
                  ),

                  /// LETTER BUTTONS
                  SliverSafeArea(
                    top: false,
                    bottom: false,
                    sliver: SliverPersistentHeader(
                      delegate: Header(),
                      pinned: true,
                    ),
                  ),
                ],
                body: Container(
                  color:
                      Theme.of(context).extension<ThemedColors>()!.whiteToDark,
                  child: state.getMakesStatus ==
                          FormzStatus.submissionInProgress
                      ? Center(
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              const CupertinoActivityIndicator(),
                              const SizedBox(height: 12),
                              Text(
                                LocaleKeys.loading_data.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                              )
                            ]))
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          controller: _makesController,
                          padding: const EdgeInsets.only(bottom: 66),
                          itemBuilder: (context, index) => ChangeCarItems(
                            hasBorder: (state.makes.length - 1) != index,
                            onTap: () {
                              context.read<PostingAdBloc>().add(
                                PostingAdChooseEvent(
                                  make: state.makes[index],
                                ),
                              );
                            },
                            selectedId:
                            context.watch<PostingAdBloc>().state.make?.id ??
                                -1,
                            id: state.makes[index].id,
                            imageUrl: state.makes[index].logo,
                            name: state.makes[index].name,
                            text: state.searchController.text,
                          ),
                          itemCount: state.makes.length,
                        ),
                ),
              ),
            ),
          ),
        ),
      );
}

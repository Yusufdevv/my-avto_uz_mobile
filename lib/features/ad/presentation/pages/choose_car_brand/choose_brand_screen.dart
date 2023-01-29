import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/bloc/choose_make_anime_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/car_items.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/choose_brand_app_bar.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/persistant_header.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/persistent_header_search.dart';
import 'package:auto/features/common/widgets/car_brand_item.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
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
  final Function(int) onTopBrandPressed;
  final PostingAdBloc bloc;
  const ChooseCarBrand({
    required this.tabLength,
    required this.bloc,
    required this.onTopBrandPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<ChooseCarBrand> createState() => _ChooseCarBrandState();
}

class _ChooseCarBrandState extends State<ChooseCarBrand>
    with SingleTickerProviderStateMixin {
  late ScrollController _nestsControllerr;
  late ScrollController _makesController;
  late TextEditingController searchController;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _reverseScaleAnimation;
  late ColorTween _bgTweenColor;
  late ColorTween _fillTweenColor;
  late ColorTween _headerTextTweenColor;
  late ChooseMakeAnimeBloc animeBloc;

  @override
  void initState() {
    animeBloc = ChooseMakeAnimeBloc();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
        curve: Curves.decelerate,
        parent: _animationController,
      ),
    )..addListener(() {
        setState(() {});
      });
    _reverseScaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        curve: Curves.decelerate,
        parent: _animationController,
      ),
    );

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
      end: Colors.black,
    );
    _nestsControllerr = ScrollController();
    _makesController = ScrollController()..addListener(_makesListener);
    searchController = TextEditingController();

    super.initState();
  }

  void _makesListener() {
    if (ScrollDirection.reverse ==
        _makesController.position.userScrollDirection) {
      if (!animeBloc.state.isAnimating) {
        context
            .read<ChooseMakeAnimeBloc>()
            .add(ChooseMakeAnimeEvent(isAnimating: true, isCollapsed: true));
        _animationController
            .forward()
            .then((value) => context.read<ChooseMakeAnimeBloc>().add(
                ChooseMakeAnimeEvent(isAnimating: false, isCollapsed: true)))
            .then((value) {
          widget.bloc.add(PostingAdChangeAppBarShadowEvent(value: false));
        });
      }
    } else {
      if (!animeBloc.state.isAnimating) {
        print('====  reverse 0  ====');
        context
            .read<ChooseMakeAnimeBloc>()
            .add(ChooseMakeAnimeEvent(isAnimating: true, isCollapsed: false));
        widget.bloc.add(PostingAdChangeAppBarShadowEvent(value: true));
        _animationController.reverse().then((value) => context
            .read<ChooseMakeAnimeBloc>()
            .add(ChooseMakeAnimeEvent(isAnimating: false, isCollapsed: false)));
      }
    }
  }

  bool _isShowFirst(int index) => index == 0;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ChooseMakeAnimeBloc, ChooseMakeAnimeState>(
        builder: (context, state) => KeyboardDismisser(
          child: BlocConsumer<PostingAdBloc, PostingAdState>(
            listener: (context, state) {
              if (state.makeLetterIndex != null &&
                  state.makeLetterIndex! > -1) {
                _makesController.animateTo(state.makeLetterIndex! * 54,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear);
              }
            },
            builder: (context, state) => Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(54),
                child: ChooseBrandAppBar(
                  reversScaleAnimation: _reverseScaleAnimation,
                  reverseTitle: 'revers titile',
                  scaleAnimation: _scaleAnimation,
                  title: 'title',
                ),
              ),
              backgroundColor: _bgTweenColor.evaluate(_scaleAnimation),
              body: NestedScrollView(
                controller: _nestsControllerr,
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  /// HEADER TEXT
                  SliverToBoxAdapter(
                    child: FadeTransition(
                      opacity: _scaleAnimation,
                      child: SizeTransition(
                        axis: Axis.vertical,
                        sizeFactor: _scaleAnimation,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 16,
                          ),
                          child: Text(
                            LocaleKeys.choose_brand_auto.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    color: _headerTextTweenColor
                                        .evaluate(_scaleAnimation)),
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
                          color: _bgTweenColor.evaluate(_scaleAnimation),
                          padding: const EdgeInsets.only(top: 16, bottom: 12),
                          child: WTextField(
                            fillColor:
                                _fillTweenColor.evaluate(_scaleAnimation),
                            filled: true,
                            margin: const EdgeInsets.only(left: 16, right: 16),
                            onChanged: (value) => () {},
                            borderRadius: 12,
                            hasSearch: true,
                            hintText: LocaleKeys.search.tr(),
                            height: 40,
                            controller: searchController,
                            hasClearButton: true,
                            textStyle: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
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
                      sizeFactor: _scaleAnimation,
                      child: FadeTransition(
                        opacity: _scaleAnimation,
                        child: SizedBox(
                          height: 120,
                          child: state.status ==
                                  FormzStatus.submissionInProgress
                              ? const Center(
                                  child: CupertinoActivityIndicator())
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
                                              state.topMakes[index].id);
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
                      sizeFactor: _scaleAnimation,
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
                  child: state.status == FormzStatus.submissionInProgress
                      ? const Center(child: CupertinoActivityIndicator())
                      : ListView.builder(
                          controller: _makesController,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(bottom: 50),
                          itemBuilder: (context, index) => ChangeCarItems(
                            onTap: () {
                              context.read<PostingAdBloc>().add(
                                    PostingAdChooseEvent(
                                      makeId: state.makes[index].id,
                                    ),
                                  );
                            },
                            selectedId:
                                context.watch<PostingAdBloc>().state.makeId ??
                                    -1,
                            id: state.makes[index].id,
                            imageUrl: state.makes[index].logo,
                            name: state.makes[index].name,
                            text: searchController.text,
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

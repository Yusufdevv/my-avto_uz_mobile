import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/car_items.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/persistant_header.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/persistent_header_search.dart';
import 'package:auto/features/ad/presentation/widgets/sliver_header_text.dart';
import 'package:auto/features/ads/presentation/pages/ads_screen.dart';
import 'package:auto/features/common/widgets/car_brand_item.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ChooseCarBrand extends StatefulWidget {
  final VoidCallback onTopBrandPressed;
  final PostingAdBloc bloc;
  const ChooseCarBrand({
    required this.bloc,
    required this.onTopBrandPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<ChooseCarBrand> createState() => _ChooseCarBrandState();
}

class _ChooseCarBrandState extends State<ChooseCarBrand> {
  CrossFadeState crossFadeState = CrossFadeState.showFirst;
  late ScrollController _scrollController;
  late ScrollController _makesController;
  late TextEditingController searchController;

  double height = 140;
  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_scrollListener);
    _makesController = ScrollController();
    searchController = TextEditingController();

    super.initState();
  }

  void _scrollListener() {
    if (widget.bloc.state.hasAppBarShadow == _isShrink) {
      widget.bloc.add(PostingAdChangeAppBarShadowEvent(value: !_isShrink));
    }

    if (_scrollController.offset > 55) {
      setState(() {
        crossFadeState = CrossFadeState.showSecond;
      });
    } else {
      setState(() {
        crossFadeState = CrossFadeState.showFirst;
      });
    }
  }

  bool get _isShrink =>
      _scrollController.hasClients &&
      _scrollController.offset > (height - kToolbarHeight);

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: BlocConsumer<PostingAdBloc, PostingAdState>(
          listener: (context, state) {
            if (state.makeLetterIndex != null && state.makeLetterIndex! > -1) {
              _makesController.animateTo(state.makeLetterIndex! * 54,
                  duration: Duration(milliseconds: 500), curve: Curves.linear);
            }
          },
          builder: (context, state) => Scaffold(
            body: NestedScrollView(
              controller: _scrollController,
              floatHeaderSlivers: true,
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                /// HEADER TEXT
                 SliverHeaderText(text: LocaleKeys.choose_brand_auto.tr(),),

                /// SEARCH FIELD WITH PERSISTENT HEADER

                SliverSafeArea(
                  top: false,
                  bottom: false,
                  sliver: SliverPersistentHeader(
                    delegate: PersistentHeaderSearch(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        color: _isShrink
                            ? white
                            : Theme.of(context).scaffoldBackgroundColor,
                        padding: const EdgeInsets.only(top: 16, bottom: 12),
                        child: WTextField(
                          fillColor: _isShrink ? whiteSmoke : white,
                          filled: true,
                          margin: const EdgeInsets.only(left: 16, right: 16),
                          onChanged: (value) => setState(() {}),
                          borderRadius: 12,
                          hasSearch: true,
                          hintText: LocaleKeys.search.tr(),
                          height: 40,
                          controller: searchController,
                          hasClearButton: true,
                        ),
                      ),
                    ),
                    pinned: true,
                  ),
                ),

                /// TOP CAR BRANDS
                SliverToBoxAdapter(
                  child: AnimatedCrossFade(
                    duration: const Duration(microseconds: 150),
                    crossFadeState: crossFadeState,
                    secondChild: const SizedBox(),
                    firstChild: SizedBox(
                      height: 100,
                      child: state.status == FormzStatus.submissionInProgress
                          ? const Center(child: CupertinoActivityIndicator())
                          : ListView.separated(
                              itemCount: state.topMakes.length,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => GestureDetector(
                                    onTap: () {
                                      context.read<PostingAdBloc>().add(
                                          PostingAdChooseEvent(
                                              makeId:
                                                  state.topMakes[index].id));
                                      widget.onTopBrandPressed();
                                    },
                                    child: CarBrandItem(
                                      carBrandEntity: state.topMakes[index],
                                      onTap: () => Navigator.of(context,
                                              rootNavigator: true)
                                          .push(fade(
                                              page: AdsScreen(
                                                  isBack: false,
                                                  onTap: () {}))),
                                    ),
                                  ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 12)),
                    ),
                  ),
                ),

                const SliverToBoxAdapter(
                  child: SizedBox(height: 20),
                ),

                /// SIZED BOX
                SliverToBoxAdapter(
                  child: Transform.translate(
                    offset: const Offset(0, 1),
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
                color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
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
                                    makeId: state.makes[index].id));
                          },
                          selectedId:
                              context.watch<PostingAdBloc>().state.makeId ?? -1,
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
      );
}

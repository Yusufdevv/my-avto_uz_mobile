import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/car_items.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/persistant_header.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/persistent_header_search.dart';
import 'package:auto/features/ad/presentation/widgets/sliver_header_text.dart';
import 'package:auto/features/common/widgets/car_brand_item.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ChooseCarBrand extends StatefulWidget {
  final Function(int) onTopBrandPressed;
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
  late ScrollController _nestsController;
  late ScrollController _makesController;
  late TextEditingController searchController;

  double height = 140;
  @override
  void initState() {
    _nestsController = ScrollController()..addListener(_scrollListener);
    _makesController = ScrollController()..addListener(_makesListener);
    searchController = TextEditingController();

    super.initState();
  }

  void _makesListener() {
    // print('==== make: ${_makesController.offset}  ====');
    // print('==== nest: ${_nestsController.offset}  ====');
  }

  void _scrollListener() {
    if (!_isShowFirst(crossFadeState.index) ==
        widget.bloc.state.hasAppBarShadow) {
      widget.bloc.add(PostingAdChangeAppBarShadowEvent(
          value: _isShowFirst(crossFadeState.index)));
    }

    if (_nestsController.offset > 55 && _nestsController.hasClients) {
      if (_isShowFirst(crossFadeState.index)) {
        setState(() {
          crossFadeState = CrossFadeState.showSecond;
        });
      }
    } else {
      setState(() {
        crossFadeState = CrossFadeState.showFirst;
      });
    }
  }

  bool _isShowFirst(int index) => index == 0;

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
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear);
            }
          },
          builder: (context, state) => Scaffold(
            backgroundColor: _isShowFirst(crossFadeState.index) ? null : white,
            body: NestedScrollView(
              controller: _nestsController,
              floatHeaderSlivers: true,
              physics: const ClampingScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                /// HEADER TEXT
                SliverHeaderText(
                  text: LocaleKeys.choose_brand_auto.tr(),
                ),

                /// SEARCH FIELD WITH PERSISTENT HEADER

                SliverSafeArea(
                  top: false,
                  bottom: false,
                  sliver: SliverPersistentHeader(
                    delegate: PersistentHeaderSearch(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        color: _isShowFirst(crossFadeState.index)
                            ? Theme.of(context).scaffoldBackgroundColor
                            : white,
                        padding: const EdgeInsets.only(top: 16, bottom: 12),
                        child: WTextField(
                          fillColor: _isShowFirst(crossFadeState.index)
                              ? white
                              : whiteSmoke,
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
                  child: AnimatedCrossFade(
                    duration: const Duration(microseconds: 150),
                    crossFadeState: crossFadeState,
                    secondChild: const SizedBox(height: 100),
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

                const SliverToBoxAdapter(child: SizedBox(height: 20)),

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
                                    makeId: state.makes[index].id,
                                  ),
                                );
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

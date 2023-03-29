import 'dart:io';
import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/car_items.dart';
import 'package:auto/features/ads/presentation/widgets/no_data_widget.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/comparison/presentation/pages/choose_car_model_page.dart';
import 'package:auto/features/comparison/presentation/widgets/alphabetic_header.dart';
import 'package:auto/features/comparison/presentation/widgets/comparison_search_bar.dart';
import 'package:auto/features/comparison/presentation/widgets/top_brand_sliver_delegate.dart';
import 'package:auto/features/main/domain/usecases/get_top_brand.dart';
import 'package:auto/features/main/presentation/bloc/top_brand/top_brand_bloc.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ChooseCarMakeAndModelPage extends StatefulWidget {
  final MakeEntity? selectedMake;
  final int? selectedModelId;
  final int? announcementCount;

  const ChooseCarMakeAndModelPage({
    this.selectedMake,
    this.selectedModelId,
    this.announcementCount,
    Key? key,
  }) : super(key: key);

  @override
  State<ChooseCarMakeAndModelPage> createState() => _ChooseCarMakeAndModelPageState();
}

class _ChooseCarMakeAndModelPageState extends State<ChooseCarMakeAndModelPage> {
  late TextEditingController _searchController;
  late TopBrandBloc _topBrandBloc;
  late GetMakesBloc _getMakesBloc;
  late ScrollController _scrollController;
  late ScrollController _controllerScroll;
  Color color = Colors.transparent;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _topBrandBloc = TopBrandBloc(GetTopBrandUseCase())
      ..add(TopBrandEvent.getBrand());
    _getMakesBloc = GetMakesBloc()
      ..add(GetMakesGetEvent())
      ..add(GetMakesSelectedCarItemsEvent(
          makeEntity: widget.selectedMake ?? const MakeEntity()));
    _scrollController = ScrollController();
    _controllerScroll = ScrollController();
    if (_getMakesBloc.state.makes.isNotEmpty && widget.selectedMake != null) {
      //! tanlangan itemga borish uchun
      final index = context
          .read<GetMakesBloc>()
          .state
          .makes
          .indexWhere((element) => element.id == widget.selectedMake!.id);
      Future.delayed(const Duration(seconds: 1), () {
        _scrollController.animateTo(index.toDouble() * 54,
            duration: const Duration(milliseconds: 1000), curve: Curves.ease);
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _controllerScroll.dispose();
    _getMakesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => _topBrandBloc,
            ),
            BlocProvider(
              create: (context) => _getMakesBloc,
            ),
          ],
          child: BlocConsumer<GetMakesBloc, GetMakesState>(
            listener: (context, state) {
              _scrollController.animateTo((state.goToIndex ?? 0) * 54,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.ease);
            },
            builder: (context, state) => Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  NestedScrollView(
                    physics: const BouncingScrollPhysics(),
                    controller: _controllerScroll,
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverAppBar(
                        elevation: 0,
                        pinned: true,
                        leadingWidth: 44,
                        leading: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          behavior: HitTestBehavior.opaque,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 8, top: 8, bottom: 8),
                            child: SvgPicture.asset(AppIcons.chevronLeft),
                          ),
                        ),
                        titleSpacing: 0,
                        title: Text(
                          LocaleKeys.choose_brand_auto.tr(),
                          style:  TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).extension<ThemedColors>()!.darkToWhite,
                          ),
                        ),
                        actions: [
                          /// x button
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop('');
                            },
                            behavior: HitTestBehavior.opaque,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: SvgPicture.asset(AppIcons.close),
                            ),
                          ),
                        ],
                      ),
                      SliverPersistentHeader(
                        delegate: ComparisonSearchBar(
                          controller: _searchController,
                          onChanged: () {
                            _getMakesBloc.add(GetMakesGetSearchedEvent(
                                name: _searchController.text));
                          },
                          onClear: () {
                            _getMakesBloc.add(GetMakesGetSearchedEvent(
                                name: _searchController.text));
                          },
                        ),
                        pinned: true,
                      ),
                      if (state.name?.isEmpty ?? true)
                        SliverPersistentHeader(
                          delegate: TopBrandSliverWidget(
                            onTap: (selectedMake) {
                              context.read<GetMakesBloc>().add(
                                    GetMakesSelectedCarItemsEvent(
                                      makeEntity: selectedMake,
                                    ),
                                  );
                              Navigator.of(context).push(
                                fade(
                                  page: ChooseCarModelPage(
                                      parentContext: context,
                                      selectedMake: selectedMake,
                                      selectedModelId: widget.selectedModelId),
                                ),
                              );
                            },
                          ),
                        ),
                      if (state.name?.isEmpty ?? true)
                        SliverPersistentHeader(
                          delegate: AlphabeticHeader(
                            currentLetter: state.selectChar,
                              onLetterTap: (letter) {
                                context.read<GetMakesBloc>().add(
                                      GetMakesGoToIndexEvent(letter: letter),
                                    );
                              },),
                          pinned: true,
                        ),
                    ],
                    body: Builder(
                      builder: (context) {
                        if (state.status.isSubmissionInProgress) {
                          return const Center(
                            child: CupertinoActivityIndicator(),
                          );
                        }
                        if (state.status.isSubmissionSuccess) {
                          return state.makes.isNotEmpty
                              ? ListView.builder(
                                  padding: const EdgeInsets.only(bottom: 60),
                                  itemCount: state.makes.length,
                                  controller: _scrollController,
                                  itemBuilder: (context, index) => Container(
                                    height: 54,
                                    color: Theme.of(context)
                                        .extension<ThemedColors>()!
                                        .whiteToDark,
                                    child: ChangeCarItems(
                                      isSelected: state.selectedMake?.id ==
                                          state.makes[index].id,
                                      imageUrl: state.makes[index].logo,
                                      name: state.makes[index].name,
                                      text: state.name ?? '',
                                      onTap: () {
                                        context.read<GetMakesBloc>().add(
                                              GetMakesSelectedCarItemsEvent(
                                                makeEntity: state.makes[index],
                                              ),
                                            );
                                      },
                                    ),
                                  ),
                                )
                              : const NoDataWidget();
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                  Positioned(
                    bottom: Platform.isAndroid ? 20 : 50,
                    right: 16,
                    left: 16,
                    child: WButton(
                      onTap: () {
                        if (state.selectedMake != null) {
                          Navigator.push(
                              context,
                              fade(
                                  page: ChooseCarModelPage(
                                      parentContext: context,
                                      selectedMake: state.selectedMake,
                                      selectedModelId:
                                          widget.selectedModelId)));
                        }
                      },
                      isDisabled: state.selectedMake == null,
                      disabledColor: disabledButton,
                      text: LocaleKeys.further.tr(),
                      shadow: state.selectedMake != null
                          ? [
                              BoxShadow(
                                offset: const Offset(0, 4),
                                blurRadius: 20,
                                color: orange.withOpacity(0.2),
                              ),
                            ]
                          : [],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

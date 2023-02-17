import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/usecases/get_makes.dart';
import 'package:auto/features/ad/domain/usecases/get_top_makes.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/car_items.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
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

class ChooseCarBrandPage extends StatefulWidget {
  final int? selectedMakeId;
  final int? selectedModelId;
  final int? announcementCount;

  const ChooseCarBrandPage({
    this.selectedMakeId,
    this.selectedModelId,
    this.announcementCount,
    Key? key,
  }) : super(key: key);

  @override
  State<ChooseCarBrandPage> createState() => _ChooseCarBrandPageState();
}

class _ChooseCarBrandPageState extends State<ChooseCarBrandPage> {
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
    _getMakesBloc = GetMakesBloc(
      topUseCase:
          GetTopMakesUseCase(repository: serviceLocator<AdRepositoryImpl>()),
      useCase: GetMakesUseCase(
        repository: serviceLocator<AdRepositoryImpl>(),
      ),
    )
      ..add(GetMakesBlocEvent.getMakes())
      ..add(GetMakesBlocEvent.changeSelected(widget.selectedMakeId ?? -1));
    _scrollController = ScrollController();
    _controllerScroll = ScrollController();
    if (_getMakesBloc.state.makes.isNotEmpty && widget.selectedMakeId != null) {
      //! tanlangan itemga borish uchun
      final index = context
          .read<GetMakesBloc>()
          .state
          .makes
          .indexWhere((element) => element.id == widget.selectedMakeId);
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
          child: BlocBuilder<GetMakesBloc, GetMakesState>(
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
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: dark,
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
                            _getMakesBloc
                              ..add(GetMakesBlocEvent.getSerched(
                                  _searchController.text))
                              ..add(GetMakesBlocEvent.getMakes());
                          },
                          onClear: () {
                            _getMakesBloc
                              ..add(GetMakesBlocEvent.getSerched(
                                  _searchController.text))
                              ..add(GetMakesBlocEvent.getMakes());
                          },
                        ),
                        pinned: true,
                      ),
                      if (state.search.isEmpty)
                        SliverPersistentHeader(
                          delegate: TopBrandSliverWidget(
                            onTap: (selectedMake) {
                              context.read<GetMakesBloc>().add(
                                    GetMakesBlocEvent.selectedCarItems(
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
                      if (state.search.isEmpty)
                        SliverPersistentHeader(
                          delegate: AlphabeticHeader(
                            color: color,
                            controller: _controllerScroll,
                          ),
                          pinned: true,
                        ),
                    ],
                    body: BlocConsumer<GetMakesBloc, GetMakesState>(
                        listener: (context, stateCons) {
                      if (stateCons.statusController.isSubmissionSuccess) {
                        _scrollController.animateTo(state.index.toDouble() * 54,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.ease);
                      }
                      context
                          .read<GetMakesBloc>()
                          .add(GetMakesBlocEvent.changeControlleStatus());
                    }, builder: (context, stateCons) {
                      if (state.status.isSubmissionInProgress) {
                        return const Center(
                          child: CupertinoActivityIndicator(),
                        );
                      }
                      if (state.status.isSubmissionSuccess) {
                        return ListView.builder(
                          padding: const EdgeInsets.only(bottom: 60),
                          itemCount: state.makes.length,
                          controller: _scrollController,
                          itemBuilder: (context, index) => Container(
                            height: 54,
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .whiteToDark,
                            child: ChangeCarItems(
                              selectedId: state.selectId,
                              id: state.makes[index].id,
                              imageUrl: state.makes[index].logo,
                              name: state.makes[index].name,
                              text: state.search,
                              onTap: () {
                                context.read<GetMakesBloc>().add(
                                      GetMakesBlocEvent.selectedCarItems(
                                        makeEntity: state.makes[index],
                                      ),
                                    );
                              },
                            ),
                          ),
                        );
                      }
                      return const SizedBox();
                    }),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    left: 16,
                    child: WButton(
                      onTap: () {
                        if (state.selectId != -1) {
                          if (state.selectedMake.id == -1) {
                            final item = state.makes.firstWhere(
                                (element) => element.id == state.selectId);
                            Navigator.push(
                                context,
                                fade(
                                    page: ChooseCarModelPage(
                                        parentContext: context,
                                        selectedMake: item,
                                        selectedModelId:
                                            widget.selectedModelId)));
                          } else {
                            Navigator.push(
                                context,
                                fade(
                                    page: ChooseCarModelPage(
                                        parentContext: context,
                                        selectedMake: state.selectedMake,
                                        selectedModelId:
                                            widget.selectedModelId)));
                          }
                        }
                      },
                      isDisabled: state.selectId == -1,
                      disabledColor: darkGray,
                      text: LocaleKeys.further.tr(),
                      shadow: state.selectId != -1
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

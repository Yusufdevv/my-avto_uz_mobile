import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/car_items.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/comparison/presentation/bloc/scroll-bloc/scrolling_bloc.dart';
import 'package:auto/features/comparison/presentation/widgets/alphabetic_header.dart';
import 'package:auto/features/comparison/presentation/widgets/search_bar.dart';
import 'package:auto/features/comparison/presentation/widgets/top_brand_sliver_delegate.dart';
import 'package:auto/features/main/domain/usecases/get_top_brand.dart';
import 'package:auto/features/main/presentation/bloc/top_brand/top_brand_bloc.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ChooseCarBrandComparison extends StatefulWidget {
  final bool isbak;
  final bool isClear;
  final VoidCallback onTap;
  const ChooseCarBrandComparison({
    required this.onTap,
    Key? key,
    this.isbak = false,
    this.isClear = true,
  }) : super(key: key);

  @override
  State<ChooseCarBrandComparison> createState() =>
      _ChooseCarBrandComparisonState();
}

class _ChooseCarBrandComparisonState extends State<ChooseCarBrandComparison> {
  late TextEditingController searchController;
  late TopBrandBloc topBrandBloc;
  late ScrollController scrollController;
  late ScrollController controllerScroll;
  late ScrollingBloc scrollingBloc;
  Color color = Colors.transparent;
  bool isSerach = false;

  @override
  void initState() {
    searchController = TextEditingController();
    topBrandBloc = TopBrandBloc(GetTopBrandUseCase())
      ..add(TopBrandEvent.getBrand());
    context.read<GetMakesBloc>().add(GetMakesBlocEvent.getSerched(''));
    context.read<GetMakesBloc>().add(GetMakesBlocEvent.getMakes());
    scrollingBloc = ScrollingBloc();
    scrollController = ScrollController();
    controllerScroll = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: BlocProvider.value(
          value: topBrandBloc,
          child: BlocConsumer<GetMakesBloc, GetMakesState>(
            listener: (context, state) {
              scrollController.animateTo(state.index.toDouble() * 54,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
            },
            builder: (context, state) => Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  NestedScrollView(
                    physics: const BouncingScrollPhysics(),
                    controller: controllerScroll,
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverAppBar(
                        elevation: 0,
                        pinned: true,
                        leadingWidth: 44,
                        leading: GestureDetector(
                          onTap: () => Navigator.pop(context),
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
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                                if (widget.isClear) {
                                  context.read<GetMakesBloc>().add(
                                      GetMakesBlocEvent.selectedCarItems(
                                          id: -1, name: '', imageUrl: ''));
                                }
                              },
                              behavior: HitTestBehavior.opaque,
                              child: SvgPicture.asset(AppIcons.close),
                            ),
                          ),
                        ],
                      ),
                      SliverPersistentHeader(
                        delegate: WSerachBar(
                          controller: searchController,
                          onChanged: () {
                            context.read<GetMakesBloc>().add(
                                  GetMakesBlocEvent.getSerched(
                                    searchController.text,
                                  ),
                                );
                            context
                                .read<GetMakesBloc>()
                                .add(GetMakesBlocEvent.getMakes());
                            setState(() {});
                          },
                          onClear: () {
                            context.read<GetMakesBloc>().add(
                                  GetMakesBlocEvent.getSerched(
                                    searchController.text,
                                  ),
                                );
                            context
                                .read<GetMakesBloc>()
                                .add(GetMakesBlocEvent.getMakes());
                            setState(() {});
                          },
                        ),
                        pinned: true,
                      ),
                      if (state.search.isEmpty)
                        SliverPersistentHeader(
                          delegate: TopBrandSliverWidget(
                            onTap: widget.onTap,
                            isbak: widget.isbak,
                          ),
                        ),
                      if (state.search.isEmpty)
                        SliverPersistentHeader(
                          delegate: AlphabeticHeader(
                            color: color,
                            controller: controllerScroll,
                          ),
                          pinned: true,
                        ),
                    ],
                    body: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 60),
                      itemCount: state.makes.length,
                      controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
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
                                    id: state.makes[index].id,
                                    name: state.makes[index].name,
                                    imageUrl: state.makes[index].logo,
                                  ),
                                );
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    left: 16,
                    child: WButton(
                      onTap: widget.isbak == true
                          ? () {
                              Navigator.pop(context);
                            }
                          : widget.onTap,
                      text: LocaleKeys.further.tr(),
                      shadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 20,
                          color: orange.withOpacity(0.2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

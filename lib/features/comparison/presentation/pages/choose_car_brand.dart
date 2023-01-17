import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/car_items.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/comparison/presentation/bloc/scroll-bloc/scrolling_bloc.dart';
import 'package:auto/features/comparison/presentation/widgets/alphabetic_header.dart';
import 'package:auto/features/comparison/presentation/widgets/card_brend_container.dart';
import 'package:auto/features/comparison/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ChooseCarBrandComparison extends StatefulWidget {
  final bool isbak;
  final bool isClear;
  final VoidCallback onTap;
  const ChooseCarBrandComparison(
      {required this.onTap, Key? key, this.isbak = false, this.isClear = true})
      : super(key: key);

  @override
  State<ChooseCarBrandComparison> createState() =>
      _ChooseCarBrandComparisonState();
}

class _ChooseCarBrandComparisonState extends State<ChooseCarBrandComparison> {
  late TextEditingController searchController;

  late ScrollController scrollController;
  late ScrollingBloc scrollingBloc;
  Color color = Colors.transparent;
  bool isSerach = false;
  @override
  void initState() {
    searchController = TextEditingController();
    context.read<GetMakesBloc>().add(GetMakesBlocEvent.getSerched(''));
    context.read<GetMakesBloc>().add(GetMakesBlocEvent.getMakes());
    scrollingBloc = ScrollingBloc();
    scrollController = ScrollController();
    scrollController.addListener(() {
      scrollingBloc.add(ChangeColorEvent(offset: scrollController.offset));
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: BlocBuilder<GetMakesBloc, GetMakesState>(
          bloc: context.read<GetMakesBloc>(),
          builder: (context, state) => Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                NestedScrollView(
                  controller: scrollController,
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      elevation: 0,
                      pinned: true,
                      leadingWidth: 36,
                      leading: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: SvgPicture.asset(AppIcons.chevronLeft),
                        ),
                      ),
                      titleSpacing: 4,
                      title: const Text(
                        'Выберите марку автомобиля',
                        style: TextStyle(
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
                            child: SvgPicture.asset(AppIcons.close),
                          ),
                        ),
                      ],
                    ),
                    SliverSafeArea(
                      top: false,
                      bottom: true,
                      sliver: SliverPersistentHeader(
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
                          },
                        ),
                        pinned: true,
                      ),
                    ),
                    if (state.search.isEmpty)
                      SliverToBoxAdapter(
                        child: BlocBuilder<GetMakesBloc, GetMakesState>(
                          builder: (context, state) => SizedBox(
                            height: 132,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  CarBrandContainer(
                                imageUrl: state.topMakes[index].logo,
                                title: state.topMakes[index].name,
                              ),
                              itemCount: state.topMakes.length,
                            ),
                          ),
                        ),
                      ),
                    if (state.search.isEmpty)
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
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (state.search.isEmpty)
                      SliverSafeArea(
                        top: false,
                        bottom: false,
                        sliver: SliverPersistentHeader(
                          delegate: AlphabeticHeader(color: color),
                          pinned: true,
                        ),
                      ),
                  ],
                  body: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 60),
                    itemCount: state.makes.length,
                    itemBuilder: (context, index) => Container(
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
                          print('===> ==> Bu Boshida ${state.makes[index].id}');
                          context.read<GetMakesBloc>().add(
                                GetMakesBlocEvent.selectedCarItems(
                                  id: state.makes[index].id,
                                  name: state.makes[index].name,
                                  imageUrl: state.makes[index].logo,
                                ),
                              );
                          print('===> ==> Bu stateda ${state.selectId}');
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
                    onTap: state.selectId == -1
                        ? () {}
                        : widget.isbak == true
                            ? () {
                                Navigator.pop(context);
                              }
                            : widget.onTap,
                    text: 'Далее',
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
      );
}

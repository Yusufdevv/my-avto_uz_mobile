import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/domain/entity/car_brand_entity.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/comparison/presentation/bloc/scroll-bloc/scrolling_bloc.dart';
import 'package:auto/features/comparison/presentation/widgets/alphabetic_header.dart';
import 'package:auto/features/comparison/presentation/widgets/card_brend_container.dart';
import 'package:auto/features/posting_ad/choose_car_brand/domain/entity/change_car_entity.dart';
import 'package:auto/features/posting_ad/choose_car_brand/presentation/blocs/car_selector/car_selector_bloc.dart';
import 'package:auto/features/posting_ad/choose_car_brand/presentation/widget/car_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ChooseCarBrandComparison extends StatefulWidget {
  final VoidCallback onTap;

  const ChooseCarBrandComparison({required this.onTap, Key? key})
      : super(key: key);

  @override
  State<ChooseCarBrandComparison> createState() =>
      _ChooseCarBrandComparisonState();
}

class _ChooseCarBrandComparisonState extends State<ChooseCarBrandComparison> {
  late TextEditingController searchController;
  late CarSelectorBloc carSelectorBloc;
  late ScrollController scrollController;
  late ScrollingBloc scrollingBloc;
  Color color = Colors.transparent;
  @override
  void initState() {
    searchController = TextEditingController();
    scrollingBloc = ScrollingBloc();
    carSelectorBloc = CarSelectorBloc();
    scrollController = ScrollController();
    scrollController.addListener(() {
      print(scrollController.offset);
      scrollingBloc.add(ChangeColorEvent(offset: scrollController.offset));
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  final List<ChangeCarEntity> carList = [
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
  ];
  final List<CarBrandEntity> carBrandEntity = [
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
  ];

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: BlocProvider.value(
          value: carSelectorBloc,
          child: Scaffold(
            body: Stack(
              children: [
                NestedScrollView(
                  controller: scrollController,
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      elevation: 0,
                      pinned: true,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 16, bottom: 16, right: 8),
                              child: SvgPicture.asset(AppIcons.chevronLeft),
                            ),
                          ),
                          Text(
                            'Выберите марку',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        color: white,
                        child: WTextField(
                          margin: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 16),
                          onChanged: (value) {},
                          borderRadius: 12,
                          hasSearch: true,
                          hintText: 'Поиск',
                          height: 40,
                          controller: searchController,
                          hasClearButton: true,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 132,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => CarBrandContainer(
                              carBrandEntity: carBrandEntity[index]),
                          itemCount: carBrandEntity.length,
                        ),
                      ),
                    ),
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
                    padding: const EdgeInsets.only(bottom: 50),
                    itemBuilder: (context, index) =>
                        BlocBuilder<CarSelectorBloc, SelectedCarItems>(
                      builder: (context, state) => Container(
                        color: white,
                        child: ChangeCarItems(
                          entity: carList[index],
                          selectedId: state.selectedId,
                          id: index,
                        ),
                      ),
                    ),
                    itemCount: carList.length,
                  ),
                ),
                Positioned(
                    bottom: 16,
                    right: 16,
                    left: 16,
                    child: BlocBuilder<CarSelectorBloc, SelectedCarItems>(
                      builder: (context, state) => WButton(
                        onTap: state.selectedId == -1 ? () {} : widget.onTap,
                        text: 'Далее',
                        shadow: [
                          BoxShadow(
                              offset: const Offset(0, 4),
                              blurRadius: 20,
                              color: orange.withOpacity(0.2)),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      );
}

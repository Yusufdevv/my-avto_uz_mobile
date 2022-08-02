import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/posting_ad/choose_car_brand/domain/entity/car_brand_entity.dart';
import 'package:auto/features/posting_ad/choose_car_brand/domain/entity/change_car_entity.dart';
import 'package:auto/features/posting_ad/choose_car_brand/presentation/blocs/car_selector/car_selector_bloc.dart';
import 'package:auto/features/posting_ad/choose_car_brand/presentation/widget/car_brand_item.dart';
import 'package:auto/features/posting_ad/choose_car_brand/presentation/widget/car_items.dart';
import 'package:auto/features/posting_ad/choose_car_brand/presentation/widget/persistant_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ChooseCarBrand extends StatefulWidget {
  final VoidCallback onTap;

  const ChooseCarBrand({required this.onTap, Key? key}) : super(key: key);

  @override
  State<ChooseCarBrand> createState() => _ChooseCarBrandState();
}

class _ChooseCarBrandState extends State<ChooseCarBrand> {
  late TextEditingController searchController;
  late CarSelectorBloc carSelectorBloc;

  @override
  void initState() {
    searchController = TextEditingController();
    carSelectorBloc = CarSelectorBloc();
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
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverToBoxAdapter(
                      child: WTextField(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 29),
                        onChanged: (value) {},
                        borderRadius: 12,
                        hasSearch: true,
                        hintText: 'Поиск',
                        height: 40,
                        controller: searchController,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => CarBrandItem(
                              carBrandEntity: carBrandEntity[index]),
                          itemCount: carBrandEntity.length,
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 20,
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
                        delegate: Header(),
                        pinned: true,
                      ),
                    ),
                  ],
                  body: Container(
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToDark,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 50),
                      itemBuilder: (context, index) =>
                          BlocBuilder<CarSelectorBloc, SelectedCarItems>(
                        builder: (context, state) => ChangeCarItems(
                          entity: carList[index],
                          selectedId: state.selectedId,
                          id: index,
                        ),
                      ),
                      itemCount: carList.length,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 16,
                    right: 16,
                    left: 16,
                    child:  BlocBuilder<CarSelectorBloc, SelectedCarItems>(
                      builder: (context, state) => WButton(
                      onTap: state.selectedId == -1 ? (){} : widget.onTap,
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

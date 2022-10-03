import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/domain/entity/car_brand_entity.dart';
import 'package:auto/features/common/widgets/car_brand_item.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/main/presentation/bloc/change_car_bloc.dart';
import 'package:auto/features/main/presentation/widgets/cars_item.dart';
import 'package:auto/features/posting_ad/choose_car_brand/domain/entity/change_car_entity.dart';
import 'package:auto/features/posting_ad/choose_car_brand/presentation/widget/persistant_header.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class SelectCarModelScreen extends StatefulWidget {
  const SelectCarModelScreen({Key? key}) : super(key: key);

  @override
  State<SelectCarModelScreen> createState() => _SelectCarModelScreenState();
}

class _SelectCarModelScreenState extends State<SelectCarModelScreen> {
  late TextEditingController searchController;
  late ChangeCarBloc changeCarBloc;

  @override
  void initState() {
    searchController = TextEditingController();
    changeCarBloc = ChangeCarBloc();
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
          value: changeCarBloc,
          child: Stack(
            children: [
              NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    pinned: true,
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    title: Row(
                      children: [
                        WScaleAnimation(
                            child: SvgPicture.asset(AppIcons.chevronLeft),
                            onTap: () => Navigator.pop(context)),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          LocaleKeys.choose_brand_auto.tr(),
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        const Spacer(),
                        WScaleAnimation(
                            child: SvgPicture.asset(AppIcons.close),
                            onTap: () => Navigator.pop(context)),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 55,
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      child: WTextField(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        onChanged: (value) {},
                        borderRadius: 12,
                        hasSearch: true,
                        hintText: LocaleKeys.search.tr(),
                        height: 40,
                        controller: searchController,
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            CarBrandItem(carBrandEntity: carBrandEntity[index]),
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
                  color:
                      Theme.of(context).extension<ThemedColors>()!.whiteToDark,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 50),
                    itemBuilder: (context, index) =>
                        BlocBuilder<ChangeCarBloc, ChangeCarState>(
                      builder: (context, state) => ChangeCarsItem(
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
                child: BlocBuilder<ChangeCarBloc, ChangeCarState>(
                  builder: (context, state) => WButton(
                    onTap: state.selectedId == -1
                        ? () {}
                        : () {
                            Navigator.pop(context);
                          },
                    text: LocaleKeys.further.tr(),
                    shadow: [
                      BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 20,
                          color: orange.withOpacity(0.2)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

// Scaffold(
//             appBar: PreferredSize(
//               preferredSize: Size.fromHeight(110),
//               child: Container(
//                 color: Theme.of(context).scaffoldBackgroundColor,
//                 child: Column(
//                   children: [
//                     WAppBar(
//                       extraActions: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                           child: GestureDetector(
//                             onTap: () => Navigator.pop(context),
//                             child: SvgPicture.asset(AppIcons.close),
//                           ),
//                         )
//                       ],
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 44, vertical: 16),
//                         child: Text(
//                           'Выберите марку автомобиля',
//                           style:
//                               Theme.of(context).textTheme.subtitle1!.copyWith(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       height: 50,
//                       color: Theme.of(context).appBarTheme.backgroundColor,
//                       child: WTextField(
//                         margin: const EdgeInsets.symmetric(horizontal: 16),
//                         onChanged: (value) {},
//                         borderRadius: 12,
//                         hasSearch: true,
//                         hintText: 'Поиск',
//                         height: 40,
//                         controller: searchController,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             body: Stack(
//               children: [
//                 SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Container(
//                         margin: const EdgeInsets.only(top: 16),
//                         height: 100,
//                         child: ListView.builder(
//                           itemBuilder: (context, index) => CarBrandItem(
//                             carBrandEntity: carBrandEntity[index],
//                           ),
//                           itemCount: carBrandEntity.length,
//                           scrollDirection: Axis.horizontal,
//                         ),
//                       ),
//                       Container(
//                         height: MediaQuery.of(context).size.height,
//                         width: double.infinity,
//                         margin: const EdgeInsets.only(top: 16),
//                         decoration: BoxDecoration(
//                           color: Theme.of(context)
//                               .extension<ThemedColors>()!
//                               .whiteToDark,
//                           borderRadius: const BorderRadius.vertical(
//                             top: Radius.circular(20),
//                           ),
//                         ),
//                         child: Column(
//                           children: [
//                             const SizedBox(
//                               height: 25,
//                             ),
//                             SizedBox(
//                               height: 40,
//                               child: ListView.builder(
//                                 itemBuilder: (context, index) => AzList(
//                                   letter: letters[index],
//                                 ),
//                                 itemCount: letters.length,
//                                 scrollDirection: Axis.horizontal,
//                               ),
//                             ),
//                             Divider(
//                               color: Theme.of(context).dividerColor,
//                             ),
//                             Expanded(
//                               child: BlocBuilder<ChangeCarBloc, ChangeCarState>(
//                                 builder: (context, state) => ListView.builder(
//                                   padding: const EdgeInsets.only(bottom: 50),
//                                   itemBuilder: (context, index) =>
//                                       ChangeCarsItem(
//                                     entity: carList[index],
//                                     selectedId: state.selectedId,
//                                     id: index,
//                                   ),
//                                   itemCount: carList.length,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                     bottom: MediaQuery.of(context).padding.bottom + 16,
//                     right: 16,
//                     left: 16,
//                     child: WButton(
//                       onTap: () => Navigator.pop(context),
//                       text: 'Далее',
//                       shadow: [
//                         BoxShadow(
//                             offset: const Offset(0, 4),
//                             blurRadius: 20,
//                             color: orange.withOpacity(0.2)),
//                       ],
//                     )),
//               ],
//             ),
//           )

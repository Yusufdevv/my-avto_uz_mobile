import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/posting_ad/choose_car_brand/presentation/widget/persistant_header.dart';
import 'package:auto/features/reviews/domain/entities/brand_entity.dart';
import 'package:auto/features/reviews/presentation/widgets/review_car_brand_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChooseCarScreen extends StatefulWidget {
  const ChooseCarScreen({super.key});

  @override
  State<ChooseCarScreen> createState() => _ChooseCarScreenState();
}

class _ChooseCarScreenState extends State<ChooseCarScreen> {
  late TextEditingController searchController;

  final List<BrandEntity> carBrandEntity = [
    const BrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const BrandEntity(title: 'BMW', icon: AppImages.bmwModel),
    const BrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const BrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const BrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const BrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const BrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const BrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
  ];

  @override
  void initState() {
    searchController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
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
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
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
                      itemBuilder: (context, index) => ReviewCarBrandItem(
                        carBrandEntity: carBrandEntity[index],
                      ),
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
              body: Container(),
            ),
          ],
        ),
      );
}

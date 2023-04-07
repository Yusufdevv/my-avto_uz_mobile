import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/profile/domain/entities/products_list.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_product_box.dart';
import 'package:auto/features/profile/presentation/widgets/contact_sheet_of_service_or_products.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  final String title;
  final String slug;
  final List<ProductsList> products;
  final String phoneNumber;

  const ProductsScreen({
    required this.title,
    required this.products,
    required this.slug,
    required this.phoneNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: WAppBar(
          centerTitle: false,
          hasBackButton: true,
          onTapBack: () {
            Navigator.pop(context);
          },
          title: title,
        ),
        bottomNavigationBar: WButton(
          color: emerald,
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 16,
              right: 16,
              left: 16),
          isDisabled: false,
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (context) =>
                  ContactSheetOfServiceOrProduct(phoneNumber: phoneNumber),
            );
          },
          text: LocaleKeys.show_contact.tr(),
        ),
        body: Center(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
            itemCount: products.length,
            itemBuilder: (context, index) => DirectoryProductBox(
              phoneNumber: phoneNumber,
              image: products[index].image ?? '',
              name: products[index].name,
              price: products[index].price ?? '',
              isAgreedPrice: products[index].isAgreedPrice,
            ),
          ),
        ),
      );
}

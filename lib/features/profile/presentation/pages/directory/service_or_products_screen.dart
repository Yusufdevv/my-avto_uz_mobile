import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/profile/presentation/bloc/dirctory_products/directory_products_bloc.dart';
import 'package:auto/features/profile/presentation/widgets/contact_sheet_of_service_or_products.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ServiceOrProductsScreen extends StatefulWidget {
  final String title;
  final String slug;
  final String phoneNumber;
  final int id;

  const ServiceOrProductsScreen({
    required this.title,
    required this.slug,
    required this.phoneNumber,
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  State<ServiceOrProductsScreen> createState() =>
      _ServiceOrProductsScreenState();
}

class _ServiceOrProductsScreenState extends State<ServiceOrProductsScreen> {
  late DirectoryProductsBloc bloc;

  @override
  void initState() {
    bloc = DirectoryProductsBloc()
      ..add(DirectoryProductsGetEvent(id: widget.id, slug: widget.slug));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => bloc,
        child: Scaffold(
          appBar: WAppBar(
            centerTitle: false,
            hasBackButton: true,
            onTapBack: () {
              Navigator.pop(context);
            },
            title: widget.title,
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
                builder: (context) => ContactSheetOfServiceOrProduct(
                    phoneNumber: widget.phoneNumber),
              );
            },
            text: LocaleKeys.show_contact.tr(),
          ),
          body: BlocBuilder<DirectoryProductsBloc, DirectoryProductsState>(
            builder: (context, state) {
              if (state.status.isSubmissionInProgress) {
                return const Center(child: CupertinoActivityIndicator());
              }

              return Center(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                  itemCount: state.products.length,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      color: white,
                      border: Border.all(width: 1, color: dividerColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 96,
                          child: Container(
                            width: double.maxFinite,
                            margin: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: dividerColor,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(8),
                                bottom: Radius.circular(4),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(8),
                                bottom: Radius.circular(4),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: state.products[index].image,
                                fit: BoxFit.cover,
                                errorWidget: (x, y, z) => Image.asset(
                                    AppImages.defaultPhoto,
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Expanded(
                          flex: 58,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.products[index].name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                Text(
                                  MyFunctions.getFormatCost(
                                      state.products[index].price),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
}

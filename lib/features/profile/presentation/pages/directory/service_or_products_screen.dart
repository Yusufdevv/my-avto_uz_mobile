import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/widgets/contact_sheet_of_service_or_products.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ServiceOrProductsScreen extends StatefulWidget {
  final String title;
  final ProfileBloc bloc;
  final String slug;
  final int id;

  ServiceOrProductsScreen(
      {required this.title,
      Key? key,
      required this.bloc,
      required this.slug,
      required this.id})
      : super(key: key);

  @override
  State<ServiceOrProductsScreen> createState() =>
      _ServiceOrProductsScreenState();
}

class _ServiceOrProductsScreenState extends State<ServiceOrProductsScreen> {
  final List<String> items = List.generate(30, (index) => 'Station $index');

  @override
  Widget build(BuildContext context) {
    widget.bloc.add(GetCarProductByCategoryEvent(
      slug: widget.slug,
      id: widget.id,
    ));
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        print('CAR PRODUCT BY CATEGORY -> ${state.cartProductEntity}');
        print(
            'CAR PRODUCT BY CATEGORY -> ${state.getCarProductByCategoryStatus}');
        return Scaffold(
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
                builder: (context) => const ContactSheetOfServiceOrProduct(),
              );
            },
            text: 'Показать контакты',
          ),
          body: Center(
            child: state.getCarProductByCategoryStatus !=
                    FormzStatus.submissionSuccess
                ? const CupertinoActivityIndicator()
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 25),
                    itemCount: state.cartProductEntity.length,
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
                              margin: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppImages.defaultPhoto),
                                  fit: BoxFit.cover,
                                ),
                                color: dividerColor,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(8),
                                  bottom: Radius.circular(4),
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
                                    state.cartProductEntity[index].name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  // Text(
                                  //   ' 36 КВТ',
                                  //   style: Theme.of(context)
                                  //       .textTheme
                                  //       .displayLarge!
                                  //       .copyWith(
                                  //           fontSize: 12,
                                  //           fontWeight: FontWeight.w400),
                                  // ),
                                  const Spacer(),
                                  Text(
                                    MyFunctions.getFormatCost(
                                        state.cartProductEntity[index].price),
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
          ),
        );
      },
    );
  }
}

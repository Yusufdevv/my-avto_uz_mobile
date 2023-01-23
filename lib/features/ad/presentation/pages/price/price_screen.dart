import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/features/ad/domain/entities/rent_with_purchase/rent_with_purchase_entity.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/currency_choose_sheet.dart';
import 'package:auto/features/ad/presentation/widgets/rent_to_buy_sheet.dart';
import 'package:auto/features/ad/presentation/widgets/rent_to_sale_info_box.dart';
import 'package:auto/features/common/widgets/switcher_row_as_button_also.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class PriceScreen extends StatefulWidget {
  final String initialPrice;
  const PriceScreen({required this.initialPrice, Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  late TextEditingController priceController;

  @override
  void initState() {
    priceController = TextEditingController(text: widget.initialPrice);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: BlocBuilder<PostingAdBloc, PostingAdState>(
          builder: (context, state) => Scaffold(
            body: BaseWidget(
              headerText: 'Цена',
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 60),
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WTextField(
                        textInputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        maxLength: 7,
                        hideCounterText: true,
                        controller: priceController,
                        onChanged: (value) => context
                            .read<PostingAdBloc>()
                            .add(PostingAdChooseEvent(price: value)),
                        title: 'Введите сумму',
                        keyBoardType: TextInputType.number,
                        borderRadius: 12,
                        fillColor: Theme.of(context)
                            .extension<WTextFieldStyle>()!
                            .fillColor,
                        focusColor: Theme.of(context)
                            .extension<WTextFieldStyle>()!
                            .fillColor,
                        disabledColor: Theme.of(context)
                            .extension<WTextFieldStyle>()!
                            .fillColor,
                        suffixPadding: const EdgeInsets.all(0),
                        suffix: WScaleAnimation(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .solitudeToEclipse,
                                borderRadius: const BorderRadius.horizontal(
                                  right: Radius.circular(12),
                                ),
                                border: Border.all(
                                    width: 1,
                                    color: Theme.of(context)
                                        .extension<WTextFieldStyle>()!
                                        .borderColor)),
                            child: WButton(
                              onTap: () async {
                                await showModalBottomSheet<String>(
                                  useRootNavigator: false,
                                  isDismissible: false,
                                  context: context,
                                  isScrollControlled: true,
                                  barrierColor: Colors.black.withOpacity(.5),
                                  backgroundColor: Colors.transparent,
                                  builder: (c) => CurrencyChooseSheet(
                                    selected: state.currency,
                                  ),
                                ).then((value) => context
                                    .read<PostingAdBloc>()
                                    .add(
                                        PostingAdChooseEvent(currency: value)));
                              },
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    state.currency ,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(color: greyText),
                                  ),
                                  const SizedBox(width: 4),
                                  SvgPicture.asset(AppIcons.chevronDown)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .snowToNero,
                          border: Border.all(
                              width: 1,
                              color: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .transparentToNightRider),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Стоимость такого же авто начинается с:',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(color: grey),
                            ),
                            Text(
                              '≈ 270 000 у.е',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      SwitcherRowAsButtonAlso(
                        value: state.rentToBuy ?? false,
                        onTap: () {
                          showModalBottomSheet<RentWithPurchaseEntity>(
                              useRootNavigator: true,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              isDismissible: false,
                              context: context,
                              builder: (context) =>
                                   RentToBuySheet(step: 1,price: int.tryParse(state.price??'0')??0,)).then((value) {
                            if (value != null) {
                              context.read<PostingAdBloc>().add(
                                      PostingAdChooseEvent(
                                          rentToBuy: true,
                                          rentWithPurchaseConditions: [
                                        value,
                                        ...state.rentWithPurchaseConditions
                                      ]));
                            }
                          });
                        },
                        onChanged: (v) => context
                            .read<PostingAdBloc>()
                            .add(PostingAdChooseEvent(rentToBuy: v)),
                        title: 'Аренда с выкупом',
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(
                        height: 16,
                      ),
                      if (state.rentToBuy ?? false) ...{
                        ...state.rentWithPurchaseConditions
                            .map((e) => RentToSaleDetailsBox(
                                  monthlyPayment: e.monthlyPayment,
                                  prePayment: e.prepayment,
                                  rentalPeriod: e.rentalPeriod,
                                ))
                            .toList(),
                        WScaleAnimation(
                            onTap: () {
                              showModalBottomSheet<RentWithPurchaseEntity>(
                                      useRootNavigator: true,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      isDismissible: false,
                                      context: context,
                                      builder: (context) =>
                                           RentToBuySheet(step: 1,price: int.tryParse(state.price??'0')??0,))
                                  .then((value) {
                                if (value != null) {
                                  context.read<PostingAdBloc>().add(
                                          PostingAdChooseEvent(
                                              rentToBuy: true,
                                              rentWithPurchaseConditions: [
                                            value,
                                            ...state.rentWithPurchaseConditions
                                          ]));
                                }
                              });
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Добавить условия аренды',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(width: 8),
                                SvgPicture.asset(
                                  AppIcons.chevronRight,
                                  color: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .mediumSlateBlueToWhite,
                                )
                              ],
                            ))
                      }
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

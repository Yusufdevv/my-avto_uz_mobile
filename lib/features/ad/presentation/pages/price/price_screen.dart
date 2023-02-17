import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/formatters.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/features/ad/domain/entities/rent_with_purchase/rent_with_purchase_entity.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/currency_choose_sheet.dart';
import 'package:auto/features/ad/presentation/widgets/rent_to_buy_sheet.dart';
import 'package:auto/features/ad/presentation/widgets/rent_to_sale_info_box.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/switcher_row_as_button_also.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class PriceScreen extends StatefulWidget {
  final Function(String) onCurrencyChanged;
  final Function(String) onPriceChanged;
  final Function(bool) onSwitchChanged;
  final Function(RentWithPurchaseEntity) onConditionChanged;
  final String initialPrice;
  final List<RentWithPurchaseEntity> conditions;
  final num minimumPrice;
  final String price;
  final bool rentToBuy;
  final String currency;

  const PriceScreen(
      {required this.price,
      required this.onConditionChanged,
      required this.onSwitchChanged,
      required this.minimumPrice,
      required this.conditions,
      required this.initialPrice,
      required this.rentToBuy,
      required this.currency,
      required this.onPriceChanged,
      required this.onCurrencyChanged,
      Key? key})
      : super(key: key);

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
        child: Scaffold(
          body: BaseWidget(
            headerText: LocaleKeys.price.tr(),
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
                      textStyle: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                      textInputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        ThousandsSeparatorInputFormatter()
                      ],
                      maxLength: 18,
                      hideCounterText: true,
                      controller: priceController,
                      onChanged: (value) => widget.onPriceChanged(value),
                      title: LocaleKeys.enter_price.tr(),
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
                        onTap: () async {
                          await showModalBottomSheet<String>(
                            useRootNavigator: false,
                            isDismissible: false,
                            context: context,
                            isScrollControlled: true,
                            barrierColor: Colors.black.withOpacity(.5),
                            backgroundColor: Colors.transparent,
                            builder: (c) => CurrencyChooseSheet(
                              selected: widget.currency,
                            ),
                          ).then((value) {
                            if (value != null) {
                              widget.onCurrencyChanged(value);
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .extension<WTextFieldStyle>()!
                                  .fillColor,
                              borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(12),
                              ),
                              border: Border.all(
                                  width: 1,
                                  color: Theme.of(context)
                                      .extension<WTextFieldStyle>()!
                                      .borderColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.currency=='uzs' ? LocaleKeys.sum.tr() : 'y.e',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: greyText),
                              ),
                              const SizedBox(width: 4),
                              SvgPicture.asset(AppIcons.chevronDown,
                                  color: greyText)
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (widget.minimumPrice > 0) ...{
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
                              LocaleKeys.price_starting_from.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: grey),
                            ),
                            Text(
                              '≈ ${MyFunctions.getFormatCost('${widget.minimumPrice}')} ${widget.currency}',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    },
                    const SizedBox(height: 25),
                    SwitcherRowAsButtonAlso(
                      value: widget.rentToBuy && widget.conditions.isNotEmpty,
                      onTap: () {
                        if (widget.conditions.isEmpty) {
                          if ((int.tryParse(priceController.text
                                      .replaceAll(' ', '')) ??
                                  0) >
                              0) {
                            showModalBottomSheet<RentWithPurchaseEntity>(
                                useRootNavigator: true,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                isDismissible: false,
                                context: context,
                                builder: (context) => RentToBuySheet(
                                    idForNewCondition: widget.conditions.length,
                                    price: int.tryParse(
                                            widget.price.replaceAll(' ', '')) ??
                                        0)).then(
                              (value) {
                                if (value != null) {
                                  widget.onConditionChanged(value);
                                }
                              },
                            );
                          } else {
                            context.read<ShowPopUpBloc>().add(ShowPopUp(
                                  message: LocaleKeys.the_before_enter_price.tr(),
                                  status: PopStatus.warning,
                                ));
                          }
                        }
                      },
                      onChanged: (v) {
                        widget.onSwitchChanged(v);
                      },
                      title: LocaleKeys.rent_to_sale.tr(),
                    ),
                    const SizedBox(height: 16),
                    const SizedBox(
                      height: 16,
                    ),
                    if (widget.rentToBuy && widget.conditions.isNotEmpty) ...{
                      ...widget.conditions
                          .map((entity) => RentToSaleDetailsBox(
                                onTap: () {
                                  showModalBottomSheet<RentWithPurchaseEntity>(
                                      useRootNavigator: true,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      isDismissible: false,
                                      context: context,
                                      builder: (context) => RentToBuySheet(
                                          idForNewCondition:
                                              widget.conditions.length,
                                          entityForEdit: entity,
                                          price: int.tryParse(widget.price
                                                  .replaceAll(' ', '')) ??
                                              0)).then(
                                    (value) {
                                      if (value != null) {
                                        widget.onConditionChanged(value);
                                      }
                                    },
                                  );
                                },
                                monthlyPayment: entity.monthlyPayment,
                                prePayment: entity.prepayment,
                                rentalPeriod: entity.rentalPeriod,
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
                              builder: (context) => RentToBuySheet(
                                    idForNewCondition: widget.conditions.length,
                                    price: int.tryParse(
                                            widget.price.replaceAll(' ', '')) ??
                                        0,
                                  )).then((value) {
                            if (value != null) {
                              widget.onConditionChanged(value);
                            }
                          });
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              LocaleKeys.add_rent_condition.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
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
                            ),
                          ],
                        ),
                      ),
                    }
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

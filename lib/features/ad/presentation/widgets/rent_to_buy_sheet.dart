import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/rent_to_buy/rent_to_buy_bloc.dart';
import 'package:auto/features/car_single/presentation/widgets/orange_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class RentToBuySheet extends StatefulWidget {
  final int step;
  const RentToBuySheet({required this.step, super.key});

  @override
  State<RentToBuySheet> createState() => _RentToBuySheetState();
}

class _RentToBuySheetState extends State<RentToBuySheet> {
  TextEditingController controller = TextEditingController();
  late RentToBuyBloc rentToBuyBloc;
  @override
  void initState() {
    rentToBuyBloc = RentToBuyBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: rentToBuyBloc,
        child: KeyboardDismisser(
          child: BlocBuilder<RentToBuyBloc, RentToBuyState>(
            builder: (context, state) => Container(
              padding: EdgeInsets.only(
                top: 20,
                right: 16,
                left: 16,
                bottom: MediaQuery.of(context).padding.bottom + 42,
              ),
              margin: MediaQuery.of(context).viewInsets,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '(${state.step}/3)',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        state.title,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Transform.scale(
                          scale: .8,
                          child: SvgPicture.asset(
                            AppIcons.close,
                            width: 32,
                            height: 32,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 27),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 3 - 32),
                    child: TextField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.center,
                      cursorColor: white,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 24, fontWeight: FontWeight.w400),
                      controller: controller,
                      decoration: InputDecoration(
                        errorBorder: _border(),
                        enabledBorder: _border(),
                        focusedBorder: _border(),
                        disabledBorder: _border(),
                        focusedErrorBorder: _border(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  OrangeButton(
                    shadowColor: orange.withOpacity(0.2),
                    color: orange,
                    onTap: () {
                      if (state.step < 3) {
                        switch (state.step) {
                          case 1:
                            rentToBuyBloc.add(RentToBuyEvent(
                                title: 'Срок аренды (в месяцах)',
                                step: state.step + 1,
                                startingPay: controller.text));
                            break;
                          case 2:
                            rentToBuyBloc.add(RentToBuyEvent(
                              title: 'Ежемесячная оплата',
                              step: state.step + 1,
                            ));
                            break;
                          default:
                        }
                        return;
                      }
                      Navigator.of(context).pop(controller.text);
                    },
                    content: Text(
                      'Продолжить',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: white,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  UnderlineInputBorder _border() => UnderlineInputBorder(
      borderSide: BorderSide(
          color: Theme.of(context)
              .extension<ThemedColors>()!
              .mediumSlateBlueToWhite));
}

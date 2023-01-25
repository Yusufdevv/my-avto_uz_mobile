import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/common/widgets/w_check_box.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class DescriptionScreen extends StatefulWidget {
  final String initialText;
  const DescriptionScreen({required this.initialText, Key? key})
      : super(key: key);

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  late TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController(text: widget.initialText);
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          body: BaseWidget(
            headerText: 'Описание',
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<PostingAdBloc, PostingAdState>(
                builder: (context, state) => Column(
                  children: [
                    Expanded(
                        child: ListView(
                      padding: EdgeInsets.only(
                          bottom:
                              MediaQuery.of(context).viewInsets.bottom + 60),
                      children: [
                        Text(
                          'Пожалуйста, не указывайте ссылки, цену, контактные данные и не предлагайте услуги — такое объявление не пройдет модерацию',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .aluminumToDolphin),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        WTextField(
                          onChanged: (value) => context
                              .read<PostingAdBloc>()
                              .add(PostingAdChooseEvent(description: value)),
                          hintText:
                              'Честно опишите достоинства и недостатки своего автомобиля',
                          disabledBorderColor: Theme.of(context)
                              .extension<ThemedColors>()!
                              .transparentToNightRider,
                          enabledBorderColor: Theme.of(context)
                              .extension<ThemedColors>()!
                              .transparentToNightRider,
                          borderColor: Theme.of(context)
                              .extension<ThemedColors>()!
                              .transparentToNightRider,
                          fillColor: Theme.of(context)
                              .extension<ThemedColors>()!
                              .whiteSmokeToDark,
                          focusColor: Theme.of(context)
                              .extension<ThemedColors>()!
                              .whiteSmokeToDark,
                          disabledColor: Theme.of(context)
                              .extension<ThemedColors>()!
                              .whiteSmokeToDark,
                          controller: textController,
                          borderRadius: 8,
                          maxLines: 6,
                          height: 125,
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        GestureDetector(
                            onTap: () => context.read<PostingAdBloc>().add(
                                PostingAdChooseEvent(
                                    isRastamojen:
                                        !state.registeredInUzbekistan)),
                            child: Row(
                              children: [
                                WCheckBox(
                                    isChecked: state.registeredInUzbekistan,
                                    checkBoxColor: purple),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Не растаможен',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(color: greyText),
                                )
                              ],
                            ))
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

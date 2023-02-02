import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/common/widgets/w_check_box.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
            headerText: LocaleKeys.description.tr(),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<PostingAdBloc, PostingAdState>(
                builder: (context, state) => Column(
                  children: [
                    Expanded(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom + 60),
                        children: [
                          Text(
                            LocaleKeys.description_dont_do.tr(),
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
                            hintText: LocaleKeys.be_honest.tr(),
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
                            textStyle: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(height: 28),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () => context.read<PostingAdBloc>().add(
                                PostingAdChooseEvent(
                                    isRastamojen:
                                        !state.notRegisteredInUzbekistan)),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                WCheckBox(

                                    isChecked: state.notRegisteredInUzbekistan,
                                    checkBoxColor: purple),
                                const SizedBox(width: 10),
                                Text(
                                  LocaleKeys.ne_rastomojen.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(color: greyText),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/add_image_instructions/add_image_instructions_bloc.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddPhotoInstructionsScreen extends StatefulWidget {
  const AddPhotoInstructionsScreen({Key? key}) : super(key: key);

  @override
  State<AddPhotoInstructionsScreen> createState() =>
      _AddPhotoInstructionsScreenState();
}

class _AddPhotoInstructionsScreenState
    extends State<AddPhotoInstructionsScreen> {
  late AddImageInstructionsBloc bloc;
  @override
  void initState() {
    bloc = AddImageInstructionsBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: bloc,
        child: Scaffold(
          appBar: WAppBar(
              title: 'Добавление фото',
              backgroundColor: white,
              hasBackButton: true,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 8),
                    blurRadius: 11,
                    spreadRadius: 0,
                    color: dark.withOpacity(.04))
              ]),
          body: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 44),
            child: Center(
                child: BlocBuilder<AddImageInstructionsBloc,
                    AddImageInstructionsState>(
              builder: (context, state) => Column(
                children: [
                  StepBoxOfPhotoInstruction(
                    length: state.instructions.length,
                    step: state.step,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 229,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(6)),
                    // child: Image.asset(
                    //   AppImages.audi,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Expanded(
                        child: Text(
                      state.instructions[state.step],
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                    )),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const SizedBox(width: 16),
                      Expanded(
                        child: WButton(
                          color: warmerGrey,
                          onTap: () {
                            if (state.step > 0) {
                              bloc.add(AddImageInstructionsChangeStepEvent(
                                  forward: false));
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(AppIcons.arrowLeft,
                                    height: 20),
                                Text(
                                  'Назад',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                const SizedBox()
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: WButton(
                          onTap: () {
                            if (state.step < state.instructions.length - 1) {
                              bloc.add(AddImageInstructionsChangeStepEvent(
                                  forward: true));
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(),
                                Text(
                                  LocaleKeys.further.tr(),
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                SvgPicture.asset(AppIcons.arrowRight,
                                    height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16)
                    ],
                  ),
                ],
              ),
            )),
          ),
        ),
      );
}

class StepBoxOfPhotoInstruction extends StatelessWidget {
  final int step;
  final int length;
  const StepBoxOfPhotoInstruction({
    required this.step,
    required this.length,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: Column(children: [
          SizedBox(
              height: 64,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  length,
                  (index) => Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 28,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${index + 1}',
                          style: step == index
                              ? Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    color: purple,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  )
                              : Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .extension<ThemedColors>()!
                                        .ghostToGreySuit,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        if (step == index) ...{
                          Container(
                            height: 3,
                            decoration: const BoxDecoration(
                              color: purple,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(3)),
                              // border: Border(
                              //   bottom: BorderSide(
                              //     strokeAlign: StrokeAlign.inside,
                              //     color: white,
                              //     width: 1,
                              //   ),
                              // ),
                            ),
                          )
                        }
                      ],
                    ),
                  ),
                ),
              )),
        ]),
      );
}

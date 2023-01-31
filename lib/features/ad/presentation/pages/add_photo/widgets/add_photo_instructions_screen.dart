import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/usecases/foto_instructions_usecase.dart';
import 'package:auto/features/ad/presentation/bloc/add_image_instructions/add_image_instructions_bloc.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/step_box.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class PhotoInstructionsScreen extends StatefulWidget {
  const PhotoInstructionsScreen({Key? key}) : super(key: key);

  @override
  State<PhotoInstructionsScreen> createState() =>
      _PhotoInstructionsScreenState();
}

class _PhotoInstructionsScreenState extends State<PhotoInstructionsScreen> {
  late PhotoInstructionBloc bloc;
  @override
  void initState() {
    bloc = PhotoInstructionBloc(
        useCase: PhotoInstructionsUseCase(
            repository: serviceLocator<AdRepositoryImpl>()))
      ..add(PhotoInstructionGetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: bloc,
        child: Scaffold(
          appBar: WAppBar(
            title: LocaleKeys.adding_photo.tr(),
            backgroundColor: white,
            hasBackButton: true,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 8),
                blurRadius: 11,
                spreadRadius: 0,
                color: dark.withOpacity(.04),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 44),
            child: Center(child:
                BlocBuilder<PhotoInstructionBloc, PhotoInstructionState>(
                    builder: (context, state) {
              if (state.status == FormzStatus.submissionInProgress) {
                return const Center(child: CupertinoActivityIndicator());
              }
              if (state.instructions.isEmpty) {
                return const Center(child: Text('No Instructions available'));
              }
              return Column(
                children: [
                  const StepBoxOfPhotoInstruction(),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 229,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(6)),
                    child: Image.network(
                      state.instructions[state.step].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Text(
                      state.instructions[state.step].description,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const SizedBox(width: 16),
                      Expanded(
                        child: WButton(
                          color: warmerGrey,
                          onTap: () => bloc.add(
                              PhotoInstructionMoveStepEvent(isForward: false)),
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
                          onTap: () => bloc.add(
                              PhotoInstructionMoveStepEvent(isForward: true)),
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
              );
            })),
          ),
        ),
      );
}

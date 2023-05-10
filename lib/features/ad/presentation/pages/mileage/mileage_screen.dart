import 'dart:developer';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/formatters.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/features/ad/presentation/bloc/mileage/mileage_image_bloc.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/add_photo_screen.dart';
import 'package:auto/features/ad/presentation/pages/mileage/widgets/mileage_image.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/switcher_row.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/profile/presentation/widgets/camera_bottom_sheet.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class MileageScreen extends StatefulWidget {
  final Function(String) onImageChange;
  final String initialMileage;
  final String? initialMileageImage;
  final PAShowToast onShowToast;
  final ValueChanged<String> onMileageChanged;
  final bool? isWithoutMileage;
  final ValueChanged<bool> onIsWithoutMileageChanged;

  const MileageScreen({
    required this.onIsWithoutMileageChanged,
    required this.isWithoutMileage,
    required this.onImageChange,
    required this.initialMileage,
    required this.initialMileageImage,
    required this.onShowToast,
    required this.onMileageChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<MileageScreen> createState() => _MileageScreenState();
}

class _MileageScreenState extends State<MileageScreen> {
  late TextEditingController mileageController;
  late MileageImageBloc mileageImageBloc;

  @override
  void initState() {
    mileageImageBloc = MileageImageBloc(widget.initialMileageImage);
    mileageController = TextEditingController(text: widget.initialMileage);

    super.initState();
  }

  @override
  void dispose() {
    mileageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: mileageImageBloc,
        child: KeyboardDismisser(
          child: Scaffold(
            body: BlocConsumer<MileageImageBloc, MileageImageState>(
              listener: (context, state) {
                widget.onImageChange(state.image!);

                if (state.toastMessage != null &&
                    state.toastMessage!.isNotEmpty) {
                  widget.onShowToast(state.toastMessage!, PopStatus.warning);

                  mileageImageBloc.add(MakeToastMessageNullEvent());
                }
              },
              builder: (context, state) => BaseWidget(
                headerText: LocaleKeys.Mileage.tr(),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SwitcherRow(
                        title: LocaleKeys.without_milaege.tr(),
                        value: widget.isWithoutMileage ?? false,
                        onChanged: widget.onIsWithoutMileageChanged,
                      ),
                      const SizedBox(height: 21),
                      if (!(widget.isWithoutMileage ?? false)) ...{
                        WTextField(
                          textStyle: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                          textInputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            ThousandsSeparatorInputFormatter(),
                          ],
                          maxLength: 12,
                          hideCounterText: true,
                          onChanged: widget.onMileageChanged,
                          title: LocaleKeys.Mileage.tr(),
                          hintText: '0 km',
                          borderRadius: 12,
                          keyBoardType: TextInputType.phone,
                          controller: mileageController,
                          fillColor: Theme.of(context)
                              .extension<WTextFieldStyle>()!
                              .fillColor,
                          focusColor: Theme.of(context)
                              .extension<WTextFieldStyle>()!
                              .fillColor,
                          disabledColor: Theme.of(context)
                              .extension<WTextFieldStyle>()!
                              .fillColor,
                        ),
                      },
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        LocaleKeys.milage_photo.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: grey),
                      ),
                      const SizedBox(height: 8),
                      MileageImageItem(
                        image: state.image,
                        onTap: () async {
                          await showModalBottomSheet<ImageSource>(
                              backgroundColor: Colors.transparent,
                              context: context,
                              useRootNavigator: true,
                              builder: (context) =>
                                  const CameraBottomSheet()).then((value) {
                            if (value != null) {
                              try {
                                mileageImageBloc
                                    .add(PickMileageImage(source: value));
                              } catch (e) {
                                log(':::::::::: pick image exception: ${e.toString()}  ::::::::::');
                              }
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

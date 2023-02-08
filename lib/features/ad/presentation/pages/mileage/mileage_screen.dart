import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/formatters.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/features/ad/presentation/bloc/mileage/mileage_image_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/mileage/widgets/mileage_image.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/common/widgets/switcher_row.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class MileageScreen extends StatefulWidget {
  final Function(String) onImageChange;
  final String initialMileage;
  final String? initialMileageImage;
  const MileageScreen(
      {required this.onImageChange, required this.initialMileage,required this.initialMileageImage, Key? key})
      : super(key: key);

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
               if(state.image != null&& state.image!.isNotEmpty) {
                  widget.onImageChange(state.image!);
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
                        value: context
                                .watch<PostingAdBloc>()
                                .state
                                .isWithoutMileage ??
                            false,
                        onChanged: (v) => context.read<PostingAdBloc>().add(
                              PostingAdChooseEvent(isWithoutMileage: v),
                            ),
                      ),
                      const SizedBox(height: 21),
                      if (!(context
                              .watch<PostingAdBloc>()
                              .state
                              .isWithoutMileage ??
                          false)) ...{
                        WTextField(
                          textStyle: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                          textInputFormatters: [
                            ThousandsSeparatorInputFormatter()
                          ],
                          maxLength: 12,
                          hideCounterText: true,
                          onChanged: (value) => context
                              .read<PostingAdBloc>()
                              .add(PostingAdChooseEvent(mileage: value)),
                          title: LocaleKeys.Mileage.tr(),
                          hintText: '0 km',
                          borderRadius: 12,
                          keyBoardType: TextInputType.number,
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
                        '${LocaleKeys.photo.tr()} 360°',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: grey),
                      ),
                      const SizedBox(height: 8),
                      MileageImageItem(image: state.image),
                      const SizedBox(
                        height: 20
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

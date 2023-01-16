import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/features/ad/presentation/bloc/mileage/mileage_image_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/mileage/widgets/mileage_image.dart';
import 'package:auto/features/common/widgets/switcher_row.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class MileageScreen extends StatefulWidget {
  final String initialMilage;
  const MileageScreen({required this.initialMilage, Key? key})
      : super(key: key);

  @override
  State<MileageScreen> createState() => _MileageScreenState();
}

class _MileageScreenState extends State<MileageScreen> {
  late TextEditingController mileageController;
  late MileageImageBloc mileageImageBloc;

  @override
  void initState() {
    mileageImageBloc = MileageImageBloc();
    mileageController = TextEditingController(text: widget.initialMilage);

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
            body: BlocBuilder<MileageImageBloc, MileageImageState>(
              builder: (context, state) => BaseWidget(
                headerText: 'Пробег',
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SwitcherRow(
                        title: 'Без пробега',
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
                          maxLength: 6,
                          hideCounterText: true,
                          onChanged: (value) => context
                              .read<PostingAdBloc>()
                              .add(PostingAdChooseEvent(mileage: value)),
                          title: 'Пробег',
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
                        'Фото 360°',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: grey),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      MileageImageItem(image: state.image),
                      const SizedBox(
                        height: 20,
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

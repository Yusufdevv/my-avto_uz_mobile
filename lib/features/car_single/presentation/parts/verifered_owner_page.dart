import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/presentation/parts/sts_image_item_widget.dart';
import 'package:auto/features/car_single/presentation/parts/verifired_owner_more_btsht.dart';
import 'package:auto/features/car_single/presentation/widgets/invoice_termsofsuse.dart';
import 'package:auto/features/common/bloc/image/image_bloc.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/profile/presentation/widgets/camera_bottom_sheet.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class VerifiredOwnerPage extends StatefulWidget {
  const VerifiredOwnerPage({Key? key}) : super(key: key);

  @override
  State<VerifiredOwnerPage> createState() => _VerifiredOwnerPageState();
}

class _VerifiredOwnerPageState extends State<VerifiredOwnerPage> {
  late ImageBloc imageBloc;
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    imageBloc = ImageBloc(ImagePicker());
    textController = TextEditingController();
  }

  @override
  void dispose() {
    imageBloc.close();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: imageBloc,
        child: BlocConsumer<ImageBloc, ImageState>(
          listener: (context, state) {},
          builder: (context, state) => Scaffold(
            backgroundColor: white,
            appBar: WAppBar(
              title: LocaleKeys.verified_owner.tr(),
              extraActions: [
                if (!(state.images.length < 2 || state.secondImage.isEmpty))
                  WScaleAnimation(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SvgPicture.asset(
                        AppIcons.moreVertical,
                        width: 32,
                        height: 32,
                        color: grey,
                      ),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                          useRootNavigator: true,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) =>
                              const VerifiredOwnerMoreBtsht());
                    },
                  ),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        LocaleKeys.sts.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: grey),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                useRootNavigator: true,
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                context: context,
                                builder: (context) =>
                                    const VerifiredOwnerMoreBtsht());
                          },
                          behavior: HitTestBehavior.opaque,
                          child:
                              SvgPicture.asset(AppIcons.infoCircle, height: 24))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16).copyWith(top: 8),
                  child: Row(
                    children: [
                      StsImageItemWidget(
                        title: 'передняя сторона',
                        images: state.images[0],
                        onTap: () async {
                          await showModalBottomSheet<ImageSource>(
                              backgroundColor: Colors.transparent,
                              context: context,
                              useRootNavigator: true,
                              builder: (context) =>
                                  const CameraBottomSheet()).then((value) {
                            if (value != null) {
                              context.read<ImageBloc>().add(
                                  PickSTSImageEvent(source: value, index: 0));
                            }
                          });
                        },
                      ),
                      const SizedBox(width: 12),
                      StsImageItemWidget(
                        title: 'задняя сторона',
                        images: state.images[1],
                        onTap: () async {
                          await showModalBottomSheet<ImageSource>(
                              backgroundColor: Colors.transparent,
                              context: context,
                              useRootNavigator: true,
                              builder: (context) =>
                                  const CameraBottomSheet()).then((value) {
                            if (value != null) {
                              context.read<ImageBloc>().add(
                                  PickSTSImageEvent(source: value, index: 1));
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        LocaleKeys.driver_licence.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: grey),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                useRootNavigator: true,
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                context: context,
                                builder: (context) =>
                                    const VerifiredOwnerMoreBtsht());
                          },
                          behavior: HitTestBehavior.opaque,
                          child:
                              SvgPicture.asset(AppIcons.infoCircle, height: 24))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16).copyWith(top: 8),
                  child: Row(
                    children: [
                      StsImageItemWidget(
                        title: 'передняя сторона',
                        images: state.secondImage[0],
                        onTap: () async {
                          await showModalBottomSheet<ImageSource>(
                              backgroundColor: Colors.transparent,
                              context: context,
                              useRootNavigator: true,
                              builder: (context) =>
                                  const CameraBottomSheet()).then((value) {
                            if (value != null) {
                              context.read<ImageBloc>().add(
                                  PickDriverLicenceImageEvent(
                                      source: value, index: 0));
                            }
                          });
                        },
                      ),
                      const SizedBox(width: 12),
                      StsImageItemWidget(
                        title: 'задняя сторона',
                        images: state.secondImage[1],
                        onTap: () async {
                          await showModalBottomSheet<ImageSource>(
                              backgroundColor: Colors.transparent,
                              context: context,
                              useRootNavigator: true,
                              builder: (context) =>
                                  const CameraBottomSheet()).then((value) {
                            if (value != null) {
                              context.read<ImageBloc>().add(
                                  PickDriverLicenceImageEvent(
                                      source: value, index: 1));
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Дополнительная информация',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16).copyWith(top: 8),
                  child: WTextField(
                    onChanged: (value) {},
                    hintText: 'Напишите информацию для модератора',
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
                    hideCounterText: true,
                    borderRadius: 8,
                    maxLength: 500,
                    maxLines: 6,
                    height: 125,
                    textStyle: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const InvoiceTermsOfUse(),
                      const SizedBox(height: 16),
                      WButton(
                        // isLoading: state.payStatus.isSubmissionInProgress,
                        isDisabled: state.images[0].isEmpty ||
                            state.images[1].isEmpty ||
                            state.secondImage[0].isEmpty ||
                            state.secondImage[1].isEmpty,
                        disabledColor: disabledButton,
                        text: LocaleKeys.apply_app.tr(),
                        color: orange,
                        onTap: () {},
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

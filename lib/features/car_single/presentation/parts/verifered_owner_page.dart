import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/data/model/create_owner.dart';
import 'package:auto/features/car_single/presentation/bloc/create_owner/create_owner_bloc.dart';
import 'package:auto/features/car_single/presentation/parts/clue_btsht.dart';
import 'package:auto/features/car_single/presentation/parts/sts_image_item_widget.dart';
import 'package:auto/features/car_single/presentation/parts/verifired_owner_more_btsht.dart';
import 'package:auto/features/car_single/presentation/widgets/applications_rejected_ui.dart';
import 'package:auto/features/car_single/presentation/widgets/invoice_termsofsuse.dart';
import 'package:auto/features/car_single/presentation/widgets/verifired_owner_moderation_btn.dart';
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
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

class VerifiredOwnerPage extends StatefulWidget {
  const VerifiredOwnerPage({
    required this.announcementId,
    this.isDeleted = false,
    this.comment = '',
    Key? key,
  }) : super(key: key);
  final int announcementId;
  final bool isDeleted;
  final String comment;

  @override
  State<VerifiredOwnerPage> createState() => _VerifiredOwnerPageState();
}

class _VerifiredOwnerPageState extends State<VerifiredOwnerPage> {
  late ImageBloc imageBloc;
  late CreateOwnerBloc createOwnerBloc;
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    imageBloc = ImageBloc(ImagePicker());
    createOwnerBloc = CreateOwnerBloc()
      ..add(SetRejectedStatusEvent(rejected: widget.isDeleted));
    textController = TextEditingController();
  }

  @override
  void dispose() {
    imageBloc.close();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: imageBloc),
          BlocProvider.value(value: createOwnerBloc),
        ],
        child: BlocBuilder<ImageBloc, ImageState>(
          builder: (context, state) => GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: BlocBuilder<CreateOwnerBloc, CreateOwnerState>(
              builder: (context, stateOwner) => WillPopScope(
                onWillPop: () async {
                  Navigator.pop(context,
                      stateOwner.showModerationBtn ? 'in_moderation' : null);
                  return false;
                },
                child: Scaffold(
                  backgroundColor:
                      Theme.of(context).extension<ThemedColors>()!.whiteToDark,
                  appBar: WAppBar(
                    onTapBack: () {
                      Navigator.pop(
                          context,
                          stateOwner.showModerationBtn
                              ? 'in_moderation'
                              : null);
                    },
                    title: LocaleKeys.verified_owner.tr(),
                    extraActions: [
                      if (stateOwner.showMoreBtn)
                        WScaleAnimation(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: SvgPicture.asset(AppIcons.moreVertical,
                                width: 32, height: 32, color: grey),
                          ),
                          onTap: () {
                            showModalBottomSheet(
                              useRootNavigator: true,
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              context: context,
                              builder: (context) =>
                                  const VerifiredOwnerMoreBtsht(),
                            ).then((value) {
                              if (value != null) {
                                if (value is Map<String, dynamic>) {
                                  if (value['refresh']) {
                                    createOwnerBloc.add(ChangeUIStatusEvent(
                                        refresh: value['refresh']));
                                  }
                                  if (value['delete']) {
                                    textController.clear();
                                    for (var i = 0; i <= 1; i++) {
                                      context.read<ImageBloc>().add(
                                          DeleteImageEvent(
                                              imageUrl: state.images[i]));
                                      context.read<ImageBloc>().add(
                                          DeleteImageEvent(
                                              imageUrl: state.secondImage[i]));
                                    }
                                    createOwnerBloc.add(DeleteApplicaitionEvent(
                                        id: stateOwner.createOwnerModel.id));
                                  }
                                }
                              }
                            });
                          },
                        )
                    ],
                  ),
                  body: stateOwner.isDeleted
                      ? ApplicationRejectedUI(widget.comment)
                      : SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 14),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  children: [
                                    Text(
                                      LocaleKeys.sts.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .extension<ThemedColors>()!
                                                  .greySuitToWhite60),
                                    ),
                                    const SizedBox(width: 8),
                                    GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                              useRootNavigator: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (context) => ClueBtsht(
                                                    title: LocaleKeys
                                                        .take_a_picture_of_the_STS_car_from
                                                        .tr(),
                                                  ));
                                        },
                                        behavior: HitTestBehavior.opaque,
                                        child: SvgPicture.asset(
                                            AppIcons.infoCircle,
                                            height: 24))
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.all(16).copyWith(top: 8),
                                child: Row(
                                  children: [
                                    StsImageItemWidget(
                                      height: 110,
                                      width:
                                          (MediaQuery.of(context).size.width /
                                                  2) -
                                              24,
                                      title: LocaleKeys.front_side.tr(),
                                      image: state.images[0],
                                      video: '',
                                      onTap: () async {
                                        await showModalBottomSheet<ImageSource>(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            useRootNavigator: true,
                                            builder: (context) =>
                                                const CameraBottomSheet()).then(
                                            (value) {
                                          if (value != null) {
                                            context.read<ImageBloc>().add(
                                                PickSTSImageEvent(
                                                    source: value, index: 0));
                                          }
                                        });
                                      },
                                      onTapDelete: () {
                                        context.read<ImageBloc>().add(
                                            DeleteImageEvent(
                                                imageUrl: state.images[0]));
                                      },
                                    ),
                                    const SizedBox(width: 12),
                                    StsImageItemWidget(
                                      height: 110,
                                      width:
                                          (MediaQuery.of(context).size.width /
                                                  2) -
                                              24,
                                      title: LocaleKeys.back_side.tr(),
                                      image: state.images[1],
                                      video: '',
                                      onTap: () async {
                                        await showModalBottomSheet<ImageSource>(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            useRootNavigator: true,
                                            builder: (context) =>
                                                const CameraBottomSheet()).then(
                                            (value) {
                                          if (value != null) {
                                            context.read<ImageBloc>().add(
                                                PickSTSImageEvent(
                                                    source: value, index: 1));
                                          }
                                        });
                                      },
                                      onTapDelete: () {
                                        context.read<ImageBloc>().add(
                                            DeleteImageEvent(
                                                imageUrl: state.images[0]));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  children: [
                                    Text(
                                      LocaleKeys.driver_licence.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .extension<ThemedColors>()!
                                                  .greySuitToWhite60),
                                    ),
                                    const SizedBox(width: 8),
                                    GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                              useRootNavigator: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (context) => ClueBtsht(
                                                    title: LocaleKeys
                                                        .take_a_picture_of_the_drivers_license
                                                        .tr(),
                                                  ));
                                        },
                                        behavior: HitTestBehavior.opaque,
                                        child: SvgPicture.asset(
                                            AppIcons.infoCircle,
                                            height: 24))
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.all(16).copyWith(top: 8),
                                child: Row(
                                  children: [
                                    StsImageItemWidget(
                                      height: 110,
                                      width:
                                          (MediaQuery.of(context).size.width /
                                                  2) -
                                              24,
                                      title: LocaleKeys.front_side.tr(),
                                      image: state.secondImage[0],
                                      video: '',
                                      onTap: () async {
                                        await showModalBottomSheet<ImageSource>(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            useRootNavigator: true,
                                            builder: (context) =>
                                                const CameraBottomSheet()).then(
                                            (value) {
                                          if (value != null) {
                                            context.read<ImageBloc>().add(
                                                PickDriverLicenceImageEvent(
                                                    source: value, index: 0));
                                          }
                                        });
                                      },
                                      onTapDelete: () {
                                        context.read<ImageBloc>().add(
                                            DeleteImageEvent(
                                                imageUrl: state.images[0]));
                                      },
                                    ),
                                    const SizedBox(width: 12),
                                    StsImageItemWidget(
                                      height: 110,
                                      width:
                                          (MediaQuery.of(context).size.width /
                                                  2) -
                                              24,
                                      title: LocaleKeys.back_side.tr(),
                                      image: state.secondImage[1],
                                      video: '',
                                      onTap: () async {
                                        await showModalBottomSheet<ImageSource>(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            useRootNavigator: true,
                                            builder: (context) =>
                                                const CameraBottomSheet()).then(
                                            (value) {
                                          if (value != null) {
                                            context.read<ImageBloc>().add(
                                                PickDriverLicenceImageEvent(
                                                    source: value, index: 1));
                                          }
                                        });
                                      },
                                      onTapDelete: () {
                                        context.read<ImageBloc>().add(
                                            DeleteImageEvent(
                                                imageUrl: state.images[0]));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  LocaleKeys.additional_information.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .extension<ThemedColors>()!
                                              .greySuitToWhite60),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.all(16).copyWith(top: 8),
                                child: WTextField(
                                  onChanged: (value) {},
                                  hintText: LocaleKeys
                                      .write_information_for_the_moderator
                                      .tr(),
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
                                  readOnly: stateOwner.showModerationBtn,
                                  borderRadius: 8,
                                  maxLength: 500,
                                  maxLines: 5,
                                  height: 125,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                  bottomNavigationBar: Padding(
                    padding: const EdgeInsets.all(16),
                    child: stateOwner.showModerationBtn
                        ? VerifyOwnerModerationBtn()
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (!stateOwner.isDeleted) ...{
                                const InvoiceTermsOfUse(),
                                const SizedBox(height: 16),
                                WButton(
                                  isLoading:
                                      stateOwner.status.isSubmissionInProgress,
                                  isDisabled: state.images[0].isEmpty ||
                                      state.images[1].isEmpty ||
                                      state.secondImage[0].isEmpty ||
                                      state.secondImage[1].isEmpty,
                                  disabledColor: disabledButton,
                                  text: stateOwner.isDeleted
                                      ? LocaleKeys.repeat_application.tr()
                                      : LocaleKeys.apply_app.tr(),
                                  color: orange,
                                  onTap: () {
                                    if (!stateOwner.isDeleted) {
                                      FocusScope.of(context).unfocus();
                                      createOwnerBloc.add(
                                        VerifyOwnerCreateEvent(
                                          createOwnerModel: CreateOwnerModel(
                                            id: 0,
                                            user: 0,
                                            announcement: widget.announcementId,
                                            additionalInfo: textController.text,
                                            technicalPasswordFront:
                                                state.images[0],
                                            technicalPasswordBack:
                                                state.images[1],
                                            driverLicenceFront:
                                                state.secondImage[0],
                                            driverlicenceBack:
                                                state.secondImage[1],
                                          ),
                                          onSuccess: () {},
                                          onError: () {},
                                        ),
                                      );
                                    }
                                  },
                                ),
                              },
                              if (stateOwner.isDeleted)
                                WButton(
                                  isLoading:
                                      stateOwner.status.isSubmissionInProgress,
                                  text: LocaleKeys.repeat_application.tr(),
                                  color: orange,
                                  onTap: () {
                                    if (stateOwner.isDeleted) {
                                      createOwnerBloc.add(
                                          ReApplicationEvent(refresh: true));
                                    }
                                  },
                                ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

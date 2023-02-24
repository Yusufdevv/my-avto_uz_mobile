import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/ad/presentation/bloc/add_photo/image_bloc.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/pages/my_profile/phone_number_edit_page.dart';
import 'package:auto/features/profile/presentation/widgets/widgets.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/rent_choose_region_bottom_sheet.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ProfileEditPage extends StatefulWidget {
  final ImageBloc imageBloc;

  const ProfileEditPage({
    required this.imageBloc,
    Key? key,
  }) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  late TextEditingController _nameCont;
  late TextEditingController _emailCont;
  Region? newRegion;

  @override
  void initState() {
    _nameCont = TextEditingController(
        text: context.read<ProfileBloc>().state.profileEntity.fullName);
    _emailCont = TextEditingController(
        text: context.read<ProfileBloc>().state.profileEntity.email);

    if (context.read<RegionsBloc>().state.regions.isEmpty) {
      context.read<RegionsBloc>().add(RegionsEvent.getRegions());
    }
    widget.imageBloc
        .add(DeleteImage(imageUrl: widget.imageBloc.state.image.path));
    super.initState();
  }

  bool isChanged({
    required String oldFullName,
    required String oldEmailName,
  }) {
    // ignore: unrelated_type_equality_checks
    final result = (oldFullName != _nameCont.text) ||
        widget.imageBloc.state.image.path.isNotEmpty;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.imageBloc),
      ],
      child: BlocBuilder<ProfileBloc, ProfileState>(
        // ignore: prefer_expression_function_bodies
        builder: (context, stateProfile) {
          if (stateProfile.status.isSubmissionInProgress) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (stateProfile.status.isSubmissionSuccess) {
            return CustomScreen(
              child: KeyboardDismisser(
                child: Scaffold(
                  appBar: WAppBar(
                    textWithButton: LocaleKeys.my_profile.tr(),
                  ),
                  bottomNavigationBar: WButton(
                    color: (_nameCont.text !=
                                    context
                                        .read<ProfileBloc>()
                                        .state
                                        .profileEntity
                                        .fullName ||
                                context
                                    .watch<ImageBloc>()
                                    .state
                                    .image
                                    .path
                                    .isNotEmpty ||
                                newRegion?.id != null ||
                                _emailCont.text !=
                                    context
                                        .read<ProfileBloc>()
                                        .state
                                        .profileEntity
                                        .email) &&
                            _nameCont.text.isNotEmpty
                        ? orange
                        : disabledButton,
                    isLoading: stateProfile.editStatus.isSubmissionInProgress,
                    margin: EdgeInsets.fromLTRB(
                        16, 0, 16, 8 + mediaQuery.padding.bottom),
                    text: LocaleKeys.save.tr(),
                    onTap: () {
                      if (_nameCont.text !=
                              context
                                  .read<ProfileBloc>()
                                  .state
                                  .profileEntity
                                  .fullName ||
                          widget.imageBloc.state.image.path.isNotEmpty ||
                          newRegion?.id != null ||
                          _emailCont.text !=
                              context
                                  .read<ProfileBloc>()
                                  .state
                                  .profileEntity
                                  .email) {
                        if (_emailCont.text !=
                                context
                                    .read<ProfileBloc>()
                                    .state
                                    .profileEntity
                                    .email &&
                            !MyFunctions.isEmail(_emailCont.text)) {
                          context.read<ShowPopUpBloc>().add(ShowPopUp(
                              message: LocaleKeys.please_enter_valid_email.tr(),
                              status: PopStatus.error));
                        } else if (_nameCont.text.isNotEmpty) {
                          context.read<ProfileBloc>().add(
                                EditProfileEvent(
                                  fullName: _nameCont.text,
                                  image: widget
                                          .imageBloc.state.image.path.isNotEmpty
                                      ? widget.imageBloc.state.image.path
                                      : null,
                                  region: newRegion?.id,
                                  email: _emailCont.text,
                                  onSuccess: () {
                                    context
                                        .read<ProfileBloc>()
                                        .add(GetProfileEvent());
                                    Navigator.pop(context);
                                    context.read<ShowPopUpBloc>().add(ShowPopUp(
                                        message: LocaleKeys
                                            .data_changed_succesfully
                                            .tr(),
                                        status: PopStatus.success));
                                  },
                                  onError: (text) {
                                    var error = text;
                                    if (error.toLowerCase().contains('dio') ||
                                        error.toLowerCase().contains('type')) {
                                      error = LocaleKeys.service_error.tr();
                                    }
                                    context.read<ShowPopUpBloc>().add(ShowPopUp(
                                        message: error,
                                        status: PopStatus.error));
                                  },
                                ),
                              );
                        } else {
                          context.read<ShowPopUpBloc>().add(ShowPopUp(
                              message: LocaleKeys.add_name.tr(),
                              status: PopStatus.error));
                        }
                      }
                    },
                  ),
                  body: Container(
                    height: MediaQuery.of(context).size.height,
                    margin: const EdgeInsets.only(top: 16),
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(20)),
                      color: Theme.of(context).appBarTheme.backgroundColor,
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: WScaleAnimation(
                                  onTap: () {
                                    showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            useRootNavigator: true,
                                            builder: (context) =>
                                                const CameraBottomSheet())
                                        .then((value) {
                                      if (value != null) {
                                        widget.imageBloc
                                            .add(GetImage(source: value));
                                        setState(() {});
                                      }
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      BlocBuilder<ImageBloc, ImageState>(
                                        builder: (context, stateImage) =>
                                            stateImage.image.path.isEmpty
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    child: CachedNetworkImage(
                                                        imageUrl: stateProfile
                                                                .profileEntity
                                                                .image ??
                                                            '',
                                                        width: 90,
                                                        height: 90,
                                                        fit: BoxFit.cover,
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            SizedBox(
                                                                width: 90,
                                                                height: 90,
                                                                child:
                                                                    ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                50),
                                                                        child: Image
                                                                            .asset(
                                                                          AppImages
                                                                              .defaultPhoto,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        )))),
                                                  )
                                                : SizedBox(
                                                    height: 90,
                                                    width: 90,
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(90),
                                                        child: Image.file(
                                                            stateImage.image,
                                                            fit: BoxFit.cover)),
                                                  ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(LocaleKeys.change_photo.tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(color: blue)),
                                    ],
                                  )),
                            ),
                            //
                            TitleTextFieldTop(
                              title: LocaleKeys.full_name.tr(),
                              isRequired: true,
                            ),
                            ProfilTextField(
                                hintText: _nameCont.text.isEmpty
                                    ? _nameCont.text
                                    : LocaleKeys.enter_fullname.tr(),
                                onChanged: (value) {
                                  setState(() {});
                                },
                                controller: _nameCont,
                                isNameField: true),
                            //
                            TitleTextFieldTop(title: LocaleKeys.region.tr()),
                            WScaleAnimation(
                                onTap: () async {
                                  await showModalBottomSheet<List<Region>>(
                                      isDismissible: false,
                                      context: context,
                                      useRootNavigator: true,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (c) =>
                                          RentChooseRegionBottomSheet(
                                              isMultiChoice: false,
                                              list: context
                                                  .read<RegionsBloc>()
                                                  .state
                                                  .regions)).then((value) {
                                    if (value != null && value.isNotEmpty) {
                                      setState(() {
                                        newRegion = value.first;
                                      });
                                    }
                                  });
                                },
                                child: EditItemContainer(
                                    icon: AppIcons.chevronDown,
                                    region: newRegion?.title ??
                                        context
                                            .read<ProfileBloc>()
                                            .state
                                            .profileEntity
                                            .region
                                            ?.title ??
                                        '')),
                            //
                            TitleTextFieldTop(
                                title: LocaleKeys.tel_number.tr()),
                            WScaleAnimation(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(fade(
                                          page: const PhoneNumberEditPage()));
                                },
                                child: PhoneContainer(
                                    phoneNumber: stateProfile
                                            .profileEntity.phoneNumber ??
                                        '')),
                            //
                            TitleTextFieldTop(title: LocaleKeys.email.tr()),
                            ProfilTextField(
                                hintText:
                                    // _emailCont.text.isEmpty
                                    //     ?
                                    _emailCont.text
                                // : LocaleKeys.enter_email.tr()
                                ,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                controller: _emailCont,
                                isNameField: true),
                            // EditItemContainer(
                            //     icon: AppIcons.lock,
                            //     region:
                            //         stateProfile.profileEntity.email ?? ''),
                            const SizedBox(height: 32)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return Center(
            child: Text(LocaleKeys.service_error.tr()),
          );
        },
      ),
    );
  }
}

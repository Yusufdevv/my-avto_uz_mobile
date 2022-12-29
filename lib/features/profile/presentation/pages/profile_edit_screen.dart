import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/ad/presentation/bloc/add_photo/image_bloc.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/widgets/cached_image.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/pages/phone_number_edit_page.dart';
import 'package:auto/features/profile/presentation/widgets/camera_bottom_sheet.dart';
import 'package:auto/features/profile/presentation/widgets/edit_item_container.dart';
import 'package:auto/features/profile/presentation/widgets/phone_container.dart';
import 'package:auto/features/profile/presentation/widgets/profil_textfield.dart';
import 'package:auto/features/profile/presentation/widgets/title_text_field_top.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/rent_choose_region_bottom_sheet.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ProfileEditScreen extends StatefulWidget {
  final ProfileBloc profileBloc;
  final ImageBloc imageBloc;

  const ProfileEditScreen({
    required this.profileBloc,
    required this.imageBloc,
    Key? key,
  }) : super(key: key);

  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  late TextEditingController nameController;
  late TextEditingController surNameController;
  Region? newRegion;

  @override
  void initState() {
    nameController = TextEditingController(
        text: widget.profileBloc.state.profileEntity.firstName);
    surNameController = TextEditingController(
        text: widget.profileBloc.state.profileEntity.lastName);
    context.read<RegionsBloc>().add(RegionsEvent.getRegions());
    // print(StorageRepository.getString('token'));
    widget.imageBloc
        .add(DeleteImage(imageUrl: widget.imageBloc.state.image.path));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.profileBloc),
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
              child: Scaffold(
                appBar: WAppBar(
                  textWithButton: LocaleKeys.my_profile.tr(),
                ),
                bottomNavigationBar: WButton(
                  isLoading: stateProfile.editStatus.isSubmissionInProgress,
                  margin: EdgeInsets.fromLTRB(
                      SizeConfig.h(16),
                      SizeConfig.v(0),
                      SizeConfig.h(16),
                      SizeConfig.v(8) + mediaQuery.padding.bottom),
                  text: 'Подтвердить',
                  onTap: () {
                    context.read<ProfileBloc>().add(
                          EditProfileEvent(
                            name: nameController.text,
                            surName: surNameController.text,
                            image: widget.imageBloc.state.image.path.isNotEmpty
                                ? widget.imageBloc.state.image.path
                                : null,
                            region: newRegion?.id,
                            onSuccess: () {
                              widget.profileBloc.add(GetProfileEvent());
            
                              Navigator.pop(context);
                              context.read<ShowPopUpBloc>().add(ShowPopUp(
                                  message:
                                      "Malumotlar mufavvaqiyatli o'zgartirildi",
                                  isSucces: true));
                            },
                            onError: (text) {
                              context.read<ShowPopUpBloc>().add(
                                  ShowPopUp(message: text, isSucces: false));
                            },
                          ),
                        );
                  },
                ),
                body: KeyboardDismisser(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    margin: EdgeInsets.only(top: SizeConfig.v(16)),
                    padding: EdgeInsets.only(
                      left: SizeConfig.h(16),
                      right: SizeConfig.h(16),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(SizeConfig.h(20))),
                      color: Theme.of(context).appBarTheme.backgroundColor,
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.only(top: SizeConfig.v(24)),
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
                                        builder: (context) => CameraBottomSheet(
                                            imageBloc: widget.imageBloc));
                                  },
                                  child: Column(
                                    children: [
                                      BlocBuilder<ImageBloc, ImageState>(
                                        builder: (context, stateImage) =>
                                            stateImage.image.path.isEmpty
                                                ? CachedImage(
                                                    height: SizeConfig.v(80),
                                                    width: SizeConfig.h(80),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            SizeConfig.h(40)),
                                                    fit: BoxFit.cover,
                                                    imageUrl: stateProfile
                                                            .profileEntity
                                                            .image ??
                                                        '',
                                                  )
                                                : SizedBox(
                                                    height: SizeConfig.v(80),
                                                    width: SizeConfig.h(80),
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    SizeConfig
                                                                        .h(40)),
                                                        child: Image.file(
                                                            stateImage.image,
                                                            fit: BoxFit.cover)),
                                                  ),
                                      ),
                                      SizedBox(height: SizeConfig.h(8)),
                                      Text(
                                        LocaleKeys.change_photo.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2!
                                            .copyWith(color: blue),
                                      ),
                                    ],
                                  )),
                            ),
                            //
                            TitleTextFieldTop(
                              title: LocaleKeys.name.tr(),
                            ),
                            ProfilTextField(controller: nameController),
                            //
                            TitleTextFieldTop(
                              title: LocaleKeys.surname.tr(),
                            ),
                            ProfilTextField(controller: surNameController),
                            //
                            TitleTextFieldTop(
                              title: LocaleKeys.region.tr(),
                            ),
                            WScaleAnimation(
                              onTap: () async {
                                await showModalBottomSheet<List<Region>>(
                                  isDismissible: false,
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (c) => RentChooseRegionBottomSheet(
                                      isProfileEdit: true,
                                      list: context
                                          .read<RegionsBloc>()
                                          .state
                                          .regions),
                                ).then((value) {
                                  if (value != null && value.isNotEmpty) {
                                    setState(() {
                                      newRegion = value.first;
                                    });
                                  }
                                });
                              },
                              child: EditItemContainer(
                                  icon: AppIcons.chevronRightBlack,
                                  region: newRegion?.title ??
                                      widget.profileBloc.state.profileEntity
                                          .region?.title ??
                                      ''),
                            ),
                            //
                            const TitleTextFieldTop(title: 'Номер телефона'),
                            WScaleAnimation(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      fade(
                                          page: PhoneNumberEditPage(
                                              profileBloc:
                                                  widget.profileBloc)));
                                },
                                child: PhoneContainer(
                                    phoneNumber: stateProfile
                                            .profileEntity.phoneNumber ??
                                        '')),
                            //
                            const TitleTextFieldTop(title: 'Email'),
                            EditItemContainer(
                                icon: AppIcons.lock,
                                region: stateProfile.profileEntity.email ?? ''),
                            SizedBox(height: SizeConfig.v(32))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return const Center(
            child: Text('Something went wrong'),
          );
        },
      ),
    );
  }
}

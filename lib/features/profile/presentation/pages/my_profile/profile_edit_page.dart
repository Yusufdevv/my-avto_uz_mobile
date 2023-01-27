import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/core/utils/size_config.dart';
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
  late TextEditingController _fullNameController;
  Region? newRegion;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    _fullNameController = TextEditingController(
        text: context.read<ProfileBloc>().state.profileEntity.fullName);

    if (context.read<RegionsBloc>().state.regions.isEmpty) {
      context.read<RegionsBloc>().add(RegionsEvent.getRegions());
    }
    widget.imageBloc
        .add(DeleteImage(imageUrl: widget.imageBloc.state.image.path));
    super.initState();
  }

  bool isChanged({required String oldname, required String oldsurname}) {
    final result = (oldname != _fullNameController) ||
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
              child: Scaffold(
                appBar: WAppBar(
                  textWithButton: LocaleKeys.my_profile.tr(),
                ),
                bottomNavigationBar: WButton(
                  color: isChanged(
                          oldname: stateProfile.profileEntity.firstName ?? '',
                          oldsurname: stateProfile.profileEntity.lastName ?? '')
                      ? orange
                      : grey,
                  isLoading: stateProfile.editStatus.isSubmissionInProgress,
                  margin: EdgeInsets.fromLTRB(
                      SizeConfig.h(16),
                      SizeConfig.v(0),
                      SizeConfig.h(16),
                      SizeConfig.v(8) + mediaQuery.padding.bottom),
                  text: 'Сохранить',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<ProfileBloc>().add(
                            EditProfileEvent(
                              fullName: _fullNameController.text,
                              image:
                                  widget.imageBloc.state.image.path.isNotEmpty
                                      ? widget.imageBloc.state.image.path
                                      : null,
                              region: newRegion?.id,
                              onSuccess: () {
                                context
                                    .read<ProfileBloc>()
                                    .add(GetProfileEvent());
                                Navigator.pop(context);
                                context.read<ShowPopUpBloc>().add(ShowPopUp(
                                    message:
                                        "Malumotlar mufavvaqiyatli o'zgartirildi",
                                    isSucces: true));
                              },
                              onError: (text) {
                                var error = text;
                                if (error.toLowerCase().contains('dioerror')) {
                                  error =
                                      StorageRepository.getString('language') ==
                                              'uz'
                                          ? 'Tarmoqda uzilish yuzaga keldi'
                                          : 'Произошел сбой сети';
                                }
                                context.read<ShowPopUpBloc>().add(
                                    ShowPopUp(message: error, isSucces: false));
                              },
                            ),
                          );
                    }
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
                        child: Form(
                          key: _formKey,
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
                                              CameraBottomSheet(
                                                  imageBloc: widget.imageBloc));
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
                                                          width:
                                                              SizeConfig.h(80),
                                                          height:
                                                              SizeConfig.v(80),
                                                          fit: BoxFit.cover,
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              SizedBox(
                                                                  width:
                                                                      SizeConfig
                                                                          .h(
                                                                              80),
                                                                  height:
                                                                      SizeConfig
                                                                          .v(80),
                                                                  child: ClipRRect(
                                                                      borderRadius: BorderRadius.circular(50),
                                                                      child: Image.asset(
                                                                        AppImages
                                                                            .defaultPhoto,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      )))),
                                                    )
                                                  : SizedBox(
                                                      height: SizeConfig.v(80),
                                                      width: SizeConfig.h(80),
                                                      child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      SizeConfig.h(
                                                                          50)),
                                                          child: Image.file(
                                                              stateImage.image,
                                                              fit: BoxFit
                                                                  .cover)),
                                                    ),
                                        ),
                                        SizedBox(height: SizeConfig.h(8)),
                                        Text(LocaleKeys.change_photo.tr(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2!
                                                .copyWith(color: blue)),
                                      ],
                                    )),
                              ),
                              //
                              const TitleTextFieldTop(title: 'ФИО'),
                              ProfilTextField(
                                  controller: _fullNameController,
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
                                      icon: AppIcons.chevronRightBlack,
                                      region: newRegion?.title ??
                                          context
                                              .read<ProfileBloc>()
                                              .state
                                              .profileEntity
                                              .region
                                              ?.title ??
                                          '')),
                              //
                              const TitleTextFieldTop(title: 'Номер телефона'),
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
                              const TitleTextFieldTop(title: 'Email'),
                              EditItemContainer(
                                  icon: AppIcons.lock,
                                  region:
                                      stateProfile.profileEntity.email ?? ''),
                              SizedBox(height: SizeConfig.v(32))
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
          return const Center(
            child: Text('Something went wrong'),
          );
        },
      ),
    );
  }
}

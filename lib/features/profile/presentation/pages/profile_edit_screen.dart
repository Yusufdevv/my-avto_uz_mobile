import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/features/common/widgets/cached_image.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/posting_ad/add_photo/presentation/blocs/image_bloc.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/widgets/camera_bottom_sheet.dart';
import 'package:auto/features/profile/presentation/widgets/language_bottom_sheet.dart';
import 'package:auto/features/profile/presentation/widgets/title_text_field_top.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class EditProfileScreen extends StatefulWidget {
  final ProfileBloc profileBloc;
  final ImageBloc imageBloc;

  const EditProfileScreen({
    required this.profileBloc,
    required this.imageBloc,
    Key? key,
  }) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController surNameController;

  @override
  initState() {
    nameController = TextEditingController(text: widget.profileBloc.state.profileEntity.firstName);
    surNameController =
        TextEditingController(text: widget.profileBloc.state.profileEntity.lastName);
    super.initState();
  }

  @override
  dispose() {
    nameController.dispose();
    surNameController.dispose();
    super.dispose();
  }

  void showError(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    print(nameController.text);
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.profileBloc),
        BlocProvider.value(value: widget.imageBloc),
      ],
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) => Scaffold(
          appBar: WAppBar(
            textWithButton: LocaleKeys.my_profile.tr(),
          ),
          bottomNavigationBar: WButton(
            isLoading: state.editStatus.isSubmissionInProgress,
            margin: EdgeInsets.fromLTRB(16, 0, 16, 8 + mediaQuery.padding.bottom),
            text: 'Подтвердить',
            onTap: () {
              context.read<ProfileBloc>().add(
                    EditProfileEvent(
                      name: nameController.text,
                      surName: surNameController.text,
                      image: widget.imageBloc.state.image.path.isNotEmpty
                          ? widget.imageBloc.state.image.path
                          : null,
                      onSuccess: () {
                        print('success');
                        Navigator.of(context).pop();
                      },
                      onError: (text) {
                        print('error' + text);
                      },
                    ),
                  );
            },
          ),
          body: KeyboardDismisser(
            child: Container(
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                color: Theme.of(context).appBarTheme.backgroundColor,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
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
                                    CameraBottomSheet(imageBloc: widget.imageBloc));
                          },
                          child: Column(
                            children: [
                              BlocBuilder<ImageBloc, ImageState>(
                                builder: (context, state) {
                                  print(state.images.isEmpty);
                                  return state.image.path.isEmpty
                                      ? CachedImage(
                                          height: 80,
                                          width: 80,
                                          borderRadius: BorderRadius.circular(40),
                                          fit: BoxFit.cover,
                                          imageUrl: widget.profileBloc.state.profileEntity.image,
                                        )
                                      : Container(
                                          height: 80,
                                          width: 80,
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(40),
                                              child: Image.file(state.image, fit: BoxFit.cover)),
                                        );
                                },
                              ),
                              const SizedBox(height: 8),
                              Text(
                                LocaleKeys.change_photo.tr(),
                                style: Theme.of(context).textTheme.headline2!.copyWith(color: blue),
                              ),
                            ],
                          )),
                    ),
                    TitleTextFieldTop(
                      title: LocaleKeys.name.tr(),
                    ),
                    WTextField(
                      focusColor: Theme.of(context).appBarTheme.backgroundColor,
                      borderColor: purple,
                      cursorColor: purple,
                      disabledColor: Theme.of(context).appBarTheme.backgroundColor,
                      textStyle: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                      borderRadius: 12,
                      hintText: '',
                      hintTextStyle: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
                      onChanged: (tmp) {},
                      controller: nameController,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      fillColor: Theme.of(context).appBarTheme.backgroundColor,
                    ),
                    TitleTextFieldTop(
                      title: LocaleKeys.surname.tr(),
                    ),
                    WTextField(
                      focusColor: Theme.of(context).appBarTheme.backgroundColor,
                      borderColor: purple,
                      cursorColor: purple,
                      textStyle: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                      disabledColor: Theme.of(context).appBarTheme.backgroundColor,
                      borderRadius: 12,
                      hintText: '',
                      hintTextStyle: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
                      onChanged: (tmp) {},
                      controller: surNameController,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      fillColor: Theme.of(context).appBarTheme.backgroundColor,
                    ),
                    TitleTextFieldTop(
                      title: LocaleKeys.region.tr(),
                    ),
                    WScaleAnimation(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            useRootNavigator: true,
                            backgroundColor: Colors.transparent,
                            constraints: BoxConstraints(
                                maxHeight: MediaQuery.of(context).size.height * 0.36,
                                minWidth: MediaQuery.of(context).size.width),
                            builder: (context) => const LanguageBottomSheet());
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12, right: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).appBarTheme.backgroundColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Theme.of(context).extension<WTextFieldStyle>()!.borderColor),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'г. Ташкент',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(fontSize: 15, fontWeight: FontWeight.w600),
                                ),
                                const Spacer(),
                                SvgPicture.asset(
                                  AppIcons.chevronRightBlack,
                                  color:
                                      Theme.of(context).extension<ThemedColors>()!.darkGreyToWhite,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const TitleTextFieldTop(title: 'Email'),
                    WTextField(
                      focusColor: Theme.of(context).appBarTheme.backgroundColor,
                      borderColor: purple,
                      cursorColor: purple,
                      textStyle: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                      disabledColor: Theme.of(context).appBarTheme.backgroundColor,
                      suffix: SvgPicture.asset(AppIcons.lock),
                      borderRadius: 12,
                      hintText: 'boss@auto.uz',
                      hintTextStyle: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
                      onChanged: (tmp) {},
                      controller: TextEditingController(),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      fillColor: Theme.of(context).appBarTheme.backgroundColor,
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
}

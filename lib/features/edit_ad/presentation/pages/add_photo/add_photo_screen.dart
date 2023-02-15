import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/edit_ad/presentation/bloc/add_photo/image_bloc.dart';
import 'package:auto/features/edit_ad/presentation/bloc/posting_ad/edit_ad_bloc.dart';
import 'package:auto/features/edit_ad/presentation/pages/add_photo/widgets/add_photo_instructions_screen.dart';
import 'package:auto/features/edit_ad/presentation/pages/add_photo/widgets/photo_item.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/widgets/widgets.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoScreen extends StatefulWidget {
  const AddPhotoScreen({Key? key}) : super(key: key);

  @override
  State<AddPhotoScreen> createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
  late ImageBloc imageBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<EditAdBloc, EditAdState>(
          builder: (context, state) {
            if (state.getAnnouncementToEditStatus ==
                FormzStatus.submissionInProgress) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CupertinoActivityIndicator(),
                    const SizedBox(height: 12),
                    Text(
                      LocaleKeys.loading_data.tr(),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                    )
                  ],
                ),
              );
            }
            return BlocProvider(
              create: (c) {
                imageBloc = ImageBloc(
                    images: state.gallery, panaramas: state.panaramaGallery);
                return imageBloc;
              },
              child: Scaffold(
                body: BaseWidget(
                  headerText: LocaleKeys.photo.tr(),
                  extraAction: [
                    const SizedBox(width: 12),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).push(
                                fade(page: const PhotoInstructionsScreen()));
                          },
                          behavior: HitTestBehavior.opaque,
                          child: SvgPicture.asset(AppIcons.infoCircle,
                              height: 24)),
                    ),
                    const Spacer()
                  ],
                  child: BlocConsumer<ImageBloc, ImageState>(
                    listener: (context, state) {
                      if (state.toastMessage != null &&
                          state.toastMessage!.isNotEmpty) {
                        context.read<EditAdBloc>().add(
                              EditAdShowToastEvent(
                                message: state.toastMessage!,
                                status: PopStatus.warning,
                              ),
                            );
                        imageBloc.add(PickImageEmptyToastMessageEvent());
                      }
                      context
                          .read<EditAdBloc>()
                          .add(EditAdChooseEvent(gallery: state.images));
                      context.read<EditAdBloc>().add(EditAdChooseEvent(
                          panaramaGallery: state.panaramaImages));
                    },
                    builder: (context, state) => SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PhotoItem(
                            images: state.images,
                            onTap: () async {
                              await showModalBottomSheet<ImageSource>(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  useRootNavigator: true,
                                  builder: (context) =>
                                      const CameraBottomSheet()).then((value) {
                                if (value != null) {
                                  imageBloc.add(PickImage(source: value));
                                }
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              '${LocaleKeys.photo.tr()} 360°',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: grey),
                            ),
                          ),
                          PhotoItem(
                            images: state.panaramaImages,
                            onTap: () async {
                              imageBloc.add(PickPanaramaImageEvent());
                            },
                          ),
                          const SizedBox(height: 64)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
}

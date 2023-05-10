import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/presentation/bloc/add_photo/image_bloc.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/add_photo_instructions_screen.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/photo_item.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/widgets/widgets.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

typedef PAShowToast = Function(String message, PopStatus status);
typedef PAOnImagesChanged = Function(
    List<String> gallery, List<String> panoramas);

class AddPhotoScreen extends StatefulWidget {
  final bool? isWaiting;
  final List<String> panoramas;
  final List<String> gallery;
  final PAShowToast onShowToast;
  final PAOnImagesChanged onImagesChanged;

  const AddPhotoScreen(
      {required this.onShowToast,
      required this.onImagesChanged,
      required this.gallery,
      required this.panoramas,
      this.isWaiting,
      Key? key})
      : super(key: key);

  @override
  State<AddPhotoScreen> createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
  late ImageBloc imageBloc;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Builder(builder: (context) {
          if (widget.isWaiting ?? false) {
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
                images: widget.gallery,
                panoramas: widget.panoramas,
              );
              return imageBloc;
            },
            child: Scaffold(
              body: BaseWidget(
                headerText: LocaleKeys.photo.tr(),
                extraAction: [
                  const SizedBox(width: 8),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(fade(page: const PhotoInstructionsScreen()));
                      },
                      behavior: HitTestBehavior.opaque,
                      child: SvgPicture.asset(AppIcons.infoCircle, height: 24)),
                ],
                child: BlocConsumer<ImageBloc, ImageState>(
                  listener: (context, state) {
                    if (state.toastMessage != null &&
                        state.toastMessage!.isNotEmpty) {
                      widget.onShowToast(
                          state.toastMessage!, PopStatus.warning);

                      imageBloc.add(PickImageEmptyToastMessageEvent());
                    }
                    widget.onImagesChanged(state.images, state.panaramaImages);
                  },
                  builder: (context, state) => SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PhotoItem(
                          images: state.images,
                          onTap: state.images.length < 30
                              ? () async {
                                  await showModalBottomSheet<ImageSource>(
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          useRootNavigator: true,
                                          builder: (context) =>
                                              const CameraBottomSheet())
                                      .then((value) {
                                    if (value != null) {
                                      imageBloc.add(PickImage(source: value));
                                    }
                                  });
                                }
                              : () {
                                  widget.onShowToast(
                                      "30 tadan ortiq rasm qo'ya olmaysiz",
                                      PopStatus.warning);
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
                          onTap: state.panaramaImages.length < 20
                              ? () async {
                                  imageBloc.add(PickPanaramaImageEvent());
                                }
                              : () {
                                  widget.onShowToast(
                                      "20 tadan ortiq rasm qo'ya olmaysiz",
                                      PopStatus.warning);
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
        }),
      );
}

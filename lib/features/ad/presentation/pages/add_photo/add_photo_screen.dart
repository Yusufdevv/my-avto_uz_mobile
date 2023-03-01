import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/presentation/bloc/add_photo/image_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/add_photo_instructions_screen.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/photo_item.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/widgets/widgets.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        body: BlocBuilder<PostingAdBloc, PostingAdState>(
          builder: (context, state) => BlocProvider(
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
                      context.read<PostingAdBloc>().add(
                            PostingAdShowToastEvent(
                              message: state.toastMessage!,
                              status: PopStatus.warning,
                            ),
                          );
                      imageBloc.add(PickImageEmptyToastMessageEvent());
                    }
                    context
                        .read<PostingAdBloc>()
                        .add(PostingAdChooseEvent(gallery: state.images));
                    context.read<PostingAdBloc>().add(PostingAdChooseEvent(
                        panaramaGallery: state.panaramaImages));
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
                                  context.read<PostingAdBloc>().add(
                                        PostingAdShowToastEvent(
                                          message:
                                              "30 tadan ortiq rasm qo'ya olmaysiz",
                                          status: PopStatus.warning,
                                        ),
                                      );
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
                                  context.read<PostingAdBloc>().add(
                                        PostingAdShowToastEvent(
                                          message:
                                              "20 tadan ortiq rasm qo'ya olmaysiz",
                                          status: PopStatus.warning,
                                        ),
                                      );
                                },
                        ),
                        const SizedBox(height: 64)
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

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/presentation/bloc/add_photo/image_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/add_photo_instructions_screen.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/photo_item.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/widgets/widgets.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoScreen extends StatefulWidget {
  final Function(List<String>) onImageChanged;
  final Function(List<String>) onPanaramaChanged;

  const AddPhotoScreen(
      {required this.onImageChanged, required this.onPanaramaChanged, Key? key})
      : super(key: key);

  @override
  State<AddPhotoScreen> createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
  late ImageBloc imageBloc;

  @override
  void initState() {
    imageBloc = ImageBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: imageBloc,
        child: Scaffold(
          body: BaseWidget(
            headerText: LocaleKeys.photo.tr(),
            extraAction: [
              const SizedBox(width: 12),
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(fade(page: const PhotoInstructionsScreen()));
                    },
                    behavior: HitTestBehavior.opaque,
                    child: SvgPicture.asset(AppIcons.infoCircle, height: 24)),
              ),
              const Spacer()
            ],
            child: BlocBuilder<PostingAdBloc, PostingAdState>(
              builder: (context, postingAdState) =>
                  BlocConsumer<ImageBloc, ImageState>(
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
                  widget.onImageChanged(state.images);
                  widget.onPanaramaChanged(state.panaramaImages);
                },
                builder: (context, snapshot) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PhotoItem(
                      images: postingAdState.gallery,
                      onTap: () async {
                        await showModalBottomSheet<ImageSource>(
                                backgroundColor: Colors.transparent,
                                context: context,
                                useRootNavigator: true,
                                builder: (context) =>
                                    CameraBottomSheet(imageBloc: imageBloc))
                            .then((value) {
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
                            .subtitle1!
                            .copyWith(color: grey),
                      ),
                    ),
                    PhotoItem(
                      images: postingAdState.panaramaGallery,
                      onTap: () async {
                        imageBloc.add(PickPanaramaImageEvent());
                      },
                    ),
                    // WButton(
                    //     text: 'print',
                    //     onTap: () {
                    //       String str = '9823452374';
                    //
                    //       print(
                    //           '=====> ${MyFunctions.getThousandsSeperatedPrice('1241234523425')}');
                    //     }),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

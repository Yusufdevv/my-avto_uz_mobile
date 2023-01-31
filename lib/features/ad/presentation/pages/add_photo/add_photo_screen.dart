import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/presentation/bloc/add_photo/image_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/add_photo_instructions_screen.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/photo_item.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
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
            headerText: 'Фото',
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
              builder: (context, postingAdState) {
                print(
                    '=> => => =>     state images lenth: ${postingAdState.gallery.length}    <= <= <= <=');
                return BlocConsumer<ImageBloc, ImageState>(
                  listener: (context, state) {
                    widget.onImageChanged(state.images);
                    widget.onPanaramaChanged(state.panaramaImages);
                  },
                  builder: (context, snapshot) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PhotoItem(
                        images: postingAdState.gallery,
                        onTap: () async {
                          imageBloc
                              .add(const PickImage(source: ImageSource.camera));
                        },
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Фото 360°',
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
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      );
}

import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/widgets/photo_item.dart';
import 'package:auto/features/car_single/presentation/parts/image_item_widget.dart';
import 'package:auto/features/car_single/presentation/parts/sts_image_item_widget.dart';
import 'package:auto/features/car_single/presentation/widgets/invoice_termsofsuse.dart';
import 'package:auto/features/common/bloc/image/image_bloc.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/profile/presentation/widgets/camera_bottom_sheet.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class VerifiredOwnerPage extends StatefulWidget {
  const VerifiredOwnerPage({Key? key}) : super(key: key);

  @override
  State<VerifiredOwnerPage> createState() => _VerifiredOwnerPageState();
}

class _VerifiredOwnerPageState extends State<VerifiredOwnerPage> {
  late ImageBloc imageBloc;

  @override
  void initState() {
    imageBloc = ImageBloc(ImagePicker());
    super.initState();
  }

  @override
  void dispose() {
    imageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: imageBloc,
        child: Scaffold(
          backgroundColor: white,
          appBar: const WAppBar(
            title: 'Проверенный собственник',
          ),
          body: BlocConsumer<ImageBloc, ImageState>(
            listener: (context, state) {},
            builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'CTC',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: grey),
                  ),
                ),
                StsImageItemWidget(
                  images: state.images,
                  onTap: () async {
                    await showModalBottomSheet<ImageSource>(
                            backgroundColor: Colors.transparent,
                            context: context,
                            useRootNavigator: true,
                            builder: (context) => const CameraBottomSheet())
                        .then((value) {
                      if (value != null) {
                        context
                            .read<ImageBloc>()
                            .add(PickSTSImageEvent(source: value));
                      }
                    });
                  },

                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Водительское удостоверение',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 16),
                  child: ImageItemWidget(
                      image: state.secondImage,
                      onTap: () async {
                        await showModalBottomSheet<ImageSource>(
                            backgroundColor: Colors.transparent,
                            context: context,
                            useRootNavigator: true,
                            builder: (context) =>
                                const CameraBottomSheet()).then((value) {
                          if (value != null) {
                            context.read<ImageBloc>().add(
                                PickDriverLicenceImageEvent(source: value));
                          }
                        });
                      },
                      onTapDelete: () {
                        imageBloc.add(DeleteImageEvent(
                            imageUrl: state.secondImage));
                      }),
                ),
                const SizedBox(height: 4),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const InvoiceTermsOfUse(),
                      const SizedBox(height: 16),
                      WButton(
                        // isLoading: state.payStatus.isSubmissionInProgress,
                        isDisabled: state.images.length <2 || state.secondImage.isEmpty,
                        disabledColor: disabledButton,
                        text: LocaleKeys.confirm.tr(),
                        color: orange,
                        onTap: () {},
                      ),
                      SizedBox(
                        height:MediaQuery.of(context).padding.bottom,
                      )
                    ],
                  ),
                ),
              ],
            ),
            // ),
          ),
        ),
      );
}

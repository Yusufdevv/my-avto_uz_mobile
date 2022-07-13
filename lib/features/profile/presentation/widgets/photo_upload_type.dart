// import 'package:auto/assets/colors/color.dart';
// import 'package:auto/assets/constants/icons.dart';
// import 'package:auto/features/common/widgets/w_scale.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:image_picker/image_picker.dart';
//
// class PhotoUploadType extends StatelessWidget {
//   final ValueChanged<ImageSource> imageType;
//   const PhotoUploadType({required this.imageType});
//
//   @override
//   Widget build(BuildContext context) => ListView(
//         shrinkWrap: true,
//         physics: const BouncingScrollPhysics(),
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Прикрепить файл',
//                     style: Theme.of(context).textTheme.headline1),
//                 const SizedBox(height: 20),
//                 const Divider(height: 2),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 16),
//                     _ItemSelect(
//                       camera: AppIcons.camera,
//                         text: 'Камера',
//                         imageType: ImageSource.gallery,
//                         onTapImageType: (_imageType) {
//                           imageType(_imageType);
//                           Navigator.pop(context);
//                         }),
//                     const SizedBox(height: 8),
//                     _ItemSelect(
//                       camera: AppIcons.photo,
//                       text: 'Выбрать фото',
//                       imageType: ImageSource.camera,
//                       onTapImageType: (_imageType) {
//                         imageType(_imageType);
//                         Navigator.pop(context);
//                       },
//                     ),
//                     const SizedBox(height: 16),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
// }
//
//

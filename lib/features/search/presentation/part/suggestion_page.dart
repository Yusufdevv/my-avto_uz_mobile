// import 'package:auto/assets/constants/images.dart';
// import 'package:auto/features/search/domain/entities/search_item_entity.dart';
// import 'package:auto/features/search/presentation/widgets/searched_models_item.dart';
// import 'package:flutter/material.dart';

// class SuggestionPage extends StatelessWidget {
//   final TextEditingController controller;
//   SuggestionPage({required this.controller, Key? key}) : super(key: key);

//   final List<SearchItemEntity> searchItemEntity = [
//     const SearchItemEntity(title: 'BMW Xdrive', icon: AppImages.bmwModel),
//     const SearchItemEntity(title: 'BMW X5 sport', icon: AppImages.bmwModel),
//     const SearchItemEntity(
//         title: 'BMW X6 Competition', icon: AppImages.bmwModel),
//     const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
//     const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
//     const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
//     const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
//     const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
//     const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
//     const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
//     const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
//     const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
//     const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
//     const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
//     const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
//     const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
//     const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
//     const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
//     const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
//     const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
//     const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
//     const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
//     const SearchItemEntity(title: 'BMW X 7', icon: AppImages.bmwModel),
//   ];

//   @override
//   Widget build(BuildContext context) => ListView(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         children: [
//           ...List.generate(
//             searchItemEntity.length,
//             (index) => SearchedModelsItem(
//               controller: controller,
//               searchItemEntity: searchItemEntity[index],
//             ),
//           )
//         ],
//       );
// }

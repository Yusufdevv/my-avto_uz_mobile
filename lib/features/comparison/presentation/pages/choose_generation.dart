// import 'package:auto/assets/colors/color.dart';
// import 'package:auto/assets/constants/icons.dart';
// import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
// import 'package:auto/features/ad/domain/entities/choose_model/model_item_entity.dart';
// import 'package:auto/features/ad/presentation/pages/choose_model/widgets/model_items.dart';
// import 'package:auto/features/common/widgets/w_app_bar.dart';
// import 'package:auto/features/common/widgets/w_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:keyboard_dismisser/keyboard_dismisser.dart';

// class ChooseGenerationComparison extends StatefulWidget {
//   final VoidCallback onTap;
//   const ChooseGenerationComparison({
//     Key? key,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   State<ChooseGenerationComparison> createState() =>
//       _ChooseGenerationComparisonState();
// }

// class _ChooseGenerationComparisonState
//     extends State<ChooseGenerationComparison> {
//   final List<ModelItemEntity> modelItems = [
//     ModelItemEntity(title: 'm90'),
//   ];

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) => BlocProvider.value(
//         value: widget.modelBloc,
//         child: KeyboardDismisser(
//           child: Scaffold(
//             resizeToAvoidBottomInset: false,
//             extendBody: true,
//             appBar: WAppBar(
//               title: 'Модель автомобиля',
//               titleStyle: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: grey,
//               ),
//               centerTitle: false,
//               extraActions: [
//                 Padding(
//                   padding: const EdgeInsets.only(right: 16),
//                   child: InkWell(
//                     onTap: () {
//                       Navigator.of(context).pop();
//                       Navigator.of(context).pop();
//                       Navigator.of(context).pop();
//                     },
//                     child: SvgPicture.asset(AppIcons.close),
//                   ),
//                 ),
//               ],
//             ),
//             body: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.only(top: 20, left: 16, bottom: 12),
//                     child: Text(
//                       'Выберите поколение',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700,
//                         color: dark,
//                       ),
//                     ),
//                   ),
//                   Transform.translate(
//                     offset: const Offset(0, 1),
//                     child: Container(
//                       height: 2,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: Theme.of(context)
//                             .extension<ThemedColors>()!
//                             .whiteToDark,
//                         borderRadius: const BorderRadius.vertical(
//                           top: Radius.circular(20),
//                         ),
//                       ),
//                     ),
//                   ),
//                   ...List.generate(
//                     modelItems.length,
//                     (index) => Container(
//                       color: Theme.of(context)
//                           .extension<ThemedColors>()!
//                           .whiteToDark,
//                       child: BlocBuilder<ModelSelectorBloc, ModelSelectorState>(
//                         bloc: widget.modelBloc,
//                         builder: (context, state) => ModelItems(
//                           bloc: widget.modelBloc,
//                           entity: modelItems[index].title,
//                           selectedId: state.selectedId,
//                           id: index,
//                           text: '',
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             bottomNavigationBar: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: WButton(
//                 onTap: widget.onTap,
//                 text: 'Далее',
//                 shadow: [
//                   BoxShadow(
//                     offset: const Offset(0, 4),
//                     blurRadius: 20,
//                     color: orange.withOpacity(0.2),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
// }

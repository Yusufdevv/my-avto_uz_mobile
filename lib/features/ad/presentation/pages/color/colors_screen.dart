import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/color/widgets/colors_item.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ColorsScreen extends StatefulWidget {
  const ColorsScreen({Key? key}) : super(key: key);

  @override
  State<ColorsScreen> createState() => _ColorsScreenState();
}

class _ColorsScreenState extends State<ColorsScreen> {
  final List<Color> colorsList = [
    black,
    silver,
    white,
    complaintColor,
    yellow,
    neonCarrot
  ];
  final List<String> colorsNameList = [
    'Черный',
    'Серебристый',
    'Белый',
    'Бордовый',
    'Желтый',
    'Оранжевыйq',
  ];
  String currentId = '';

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BaseWidget(
          headerText: 'Цвет автомобиля',
          padding: const EdgeInsets.only(top: 16),
          child: BlocBuilder<PostingAdBloc, PostingAdState>(
            builder: (context, state) {
              if (state.status == FormzStatus.submissionInProgress) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }
              return GridView.builder(
                itemBuilder: (context, index) => ColorsItem(
                  color: colorsList[index],
                  colorName: colorsNameList[index],
                  onTap: (id) => context.read<PostingAdBloc>().add(
                      PostingAdChooseEvent(colorName: colorsNameList[index])),
                  id: index.toString(),
                  isSelected: state.colorName == colorsNameList[index],
                ),
                itemCount: 6,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.5),
              );
            },
          ),
        ),
      );
}

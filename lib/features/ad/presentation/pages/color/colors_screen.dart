import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/color/widgets/colors_item.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
    LocaleKeys.black.tr(),
    LocaleKeys.serebro.tr(),
    LocaleKeys.white.tr(),
    LocaleKeys.bordo.tr(),
    LocaleKeys.yellow.tr(),
    LocaleKeys.orange.tr(),
  ];
  String currentId = '';

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BaseWidget(
          headerText: LocaleKeys.car_color.tr(),
          padding: const EdgeInsets.only(top: 16),
          child: BlocBuilder<PostingAdBloc, PostingAdState>(
            builder: (context, state) {
              if (state.status == FormzStatus.submissionInProgress) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }
              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => ColorsItem(
                  color: colorsList[index],
                  colorName: colorsNameList[index],
                  onTap: () => context.read<PostingAdBloc>().add(
                      PostingAdChooseEvent(colorName: colorsNameList[index])),
                  isSelected: state.colorName == colorsNameList[index],
                ),
                itemCount: 6,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                ),
              );
            },
          ),
        ),
      );
}

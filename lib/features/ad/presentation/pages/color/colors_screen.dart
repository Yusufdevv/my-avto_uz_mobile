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
  String currentId = '';

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BaseWidget(
          isBgColorIsNull: true,
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
                padding: EdgeInsets.fromLTRB(
                    16, 0, 16, 100 + MediaQuery.of(context).padding.bottom),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final color = HexColor.fromHex(state.colors[index].hexCode);
                  return ColorsItem(
                    color: color,
                    colorName: state.colors[index].name,
                    onTap: () => context.read<PostingAdBloc>().add(
                        PostingAdChooseEvent(colorName: state.colors[index])),
                    isSelected: state.colorName?.id == state.colors[index].id,
                  );
                },
                itemCount: state.colors.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 106,
                  crossAxisCount: 2,
                  childAspectRatio: 1.7,
                ),
              );
            },
          ),
        ),
      );
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

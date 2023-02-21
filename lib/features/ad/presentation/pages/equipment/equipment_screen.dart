import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/pos_radio_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class EquipmentScreen extends StatefulWidget {
  const EquipmentScreen({Key? key}) : super(key: key);

  @override
  State<EquipmentScreen> createState() => _EquipmentScreenState();
}

class _EquipmentScreenState extends State<EquipmentScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: BaseWidget(
          headerText: LocaleKeys.complectation.tr(),
          padding: const EdgeInsets.only(top: 16),
          child: BlocBuilder<PostingAdBloc, PostingAdState>(
            builder: (context, state) {
              if (state.status == FormzStatus.submissionInProgress) {
                return const Center(child: CupertinoActivityIndicator());
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      LocaleKeys.buyers_more_call_on_add.tr(),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 14,
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .aluminumToDolphin),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => PostingRadioItem(
                      onTap: () => context.read<PostingAdBloc>().add(
                          PostingAdChooseEvent(
                              equipmentId: state.equipments[index].id)),
                      title: state.equipments[index].name,
                      selected: state.equipmentId == state.equipments[index].id,
                      image: '',
                    ),
                    itemCount: state.equipments.length,
                    shrinkWrap: true,
                  )
                ],
              );
            },
          ),
        ),
      );
}

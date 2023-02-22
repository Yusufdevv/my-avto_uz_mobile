import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/equipment_category.dart';
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
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state.equipments.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          LocaleKeys.buyers_more_call_on_add.tr(),
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 14,
                                    color: Theme.of(context)
                                        .extension<ThemedColors>()!
                                        .aluminumToDolphin,
                                  ),
                        ),
                      ),
                    if (state.equipments.isNotEmpty) const SizedBox(height: 16),
                    if (state.equipments.isNotEmpty)
                      ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => PostingRadioItem(
                          onTap: () => context.read<PostingAdBloc>().add(
                              PostingAdChooseEvent(
                                  equipmentId: index < state.equipments.length
                                      ? state.equipments[index].id
                                      : -1)),
                          title: index < state.equipments.length
                              ? state.equipments[index].name
                              : LocaleKeys.other.tr(),
                          selected: index < state.equipments.length
                              ? state.equipmentId == state.equipments[index].id
                              : state.equipmentId == -1,
                          image: '',
                        ),
                        itemCount: state.equipments.length + 1,
                        shrinkWrap: true,
                      ),
                    if (state.equipments.isNotEmpty) const Divider(indent: 16),
                    if (state.equipments.isNotEmpty) const SizedBox(height: 12),
                    if (state.equipments.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
                        child: Text(
                          LocaleKeys.additional_options.tr(),
                          style: const TextStyle(
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => const EquipmentCategory(
                        categoryName: 'Безопасность',
                        list: [
                          'Система стабилизации (ESP)',
                          'Антиблокировочная система (ABS)',
                          'Блокировка замков задних дверей',
                        ],
                      ),
                      itemCount: 5,
                      shrinkWrap: true,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      );
}

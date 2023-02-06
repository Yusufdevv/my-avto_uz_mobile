import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/pts/date_picker_bloc.dart';
import 'package:auto/features/ad/presentation/pages/pts/widgets/pts_buttons.dart';
import 'package:auto/features/ad/presentation/pages/pts/widgets/show_cupertino_date_picker.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/common/widgets/w_container.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class PtsScreen extends StatefulWidget {
  const PtsScreen({Key? key}) : super(key: key);

  @override
  State<PtsScreen> createState() => _PtsScreenState();
}

class _PtsScreenState extends State<PtsScreen> {
  late DatePickerBloc bloc;

  final List<String> documentList = [
    LocaleKeys.original_slash_electronniy_pts.tr(),
    LocaleKeys.duplicate.tr(),
  ];

  final List<String> ownerList = [
    LocaleKeys.first.tr(),
    LocaleKeys.second.tr(),
    LocaleKeys.third.tr(),
    LocaleKeys.fourth_or_more.tr(),
  ];

  @override
  void initState() {
    bloc = DatePickerBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: BlocProvider.value(
          value: bloc,
          child: Scaffold(
            body: BaseWidget(
              headerText: LocaleKeys.pts.tr(),
              child: BlocBuilder<PostingAdBloc, PostingAdState>(
                builder: (context, state) => SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.document_type.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: greyText),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: List.generate(
                          documentList.length,
                          (index) => PtsButtons(
                            onTap: (id) => context.read<PostingAdBloc>().add(
                                PostingAdChooseEvent(
                                    typeDocument:
                                        LicenceType.values[index].name)),
                            id: index.toString(),
                            isSelected: state.licenceType ==
                                LicenceType.values[index].name,
                            text: documentList[index],
                          ),
                        ),
                      ),
                      const SizedBox(height: 41),
                      Text(
                        LocaleKeys.what_kind_owner.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: greyText),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: List.generate(
                          ownerList.length,
                          (index) => PtsButtons(
                            onTap: (id) => context.read<PostingAdBloc>().add(
                                PostingAdChooseEvent(
                                    ownerStep: Ownership.values[index].name)),
                            id: index.toString(),
                            isSelected:
                                state.ownerStep == Ownership.values[index].name,
                            text: ownerList[index],
                          ),
                        ),
                      ),
                      const SizedBox(height: 41),
                      Text(
                        LocaleKeys.when_car_was_buing.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: greyText),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      WContainer(
                        onTap: () {
                          showCupertinoDatePicker(
                            context,
                            (date) => context.read<PostingAdBloc>().add(
                                  PostingAdChooseEvent(
                                      purchasedDate: '$date'.substring(0, 10)),
                                ),
                          );
                        },
                        titleStyle: state.purchasedDate != null &&
                                state.purchasedDate!.isNotEmpty
                            ? Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 16)
                            : null,
                        title: state.purchasedDate != null &&
                                state.purchasedDate!.isNotEmpty
                            ? MyFunctions.getData(state.purchasedDate!)
                            : LocaleKeys.choose_date.tr(),
                        trailingIcon: AppIcons.calendar,
                        border: Border.all(
                            width: 1,
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .solitudeToDarkRider),
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

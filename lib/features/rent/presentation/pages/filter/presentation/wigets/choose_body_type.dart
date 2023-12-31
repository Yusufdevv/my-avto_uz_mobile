import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/rent/domain/usecases/get_body_types_usecase.dart';
import 'package:auto/features/rent/presentation/bloc/get_body_types/get_body_types_bloc.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/maker_sheet_item.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/sheet_header.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ChooseBodyType extends StatefulWidget {
  final int selectedId;

  const ChooseBodyType({required this.selectedId, super.key});

  @override
  State<ChooseBodyType> createState() => _ChooseBodyTypeState();
}

class _ChooseBodyTypeState extends State<ChooseBodyType> {
  late GetBodyTypesBloc getBodyTypesBloc;

  @override
  void initState() {
    getBodyTypesBloc = GetBodyTypesBloc(
      selectedId: widget.selectedId,
      getBodyTypeUseCase: GetBodyTypesUseCase(
        repository: serviceLocator<AdRepositoryImpl>(),
      ),
    )..add(GetBodyTypesGetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: getBodyTypesBloc,
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 44),
          decoration: BoxDecoration(
            color: Theme.of(context)
                .extension<ThemedColors>()!
                .scaffoldBackground,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: BlocBuilder<GetBodyTypesBloc, GetBodyTypesState>(
            builder: (context, state) {
              if (state.status == FormzStatus.submissionSuccess ||
                  state.status == FormzStatus.submissionFailure) {
                return Column(
                  children: [
                    SheetHeader(
                        title: LocaleKeys.body.tr(),
                        onCancelPressed: () {
                          Navigator.of(context).pop(state.selected >= 0
                              ? state.bodyTypes[state.selected]
                              : null);
                        }),
                     Divider(thickness: 1, color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .divider, height: 1),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            RentSheetItemm(
                              hasDivider: true,
                              onTap: () => getBodyTypesBloc
                                  .add(GetBodyTypesSelectIndex(-1)),
                              logo: '',
                              title: LocaleKeys.all.tr(),
                              isChecked: state.selected ==-1,
                            ),
                            ...List.generate(
                              state.bodyTypes.length,
                              (index) => RentSheetItemm(
                                hasDivider: state.bodyTypes.length - 1 != index,
                                onTap: () => getBodyTypesBloc
                                    .add(GetBodyTypesSelectIndex(index)),
                                logo: state.bodyTypes[index].logo,
                                title: state.bodyTypes[index].type,
                                isChecked: index == state.selected  ,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 40),
                      child: WButton(
                          onTap: () {
                            Navigator.of(context).pop(state.selected >= 0
                                ? state.bodyTypes[state.selected]
                                : null);
                          },
                          color: orange,
                          text: LocaleKeys.apply.tr()),
                    ),
                  ],
                );
              }
              if (state.status == FormzStatus.submissionInProgress) {
                return const Center(child: CupertinoActivityIndicator());
              }

              return const Center(
                child: Text('Error'),
              );
            },
          ),
        ),
      );
}

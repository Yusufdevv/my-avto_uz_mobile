import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/widgets/range_slider.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/rent/presentation/bloc/rent_bloc/rent_bloc.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_body_type.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_drive_type.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_gearbox.dart';
import 'package:auto/features/search/presentation/widgets/selector_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterParameters extends StatefulWidget {
  final RentBloc rentBloc;

  const FilterParameters({
    super.key,
    required this.rentBloc,
  });

  @override
  State<FilterParameters> createState() => _FilterParametersState();
}

class _FilterParametersState extends State<FilterParameters> {
  RangeValues yearValues = RangeValues(1960, DateTime.now().year + 0);

  RangeValues priceValues = const RangeValues(1000, 500000);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AnnouncementListBloc, AnnouncementListState>(
        builder: (context, state) {
          var size = MediaQuery.of(context).size;
          return WillPopScope(
            onWillPop: () async {
              BlocProvider.of<AnnouncementListBloc>(context).add(
                  AnnouncementListEvent.getBodyType(
                      const BodyTypeEntity(id: -1, logo: '', type: '')));
              BlocProvider.of<AnnouncementListBloc>(context).add(
                  AnnouncementListEvent.getDriveType(
                      const DriveTypeEntity(id: -1, logo: '', type: '')));
              BlocProvider.of<AnnouncementListBloc>(context).add(
                  AnnouncementListEvent.getGearboxType(
                      const GearboxTypeEntity(id: -1, logo: '', type: '')));
              return true;
            },
            child: Scaffold(
              appBar: WAppBar(
                title: 'Параметры',
                centerTitle: false,
                extraActions: [
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<AnnouncementListBloc>(context).add(
                          AnnouncementListEvent.getBodyType(
                              const BodyTypeEntity(
                                  id: -1, logo: '', type: '')));
                      BlocProvider.of<AnnouncementListBloc>(context).add(
                          AnnouncementListEvent.getDriveType(
                              const DriveTypeEntity(
                                  id: -1, logo: '', type: '')));
                      BlocProvider.of<AnnouncementListBloc>(context).add(
                          AnnouncementListEvent.getGearboxType(
                              const GearboxTypeEntity(
                                  id: -1, logo: '', type: '')));
                    },
                    child: const Text(
                      'Сбросить',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: orange,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectorItem(
                      onTap: () async {
                        await showModalBottomSheet(
                          isDismissible: false,
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (c) => const ChooseBodyType(
                            selectedId: 0,
                          ),
                        ).then((value) {
                          BlocProvider.of<AnnouncementListBloc>(context)
                              .add(AnnouncementListEvent.getBodyType(value));
                          print(value);
                        });
                      },
                      hintText: state.bodyTypeEntity.type.isEmpty
                          ? LocaleKeys.choose_body.tr()
                          : state.bodyTypeEntity.type,
                      title: LocaleKeys.body_type.tr(),
                      hasArrowDown: true,
                    ),
                    SelectorItem(
                      onTap: () async {
                        await showModalBottomSheet(
                          isDismissible: false,
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (c) => const ChooseDriveType(selectedId: 0),
                        ).then((value) {
                          BlocProvider.of<AnnouncementListBloc>(context)
                              .add(AnnouncementListEvent.getDriveType(value));
                          print(value);
                        });
                      },
                      hintText: state.driveTypeEntity.type.isEmpty
                          ? LocaleKeys.choose_drive_type.tr()
                          : state.driveTypeEntity.type,
                      title: LocaleKeys.drive_unit.tr(),
                      hasArrowDown: true,
                    ),
                    SelectorItem(
                      onTap: () async {
                        await showModalBottomSheet(
                          isDismissible: false,
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (c) => const ChooseGearbox(selectedId: 0),
                        ).then((value) {
                          BlocProvider.of<AnnouncementListBloc>(context)
                              .add(AnnouncementListEvent.getGearboxType(value));
                          print(value);
                        });
                      },
                      hintText: state.gearboxTypeEntity.type.isEmpty
                          ? LocaleKeys.choose_box_type.tr()
                          : state.gearboxTypeEntity.type,
                      title: LocaleKeys.box.tr(),
                      hasArrowDown: true,
                    ),
                    Text(
                      'Выберите валюту',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WButton(
                          onTap: () {
                            BlocProvider.of<AnnouncementListBloc>(context)
                                .add(AnnouncementListEvent.getIdVal(0));
                          },
                          height: 36,
                          width: MediaQuery.of(context).size.width * 0.45,
                          color: state.idVal == 0 ? lavender : whiteSmoke,
                          borderRadius: 46,
                          border: state.idVal == 0
                              ? Border.all(color: purple)
                              : null,
                          child: Text(
                            'у.е. ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: state.idVal == 0 ? dark : grey,
                            ),
                          ),
                        ),
                        WButton(
                          onTap: () {
                            BlocProvider.of<AnnouncementListBloc>(context)
                                .add(AnnouncementListEvent.getIdVal(1));
                          },
                          height: 36,
                          width: MediaQuery.of(context).size.width * 0.45,
                          color: state.idVal == 1 ? lavender : whiteSmoke,
                          borderRadius: 46,
                          border: state.idVal == 1
                              ? Border.all(color: purple)
                              : null,
                          child: Text(
                            'сум',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: state.idVal == 1 ? dark : grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    WRangeSlider(
                      values: yearValues,
                      valueChanged: (value) {
                        yearValues = value;
                        setState(() {});
                      },
                      title: LocaleKeys.year_of_issue.tr(),
                      endValue: DateTime.now().year + 0,
                      startValue: 1960,
                    ),
                    const SizedBox(height: 16),
                    WRangeSlider(
                      values: priceValues,
                      valueChanged: (value) {
                        priceValues = value;
                        setState(() {});
                      },
                      title: LocaleKeys.price.tr(),
                      endValue: 500000,
                      startValue: 1000,
                      isForPrice: true,
                    ),
                    SizedBox(height: size.height * 0.2),
                    WButton(
                      onTap: () => Navigator.pop(context),
                      text: 'Показать',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}

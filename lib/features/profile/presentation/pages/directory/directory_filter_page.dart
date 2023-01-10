import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/profile/presentation/bloc/directory/directory_bloc.dart';
import 'package:auto/features/profile/presentation/widgets/directory_filter_category.dart';
import 'package:auto/features/profile/presentation/widgets/edit_item_container.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/rent_choose_region_bottom_sheet.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class DirectoryFilterPage extends StatefulWidget {
  const DirectoryFilterPage({required this.bloc, Key? key}) : super(key: key);
  final DirectoryBloc bloc;
  @override
  State<DirectoryFilterPage> createState() => _DirectoryFilterPageState();
}

class _DirectoryFilterPageState extends State<DirectoryFilterPage> {
  List<Region>? newRegion;

  @override
  void initState() {
    context.read<RegionsBloc>().add(RegionsEvent.getRegions());
    widget.bloc.add(GetDirCategoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: white,
      appBar: WAppBar(
        boxShadow: const [],
        titleStyle:
            Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16),
        extraActions: [
          Text(LocaleKeys.filter.tr(),
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
          const Spacer(
            flex: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              LocaleKeys.clear.tr(),
              style:
                  Theme.of(context).textTheme.subtitle1!.copyWith(color: blue),
            ),
          ),
        ],
      ),
      body:
          BlocBuilder<DirectoryBloc, DirectoryState>(builder: (context, state) {
        print(state.categories);

        if (state.status.isSubmissionInProgress) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state.status.isSubmissionSuccess) {
          print(state.categories);
          return Container(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LocaleKeys.region.tr(),
                          style: TextStyle(
                              color: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .greySuitToWhite,
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                      const SizedBox(height: 8),
                      WScaleAnimation(
                        onTap: () async {
                          await showModalBottomSheet<List<Region>>(
                            isDismissible: false,
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (c) => RentChooseRegionBottomSheet(
                                list:
                                    context.read<RegionsBloc>().state.regions),
                          ).then((value) {
                            if (value != null && value.isNotEmpty) {
                              setState(() {
                                newRegion = value;
                              });
                            }
                          });
                        },
                        child: EditItemContainer(
                            isOtherPage: true,
                            icon: AppIcons.chevronRightBlack,
                            region: newRegion == null
                                ? 'Выберите регион'
                                : text(newRegion!)),
                      ),
                      const SizedBox(height: 16),
                      //Категории
                      DirectoryFilterCategory(category: state.categories)
                    ],
                  ),
                ),
                WButton(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14),
                  onTap: () {},
                  text: LocaleKeys.apply.tr(),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      }));
}

String text(List<Region>? list) {
  // output : 'Sirdaryo, Namangan, Toshkent
  var result = '';
  if (list != null) {
    for (var i = 0; i < list.length; i++) {
      // ignore: use_string_buffers
      result += list[i].title;
      if (i != list.length - 1) {
        result += ', ';
      }
    }
  }
  return result;
}

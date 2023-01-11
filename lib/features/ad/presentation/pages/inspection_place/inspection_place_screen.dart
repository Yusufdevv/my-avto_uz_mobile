import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/switcher_row.dart';
import 'package:auto/features/common/widgets/w_container.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class InspectionPlaceScreen extends StatefulWidget {
  const InspectionPlaceScreen({Key? key}) : super(key: key);

  @override
  State<InspectionPlaceScreen> createState() => _InspectionPlaceScreenState();
}

class _InspectionPlaceScreenState extends State<InspectionPlaceScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: BaseWidget(
          headerText: 'INSPECTION PAGE',
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Город',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 8,
                ),
                WContainer(
                  onTap: () {},
                  title: 'Выберите город',
                  trailingIcon: AppIcons.chevronDown,
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .solitudeToNero,
                  border: Border.all(
                    width: 1,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .solitudeToDarkRider,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Район',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 8,
                ),
                WContainer(
                  onTap: () {},
                  title: 'Выберите район',
                  trailingIcon: AppIcons.chevronDown,
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .solitudeToNero,
                  border: Border.all(
                    width: 1,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .solitudeToDarkRider,
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                const SwitcherRow(title: 'Указать точную геопозицию'),
              ],
            ),
          ),
        ),
      );
}

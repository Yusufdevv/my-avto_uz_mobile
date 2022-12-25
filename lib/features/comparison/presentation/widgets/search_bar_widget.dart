import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController searchController;
  final String title;
  final Function() onChanged;
  const SearchBarWidget({
    Key? key,
    required this.searchController,
    required this.title,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 16,
              bottom: 12,
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          WTextField(
            fillColor:
                Theme.of(context).extension<ThemedColors>()!.whiteToNightRider,
            margin: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 16,
            ),
            onChanged: (value) {
              onChanged();
            },
            borderRadius: 12,
            hasSearch: true,
            borderColor: purple,
            hintText: 'Поиск',
            height: 40,
            controller: searchController,
            hasClearButton: true,
          ),
        ],
      );
}

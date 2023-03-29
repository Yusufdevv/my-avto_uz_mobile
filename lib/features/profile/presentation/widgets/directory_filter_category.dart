import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/profile/domain/entities/dir_category_entity.dart';
import 'package:auto/features/profile/presentation/bloc/directory/directory_bloc.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DirectoryFilterCategory extends StatefulWidget {
  const DirectoryFilterCategory({
    required this.category,
    Key? key,
  }) : super(key: key);
  final List<DirCategoryEntity> category;

  @override
  State<DirectoryFilterCategory> createState() =>
      _DirectoryFilterCategoryState();
}

class _DirectoryFilterCategoryState extends State<DirectoryFilterCategory> {
  // ignore: prefer_final_fields
  List<DirCategoryEntity> _selectedIndexes = [];

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LocaleKeys.categories.tr(),
              style: TextStyle(
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .greySuitToWhite,
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 16,
            runSpacing: 12,
            children: List.generate(
              widget.category.isEmpty ? 0 : widget.category.length,
              (index) {
                final item = widget.category[index];
                return WButton(
                  width: (MediaQuery.of(context).size.width / 2) - 24,
                  borderRadius: 8,
                  border: Border.all(
                    color: context
                            .read<DirectoryBloc>()
                            .state
                            .selectedCategories
                            .contains(item)
                        ? purple.withOpacity(0.6)
                        : Theme.of(context).extension<ThemedColors>()!.divider,
                  ),
                  shadow: [
                    BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 16,
                        color: context
                                .read<DirectoryBloc>()
                                .state
                                .selectedCategories
                                .contains(item)
                            ? purple.withOpacity(0.12)
                            : darkBlack.withOpacity(0.05))
                  ],
                  onTap: () {
                    if (context
                        .read<DirectoryBloc>()
                        .state
                        .selectedCategories
                        .contains(item)) {
                      _selectedIndexes.remove(item);
                      context.read<DirectoryBloc>().add(DirectoryFilterEvent(
                          selectedCategories: _selectedIndexes));
                    } else {
                      _selectedIndexes.add(item);
                      context.read<DirectoryBloc>().add(DirectoryFilterEvent(
                          selectedCategories: _selectedIndexes));
                    }
                    setState(() {});
                  },
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  color:
                      Theme.of(context).extension<ThemedColors>()!.whiteToDark,
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item.name ?? '',
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    height: 1.3,
                                    color: Theme.of(context)
                                        .extension<ThemedColors>()!
                                        .blackToWhite80,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        right: 0,
                        child: Row(
                          children: [
                            Container(
                              height: 21,
                              width: 24,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Theme.of(context)
                                        .extension<ThemedColors>()!
                                        .whiteToDark
                                        .withOpacity(0),
                                    Theme.of(context)
                                        .extension<ThemedColors>()!
                                        .whiteToDark,
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .whiteToDark,
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  Container(
                                    height: 25,
                                    width: 24,
                                    decoration: BoxDecoration(
                                        color: context
                                                .read<DirectoryBloc>()
                                                .state
                                                .selectedCategories
                                                .contains(item)
                                            ? Theme.of(context)
                                                .extension<ThemedColors>()!
                                                .whiteToDark
                                            : Theme.of(context)
                                                .extension<ThemedColors>()!
                                                .whiteToDark,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Center(
                                      child: Text(
                                        item.carPlaceCount.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                                color: context
                                                        .read<DirectoryBloc>()
                                                        .state
                                                        .selectedCategories
                                                        .contains(item)
                                                    ? purple
                                                    : orange),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      );
}

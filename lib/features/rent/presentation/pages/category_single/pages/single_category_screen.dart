import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/rent/domain/entities/category_entity.dart';
import 'package:auto/features/rent/presentation/pages/category_single/widgets/category_single_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SingleCategoryScreen extends StatefulWidget {
  final CategoryEntity categoryEntity;

  const SingleCategoryScreen({required this.categoryEntity, Key? key})
      : super(key: key);

  @override
  State<SingleCategoryScreen> createState() => _SingleCategoryScreenState();
}

class _SingleCategoryScreenState extends State<SingleCategoryScreen> {
  late TextEditingController searchController;
  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              WScaleAnimation(
                  child: SvgPicture.asset(AppIcons.chevronLeft),
                  onTap: () => Navigator.pop(context)),
              const SizedBox(
                width: 8,
              ),
              Text(
                widget.categoryEntity.title,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: WTextField(
              onChanged: (value) {},
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              borderRadius: 12,
              hasSearch: true,
              hintText: 'Поиск',
            ),
          ),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 16,),
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) => CategorySingleItem(
            rentCarEntity: widget.categoryEntity.rentCarEntity[index],
          ),
          itemCount: widget.categoryEntity.rentCarEntity.length,
        ),
      );
}

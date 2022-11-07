import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/reviews/presentation/widgets/delete_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditDeleteBottomSheet extends StatelessWidget {
  const EditDeleteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: 215,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 20, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Действия',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      AppIcons.close,
                      height: 14,
                      width: 14,
                    ),
                  ),
                ],
              ),
            ),
            Chip(
              padding: const EdgeInsets.only(left: 20, top: 40, bottom: 16),
              backgroundColor: Colors.white,
              avatar: SvgPicture.asset(
                AppIcons.edit,
                height: 20,
                width: 20,
              ),
              label: const Text(
                'Редактировать',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            const Divider(
              indent: 16,
              thickness: 1,
            ),
            GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (context) => const DeleteShowDialog(),
              ),
              child: Chip(
                padding: const EdgeInsets.only(left: 20, top: 16),
                backgroundColor: Colors.white,
                avatar: SvgPicture.asset(
                  AppIcons.delete,
                  height: 18,
                  width: 16,
                ),
                label: const Text(
                  'Удалить',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

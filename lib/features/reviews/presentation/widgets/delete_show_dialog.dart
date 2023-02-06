import 'package:flutter/material.dart';

class DeleteShowDialog extends StatelessWidget {
  const DeleteShowDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        insetPadding: const EdgeInsets.all(16),
        titlePadding: const EdgeInsets.only(left: 12, top: 12),
        contentPadding: const EdgeInsets.only(left: 12, top: 8, right: 12),
        actionsPadding:
            const EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 12),
        title: const Text(
          'Удалить отзыв',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        content: const Text(
          'Вы действительно хотите удалить этот отзыв?',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff92929D),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context), behavior: HitTestBehavior.opaque,
                child: deleteCancelButton(
                  context,
                  'Отмена',
                  const Color(0xffF1F1F5),
                  const Color(0xff92929D),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context), behavior: HitTestBehavior.opaque,
                child: deleteCancelButton(
                  context,
                  'Удалить',
                  const Color(0xffFAEEEE),
                  const Color(0xffC8534D),
                ),
              ),
            ],
          ),
        ],
      );
  Widget deleteCancelButton(BuildContext context, String text, Color backColor,
          Color textColor) =>
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width * 0.41,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backColor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
      );
}

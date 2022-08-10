import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/dealers/domain/entities/models/marks_with_announcements.dart';
import 'package:auto/features/dealers/presentation/pages/single_mark_announcements.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AllMarksWithAnnouncements extends StatelessWidget {
  final List<MarksWithAnnouncementModel> marks;
  const AllMarksWithAnnouncements({Key? key, required this.marks})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: WAppBar(
          child: Row(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Все марки с объявлениями',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.25),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 15,
            runSpacing: 16,
            children: List.generate(
              marks.length,
              (index) => Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const SingleMarkAnnouncements()));
                    },
                    child: Container(
                      height: 91,
                      width: MediaQuery.of(context).size.width * 0.44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .solitude2ToNightRider),
                      ),
                      child: ClipRRect(
                        child: SvgPicture.asset(marks[index].imageUrl),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 8,
                    bottom: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: dimGray.withOpacity(0.2),
                      ),
                      child: Row(
                        children: [
                          Text(
                            marks[index].mark,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: white.withOpacity(0.75)),
                          ),
                          Text(
                            '(${marks[index].quantity})',
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: white),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}

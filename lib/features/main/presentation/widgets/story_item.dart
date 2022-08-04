import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/main/domain/entities/story_item_entity.dart';
import 'package:auto/features/main/presentation/pages/story_screen.dart';
import 'package:auto/features/main/presentation/widgets/story_data.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  final StoryItemEntity storyItemEntity;

  const StoryItem({required this.storyItemEntity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => WScaleAnimation(
    onTap: () => Navigator.of(context, rootNavigator: true).push( fade(page: StoryScreen(story: storyEntity),),),
    child: Container(
          height: 96,
          width: 80,
          margin: const EdgeInsets.only(left: 16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  orange.withOpacity(1),
                  purple.withOpacity(1),
                ],
              ),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 8),
                    blurRadius: 19,
                    color: purple.withOpacity(.12)),
              ]),
          child: Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    margin: const EdgeInsets.all(3),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: NetworkImage(storyItemEntity.image),
                            fit: BoxFit.cover)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [dark.withOpacity(0), dark.withOpacity(1)]),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      storyItemEntity.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
  );
}

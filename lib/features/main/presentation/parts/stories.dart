import 'package:auto/features/main/domain/entities/story_entity.dart';
import 'package:auto/features/main/presentation/pages/story_screen.dart';
import 'package:auto/features/main/presentation/widgets/story_item.dart';
import 'package:auto/features/main/presentation/widgets/story_shimmer_item.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class Stories extends StatelessWidget {
  const Stories({
    required this.status,
    required this.stories,
    required this.onBack,
    Key? key,
  }) : super(key: key);
  final FormzStatus status;
  final List<StoryEntity> stories;
  final Function() onBack;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 96,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) => status.isSubmissionInProgress
              ? const StoryShimmerItem()
              : StoryItem(
                  title: stories[index].name,
                  image: stories[index].coverImageThumbnail.square,
                  onTap: () async {
                    final res = await Navigator.of(context, rootNavigator: true)
                        .push(fade(
                            page: StoryScreen(
                      stories: stories,
                      index: index,
                    )));
                    if (res is bool && res) {
                      onBack();
                    }
                  },
                  isRead: stories[index].isRead,
                ),
          itemCount: status.isSubmissionInProgress ? 5 : stories.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(width: 8),
        ),
      );
}

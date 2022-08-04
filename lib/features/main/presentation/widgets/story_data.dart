import 'package:auto/features/main/domain/entities/story_enrtity.dart';
import 'package:auto/features/main/domain/entities/story_item_entity.dart';

const StoryItemEntity storyItemEntity = StoryItemEntity(
  image:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5KE6WdlzR4U5HhztmWfzsNktNZLGMwF3M9A&usqp=CAU',
  title: 'Новые авто с салона',
    descriptionTitle: 'All New Tesla Model X',
    description: 'A refined Tesla Sport Suspension, based on Tesla’s 2-axle air suspension system, with Active A refined Tesla Sport Suspension, based on Tesla’s 2-axle air suspension system, with Active'
);


final List<StoryItemEntity> storyItemsEntity = [
  const StoryItemEntity(
      image:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5KE6WdlzR4U5HhztmWfzsNktNZLGMwF3M9A&usqp=CAU',
      title: 'Новые авто с салона',
      description: 'A refined ALPINA Sport Suspension, based on BMW’s 2-axle air suspension system, with Active R',
      descriptionTitle: 'All new BMW XB7 Alpina'
  ),
  const StoryItemEntity(
      image:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5KE6WdlzR4U5HhztmWfzsNktNZLGMwF3M9A&usqp=CAU',
      title: 'Новые авто с салона',
      description: 'All New Tesla Model X',
      descriptionTitle: 'A refined Tesla Sport Suspension, based on Tesla’s 2-axle air suspension system, with Active R'
  ),
  const StoryItemEntity(
      image:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5KE6WdlzR4U5HhztmWfzsNktNZLGMwF3M9A&usqp=CAU',
      title: 'Новые авто с салона',
      description: '',
      descriptionTitle: ''
  ),
  const StoryItemEntity(
      image:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5KE6WdlzR4U5HhztmWfzsNktNZLGMwF3M9A&usqp=CAU',
      title: 'Новые авто с салона',
      description: '',
      descriptionTitle: ''
  ),
];
final List<StoryEntity> storyEntity = [
  const StoryEntity(
    duration: Duration(seconds: 5),
    storyItemEntity: storyItemEntity,
    url:
        'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2020-03-bmw-alpina-xb7-g07-press-032-1589832324.jpg?crop=0.549xw:0.824xh;0.221xw,0.0918xh&resize=480:*',
  ),
  const StoryEntity(
    duration: Duration(seconds: 5),
    storyItemEntity: storyItemEntity,
    url:
        'https://tesla-cdn.thron.com/delivery/public/image/tesla/195458a0-ff67-488c-b972-14d23d2c42fb/bvlatuR/std/1200x630/ms-homepage-social',
  ),
  const StoryEntity(
    duration: Duration(seconds: 5),
    storyItemEntity: storyItemEntity,
    url:
        'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2020-03-bmw-alpina-xb7-g07-press-032-1589832324.jpg?crop=0.549xw:0.824xh;0.221xw,0.0918xh&resize=480:*',
  ),
  const StoryEntity(
    duration: Duration(seconds: 5),
    storyItemEntity: storyItemEntity,
    url:
        'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2020-03-bmw-alpina-xb7-g07-press-032-1589832324.jpg?crop=0.549xw:0.824xh;0.221xw,0.0918xh&resize=480:*',
  ),
];

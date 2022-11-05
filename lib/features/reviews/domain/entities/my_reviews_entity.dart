import 'package:auto/features/reviews/domain/entities/result_entity.dart';

class MyReviewsEntity {
  MyReviewsEntity({
    this.count = 0,
    this.next = '',
    this.previous = '',
    this.results = const [],
  });

  final int count;
  final String next;
  final String previous;
  @ResultConverter()
  final List<ResultEntity> results;
}

// class StarAnswer {
//   StarAnswer({
//     this.question,
//     this.starCount,
//   });

//   final Question question;
//   final int starCount;
// }

class Question {
  Question({
    this.id = 0,
    this.title = '',
  });

  final int id;
  final String title;
}

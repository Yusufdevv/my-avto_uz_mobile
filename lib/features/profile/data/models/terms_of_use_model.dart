import 'package:auto/features/profile/domain/entities/terms_of_use_entity.dart';

class TermsOfUseModel extends TermsOfUseEntity {
  TermsOfUseModel({
    required super.id,
    required super.title,
    required super.slug,
    required super.link,
    required super.content,
  });

  factory TermsOfUseModel.fromJson(Map<String, dynamic> json) =>
      TermsOfUseModel(
        id: json['id'],
        title: json['title'],
        slug: json['slug'],
        link: json['link'],
        content: json['content'],
      );
}

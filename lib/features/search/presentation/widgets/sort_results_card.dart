import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/search/presentation/search_screen.dart';
import 'package:auto/features/search/presentation/widgets/info_result_container.dart';
import 'package:flutter/material.dart';

class SortResultsCard extends StatelessWidget {
  final List<AutoEntity> searchResults;
  final int index;
  final SortSearchResultStatus status;

  const SortResultsCard(
      {required this.searchResults,
      required this.index,
      required this.status,
      super.key});

  @override
  Widget build(BuildContext context) {
    var newList = List<AutoEntity>.from(searchResults);

    switch (status) {
      case SortSearchResultStatus.cheapest:
        newList.sort(
          (a, b) => a.price.compareTo(b.price),
        );
        break;
      case SortSearchResultStatus.expensive:
        newList.sort(
          (a, b) => a.price.compareTo(b.price),
        );
        newList.reversed.toList(growable: false);
        break;
      case SortSearchResultStatus.newest:
        newList.sort(
          (a, b) {
            final aDate = DateTime(
              int.parse(a.publishedAt.substring(0, 4)),
              int.parse(a.publishedAt.substring(5, 7)),
              int.parse(a.publishedAt.substring(8, 10)),
              int.parse(a.publishedAt.substring(11, 13)),
              int.parse(a.publishedAt.substring(14, 16)),
              int.parse(a.publishedAt.substring(17, 19)),
            );
            final bDate = DateTime(
              int.parse(b.publishedAt.substring(0, 4)),
              int.parse(b.publishedAt.substring(5, 7)),
              int.parse(b.publishedAt.substring(8, 10)),
              int.parse(b.publishedAt.substring(11, 13)),
              int.parse(b.publishedAt.substring(14, 16)),
              int.parse(b.publishedAt.substring(17, 19)),
            );
            return aDate.compareTo(bDate);
          },
        );
        break;
      case SortSearchResultStatus.oldest:
        newList.sort(
          (a, b) {
            final aDate = DateTime(
              int.parse(a.publishedAt.substring(0, 4)),
              int.parse(a.publishedAt.substring(5, 7)),
              int.parse(a.publishedAt.substring(8, 10)),
              int.parse(a.publishedAt.substring(11, 13)),
              int.parse(a.publishedAt.substring(14, 16)),
              int.parse(a.publishedAt.substring(17, 19)),
            );
            final bDate = DateTime(
              int.parse(b.publishedAt.substring(0, 4)),
              int.parse(b.publishedAt.substring(5, 7)),
              int.parse(b.publishedAt.substring(8, 10)),
              int.parse(b.publishedAt.substring(11, 13)),
              int.parse(b.publishedAt.substring(14, 16)),
              int.parse(b.publishedAt.substring(17, 19)),
            );
            return aDate.compareTo(bDate);
          },
        );
        newList.reversed.toList(growable: false);
        break;
    }
    return InfoResultContainer(
      currency: newList[index].currency,
      discount: newList[index].discount,
      callFrom: newList[index].contactAvailableFrom,
      callTo: newList[index].contactAvailableTo,
      gallery: newList[index].gallery,
      carModelName: newList[index].model.name,
      carYear: newList[index].year,
      contactPhone: newList[index].contactPhone,
      description: newList[index].description,
      districtTitle: newList[index].district.title,
      isNew: newList[index].isNew,
      isWishlisted: newList[index].isWishlisted,
      price: newList[index].price,
      publishedAt: newList[index].publishedAt,
      userFullName: newList[index].user.fullName,
      userImage: newList[index].user.image,
      userType: newList[index].userType,
      hasComparison: newList[index].isComparison,
      id: newList[index].id,
      index: index,
    );
  }
}

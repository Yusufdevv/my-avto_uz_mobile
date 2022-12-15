import 'dart:convert';

import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/data/models/announcement.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AdLocalDataSource {
  Future<AnnouncementModel> getDraftAnnouncement();

  Future<void> cacheDraftAnnouncement({
    required AnnouncementModel announcementModel,
  });
}

class AdLocalDataSourceImpl extends AdLocalDataSource {
  final SharedPreferences sharedPreferences;

  AdLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheDraftAnnouncement({
    required AnnouncementModel announcementModel,
  }) =>
      sharedPreferences.setString(
        CACHED_DRAFT_ANNOUNCEMENT,
        announcementModel.toJson(announcementModel).toString(),
      );

  @override
  Future<AnnouncementModel> getDraftAnnouncement() {
    final jsonString = sharedPreferences.getString(CACHED_DRAFT_ANNOUNCEMENT);
    if (jsonString != null) {
      return Future.value(AnnouncementModel.fromJson(json.decode(jsonString)));
    } else {
      throw const CacheException(errorMessage: "Draft don't saved");
    }
  }
}

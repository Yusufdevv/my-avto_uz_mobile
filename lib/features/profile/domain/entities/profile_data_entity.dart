import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProfileDataEntity extends Equatable {
  ProfileDataEntity({
    required this.usercountdata,
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.fullName,
    this.email,
    this.image,
    this.region,
    this.phoneNumber,
    this.isDealer,
    this.isActive,
    this.isStaff,
    this.isSuperuser,
    this.lastLogin,
    this.dateJoined,
    this.isReadAllNotifications = true,
  });

  final int? id;
  final dynamic username;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? email;
  final String? image;
  final Region? region;
  final String? phoneNumber;
  final bool? isDealer;
  final bool? isActive;
  final bool? isStaff;
  final bool? isSuperuser;
  final String? lastLogin;
  final String? dateJoined;
  Usercountdata usercountdata;
  bool isReadAllNotifications;

  @override
  List<Object?> get props => [
        id,
        username,
        firstName,
        fullName,
        email,
        image,
        region,
        phoneNumber,
        isDealer,
        isActive,
        isStaff,
        isSuperuser,
        lastLogin,
        dateJoined,
        usercountdata,
        isReadAllNotifications
      ];
}

class Region {
  Region({
    this.id,
    this.title,
    this.soato,
  });

  final int? id;
  final String? title;
  final String? soato;

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        id: json['id'] as int? ?? 0,
        title: json['title'] as String? ?? '',
        soato: json['soato'] as String? ?? '',
      );
}

class Usercountdata {
  Usercountdata(
      {this.id = -1,
      this.user = -1,
      this.announcementWishlistCount = 0,
      this.announcementsCount = 0,
      this.searchCount = 0,
      this.reviewsCount = 0,
      this.filterHistoryCount = 0});

  final int id;
  final int user;
  int announcementWishlistCount;
  int announcementsCount;
  int searchCount;
  int reviewsCount;
  int filterHistoryCount;

  factory Usercountdata.fromJson(Map<String, dynamic> json) => Usercountdata(
        id: json['id'],
        user: json['user'],
        announcementWishlistCount: json['announcement_wishlist_count'],
        announcementsCount: json['announcements_count'],
        searchCount: json['search_count'],
        reviewsCount: json['reviews_count'],
        filterHistoryCount: json['filter_history_count'],
      );
}

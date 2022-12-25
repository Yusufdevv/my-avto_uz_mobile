
class ProfileDataEntity {
    ProfileDataEntity({
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
        this.usercountdata,
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
    final DateTime? lastLogin;
    final DateTime? dateJoined;
    final Usercountdata? usercountdata;

    

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
        id: json['id'],
        title: json['title'],
        soato: json['soato'],
    );

    Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'soato': soato,
    };
}

class Usercountdata {
    Usercountdata({
         this.id,
         this.user,
         this.announcementWishlistCount,
         this.announcementsCount,
         this.searchCount,
         this.reviewsCount,
    });

    final int? id;
    final int? user;
    final int? announcementWishlistCount;
    final int? announcementsCount;
    final int? searchCount;
    final int? reviewsCount;

    factory Usercountdata.fromJson(Map<String, dynamic> json) => Usercountdata(
        id: json['id'],
        user: json['user'],
        announcementWishlistCount: json['announcement_wishlist_count'],
        announcementsCount: json['announcements_count'],
        searchCount: json['search_count'],
        reviewsCount: json['reviews_count'],
    );

    Map<String, dynamic> toJson() => {
        'id': id,
        'user': user,
        'announcement_wishlist_count': announcementWishlistCount,
        'announcements_count': announcementsCount,
        'search_count': searchCount,
        'reviews_count': reviewsCount,
    };
}

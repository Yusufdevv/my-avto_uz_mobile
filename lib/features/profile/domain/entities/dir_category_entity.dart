class DirCategoryEntity {
    DirCategoryEntity({
        this.id,
        this.name,
        this.carPlaceCount,
    });

    int? id;
    String? name;
    int? carPlaceCount;

    factory DirCategoryEntity.fromJson(Map<String, dynamic> json) => DirCategoryEntity(
        id: json['id'],
        name: json['name'],
        carPlaceCount: json['car_place_count'],
    );

    Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'car_place_count': carPlaceCount,
    };
}
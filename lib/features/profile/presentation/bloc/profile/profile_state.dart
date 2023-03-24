part of 'profile_bloc.dart';

@immutable
class ProfileState extends Equatable {
  final ProfileDataEntity profileEntity;
  final TermsOfUseEntity termsOfUseEntity;
  final List<ProductsList> productCategory;
  final List<CarProductEntity> cartProductEntity;
  final List<ProductCategoryModel> productCategoryModell;
  final FormzStatus status;
  final FormzStatus editStatus;
  final FormzStatus changeStatus;
  final FormzStatus getCarProductByCategoryStatus;
  final FormzStatus getProductCategoryStatus;
  final FormzStatus getProductListStatus;
  final bool isNotificationAllRead;

  const ProfileState({
    required this.status,
    required this.profileEntity,
    required this.termsOfUseEntity,
    required this.editStatus,
    required this.changeStatus,
    required this.isNotificationAllRead,
    required this.productCategory,
    required this.cartProductEntity,
    required this.getCarProductByCategoryStatus,
    required this.getProductCategoryStatus,
    required this.getProductListStatus,
    required this.productCategoryModell,
  });

  ProfileState copyWith({
    ProfileDataEntity? profileEntity,
    List<AutoEntity>? autoEntity,
    TermsOfUseEntity? termsOfUseEntity,
    FormzStatus? status,
    FormzStatus? editStatus,
    FormzStatus? secondStatus,
    FormzStatus? changeStatus,
    FormzStatus? getCarProductByCategoryStatus,
    FormzStatus? getProductCategoryStatus,
    FormzStatus? getProductListStatus,
    bool? isNotificationAllRead,
    List<ProductsList>? productCategory,
    List<CarProductEntity>? cartProductEntity,
    List<ProductCategoryModel>? productCategoryModell,
  }) =>
      ProfileState(
        status: status ?? this.status,
        profileEntity: profileEntity ?? this.profileEntity,
        termsOfUseEntity: termsOfUseEntity ?? this.termsOfUseEntity,
        productCategory: productCategory ?? this.productCategory,
        cartProductEntity: cartProductEntity ?? this.cartProductEntity,
        getCarProductByCategoryStatus:
            getCarProductByCategoryStatus ?? this.getCarProductByCategoryStatus,
        getProductCategoryStatus:
            getProductCategoryStatus ?? this.getProductCategoryStatus,
        getProductListStatus: getProductListStatus ?? this.getProductListStatus,
        editStatus: editStatus ?? this.editStatus,
        changeStatus: changeStatus ?? this.changeStatus,
        isNotificationAllRead:
            isNotificationAllRead ?? this.isNotificationAllRead,
        productCategoryModell:
            productCategoryModell ?? this.productCategoryModell,
      );

  @override
  List<Object?> get props => [
        productCategoryModell,
        status,
        profileEntity,
        termsOfUseEntity,
        editStatus,
        changeStatus,
        isNotificationAllRead,
        cartProductEntity,
        productCategory,
        getCarProductByCategoryStatus,
        getProductCategoryStatus,
        getProductListStatus,
      ];
}

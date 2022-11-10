class ProfileEntity {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String fullName;
  final String email;
  final String image;
  final int region;
  final String phoneNumber;
  final bool isDealer;
  final bool isActive;
  final bool isStaff;
  final bool isSuperuser;
  final String lastLogin;
  final String dateJoined;

  const ProfileEntity({
    this.id = 0,
    this.lastName = '',
    this.firstName = '',
    this.image = '',
    this.region = 0,
    this.email = '',
    this.phoneNumber = '',
    this.fullName = '',
    this.dateJoined = '',
    this.isActive = false,
    this.isDealer = false,
    this.isStaff = false,
    this.isSuperuser = false,
    this.lastLogin = '',
    this.username = '',
  });
}

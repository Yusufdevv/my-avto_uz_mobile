part of 'contacts_bloc.dart';

class ContactsState extends Equatable {
  TextEditingController phoneController;
  TextEditingController nameController;
  TextEditingController emailController;
  final UserModel? userModel;
  final FormzStatus status;
  final FormzStatus? getUserStatus;
  final bool isSubmitted;
  final String? session;
  final String? toastMessage;
  ContactsState({
    required this.phoneController,
    required this.nameController,
    required this.emailController,
    required this.status,
    this.isSubmitted = false,
    this.toastMessage,
    this.session,
    this.userModel,
    this.getUserStatus,
  }) : super();

  ContactsState copyWith({
    String? nameInitial,
    String? phoneInitial,
    String? emailInitial,
    FormzStatus? status,
    FormzStatus? getUserStatus,
    UserModel? userModel,
    String? session,
    String? toastMessage,
    bool? isSubmitted,
    TextEditingController? phoneController,
    TextEditingController? nameController,
    TextEditingController? emailController,
  }) =>
      ContactsState(
        isSubmitted: isSubmitted ?? this.isSubmitted,
        getUserStatus: getUserStatus ?? this.getUserStatus,
        userModel: userModel ?? this.userModel,
        status: status ?? this.status,
        session: session ?? this.session,
        toastMessage: toastMessage ?? this.toastMessage,
        phoneController: phoneController ?? this.phoneController,
        nameController: nameController ?? this.nameController,
        emailController: emailController ?? this.emailController,
      );

  @override
  List<Object?> get props => [
        status,
        isSubmitted,
        toastMessage,
        session,
        userModel,
        getUserStatus,
        phoneController,
        nameController,
        emailController,
      ];
}

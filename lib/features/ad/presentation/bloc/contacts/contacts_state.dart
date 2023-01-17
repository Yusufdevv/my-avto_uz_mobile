part of 'contacts_bloc.dart';

class ContactsState extends Equatable {
  final UserModel? userModel;
  final FormzStatus status;
  final FormzStatus? getUserStatus;
  final String? session;
  final String? toastMessage;
  const ContactsState(
      {required this.status,
      this.toastMessage,
      this.session,
      this.userModel,
      this.getUserStatus});

  ContactsState copyWith(
          {FormzStatus? status,
          FormzStatus? getUserStatus,
          UserModel? userModel,
          String? session,
          String? toastMessage,
          TextEditingController? controller}) =>
      ContactsState(
        getUserStatus: getUserStatus ?? this.getUserStatus,
        userModel: userModel ?? this.userModel,
        status: status ?? this.status,
        session: session ?? this.session,
        toastMessage: toastMessage ?? this.toastMessage,
      );

  @override
  List<Object?> get props =>
      [status, session, toastMessage, userModel, getUserStatus];
}

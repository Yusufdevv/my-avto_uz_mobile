part of 'contacts_bloc.dart';

abstract class ContactsEvent {}

class ContactsSendCodeEvent extends ContactsEvent {
  final String phone;
  ContactsSendCodeEvent({required this.phone});
}

class ContactsVerifyEvent extends ContactsEvent {
  final String phone;
  ContactsVerifyEvent({required this.phone});
}

class ContactsGetUserInfoAsContactsEvent extends ContactsEvent {
  ContactsGetUserInfoAsContactsEvent();
}

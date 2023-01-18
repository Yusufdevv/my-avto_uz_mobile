part of 'contacts_bloc.dart';

abstract class ContactsEvent {}

class ContactsSendCodeEvent extends ContactsEvent {
  final String phone;
  final Function(String) onSuccess;
  ContactsSendCodeEvent({required this.phone,required this.onSuccess});
}





class ContactsGetUserInfoAsContactsEvent extends ContactsEvent {
  ContactsGetUserInfoAsContactsEvent();
}

class ContactsRefreshControllersEvent extends ContactsEvent {
  ContactsRefreshControllersEvent();
}

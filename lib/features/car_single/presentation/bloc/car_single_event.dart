part of 'car_single_bloc.dart';

abstract class CarSingleEvent {}

class GetCarSingleEvent extends CarSingleEvent {}

class GetOtherCarsSingleEvent extends CarSingleEvent {}

class PayInvoiceEvent extends CarSingleEvent {}

class ShowFreeVinEvent extends CarSingleEvent {}

class BuyFullVinEvent extends CarSingleEvent {}

class ShowPriceItemEvent extends CarSingleEvent {}

class CompareEvent extends CarSingleEvent {}

class PhoneEvent extends CarSingleEvent {}

class ConfirmPayWay extends CarSingleEvent {}

class LikeEvent extends CarSingleEvent {}

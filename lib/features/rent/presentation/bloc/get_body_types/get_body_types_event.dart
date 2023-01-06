part of 'get_body_types_bloc.dart';

abstract class GetBodyTypesEvent {}
    class  GetBodyTypesGetEvent  extends GetBodyTypesEvent  {

}
class GetBodyTypesSelectIndex extends GetBodyTypesEvent {
  final int index;
  GetBodyTypesSelectIndex(this.index);
}

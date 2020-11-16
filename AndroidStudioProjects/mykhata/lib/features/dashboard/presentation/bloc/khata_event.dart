part of 'khata_bloc.dart';

@immutable
abstract class KhataEvent extends Equatable{

}
class ShowDashboardPage extends KhataEvent
{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class KhataSearchEvent extends KhataEvent
{
  String searchQuery;
  @override

  List<Object> get props => [];
}
class ShowKhataPage extends KhataEvent
{
  @override
  // TODO: implement props
  List<Object> get props => [];

}
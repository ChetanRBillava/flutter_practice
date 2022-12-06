part of 'internet_cubit.dart';

@immutable
abstract class InternetState {
  String connectionState = 'Loading Internet connection';
  IconData connectionStateIcon = Icons.sync;
}

class InternetLoading extends InternetState {
}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;
  String connectionState;
  IconData connectionStateIcon;

  InternetConnected({required this.connectionType, required this.connectionState, required this.connectionStateIcon});
}

class InternetDisconnected extends InternetState {
  String connectionState;
  IconData connectionStateIcon;

  InternetDisconnected({required this.connectionState, required this.connectionStateIcon});
}

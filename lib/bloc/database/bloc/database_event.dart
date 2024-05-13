part of 'database_bloc.dart';

@immutable
abstract class DatabaseEvent {
  const DatabaseEvent();

  List<Object> get props => [];
}

class GetUser extends DatabaseEvent {
  final String uid;
  const GetUser(this.uid);
  @override 
  List<Object> get props => [uid];
}

class SaveUser extends DatabaseEvent {
  final UserModel user;
  const SaveUser(this.user);
  @override
  List<Object> get props => [user];
}
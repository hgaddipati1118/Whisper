part of 'database_bloc.dart';

@immutable
sealed class DatabaseState {
  const DatabaseState();

  List<Object> get props => [];
}

final class DatabaseInitialState extends DatabaseState {}

final class DatabaseLoadingState extends DatabaseState {
  final bool isLoading;
  const DatabaseLoadingState({required this.isLoading});
}

class UserSuccessState extends DatabaseState {
  final UserModel user;

  const UserSuccessState(this.user);
  @override
  List<Object> get props => [user];
}


class DatabaseFailureState extends DatabaseState {
  final String errorMessage;

  const DatabaseFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
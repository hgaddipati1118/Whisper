import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:complete/models/user.dart';
import 'package:complete/services/authentication.dart';
import 'package:complete/services/database.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthService authService = AuthService();
  final DatabaseService databaseService = DatabaseService();
  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<AuthenticationEvent>((event, emit) {});

    on<SignUpUser>((event, emit) async {
      emit(const AuthenticationLoadingState(isLoading: true));
      try {
        final UserModel? user =
            await authService.signUpUser(event.email, event.password);
        if (user != null) {
          emit(AuthenticationSuccessState(user));
          try {
            await databaseService.saveUserData(user);
          } catch (e) {
            print(e.toString());
          }
        } else {
          emit(const AuthenticationFailureState('create user failed'));
        }
      } catch (e) {
        print(e.toString());
      }
      emit(const AuthenticationLoadingState(isLoading: false));
    });

    on<LoginUser>((event, emit) async {
      emit(const AuthenticationLoadingState(isLoading: true));
      try {
        final UserModel? user =
            await authService.loginUser(event.email, event.password);
        if (user != null) {
          emit(AuthenticationSuccessState(user));
        } else {
          emit(const AuthenticationFailureState('login user failed'));
        }
      } catch (e) {
        print(e.toString());
      }
      emit(const AuthenticationLoadingState(isLoading: false));
    });

    on<GetUser>((event, emit) async {
      emit(const AuthenticationLoadingState(isLoading: true));
      try {
        final UserModel? user = await authService.getUser();
        if (user != null) {
          emit(AuthenticationSuccessState(user));
        } else {
          emit(const AuthenticationFailureState('no user'));
        }
      } catch (e) {
        print(e.toString());
      }
    });

    on<SignOut>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
        authService.signOutUser();
      } catch (e) {
        print('error');
        print(e.toString());
      }
      emit(AuthenticationLoadingState(isLoading: false));
    });
  }
}

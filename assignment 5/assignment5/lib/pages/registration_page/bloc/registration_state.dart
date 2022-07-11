part of 'registration_bloc.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegistrationDownload extends RegistrationState {

}
class RegistrationFinish extends RegistrationState {
}

class RegistrationError extends  RegistrationState {
  final Object error;
  RegistrationError({required this.error});
}
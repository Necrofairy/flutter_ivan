import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/data_account.dart';
import '../../../services/registration.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final Registration registration;
  final DataAccount data;

  RegistrationBloc({required this.data, required this.registration})
      : super(RegistrationInitial()) {
    on<RegistrationEvent>((event, emit) async {
      emit(RegistrationDownload());
      try {
        await registration.registration(data);
        emit(RegistrationFinish());
      } catch (error) {
        emit(RegistrationError(error: error));
      }
    });
  }
}

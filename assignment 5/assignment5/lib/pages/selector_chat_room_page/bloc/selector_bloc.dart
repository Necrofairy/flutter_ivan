
import 'package:assignment5/services/accounts.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/data_account.dart';

part 'selector_event.dart';
part 'selector_state.dart';

class SelectorBloc extends Bloc<SelectorEvent, SelectorState> {
  SelectorBloc() : super(SelectorInitial())  {
    on<SelectorEvent>((event, emit) async {
      emit(SelectorDownload());
      try{
        List<DataAccount> accounts =  await Accounts().getAccounts();
        emit(SelectorFinish(accounts: accounts));
      }catch(error) {
        emit(SelectorError(error: error));
      }
    });
  }
}

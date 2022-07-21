part of 'selector_bloc.dart';

@immutable
abstract class SelectorState {}

class SelectorInitial extends SelectorState {
}
class SelectorDownload extends SelectorState {}
class SelectorFinish extends SelectorState {
  final List<DataAccount> accounts;
  SelectorFinish({required this.accounts});
}
class SelectorError extends SelectorState {
  final Object error;
  SelectorError({required this.error});
}

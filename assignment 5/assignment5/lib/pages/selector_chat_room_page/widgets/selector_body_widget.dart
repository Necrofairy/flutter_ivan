import 'package:assignment5/models/data_account.dart';
import 'package:assignment5/pages/chat_room_page/chat_room_page.dart';
import 'package:assignment5/pages/selector_chat_room_page/bloc/selector_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectorBodyWidget extends StatelessWidget {
  const SelectorBodyWidget({Key? key, required this.data}) : super(key: key);
  final DataAccount data;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectorBloc, SelectorState>(
      builder: (context, state) {
        if (state is SelectorInitial) {
          SelectorBloc bloc = BlocProvider.of<SelectorBloc>(context);
          bloc.add(SelectorAccountsEvent());
          return const SizedBox();
        } else if (state is SelectorDownload) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SelectorFinish) {
          return ListView.builder(itemCount: state.accounts.length, itemBuilder: (context, index) {
            DataAccount account = state.accounts[index];
            if (account.uid == data.uid) {
              return const SizedBox();
            } else {
              return Card(child: ListTile(
                title: Text('${account.nickname}'),
                onTap: () {
                  DataAccount account = state.accounts[index];
                  Navigator.pushNamed(context, ChatRoomPage.routeName, arguments: account);
                },
              ));
            }
          });
        } else if (state is SelectorError) {
          return const Text('Error');
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

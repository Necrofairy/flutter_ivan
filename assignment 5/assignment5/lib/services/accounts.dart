import 'dart:convert';

import 'package:assignment5/models/data_account.dart';
import 'package:firebase_database/firebase_database.dart';

class Accounts {
  Future<List<DataAccount>> getAccounts() async{
    List<DataAccount> accounts = [];
    FirebaseDatabase database = FirebaseDatabase.instance;
    var ref = database.ref('accounts/');
    var snapshot = await ref.get();
    var json = jsonEncode(snapshot.value);
    Map<String, dynamic> map = jsonDecode(json);
    map.forEach((key, value) {accounts.add(DataAccount.fromJson(value));});
    return accounts;
  }
}
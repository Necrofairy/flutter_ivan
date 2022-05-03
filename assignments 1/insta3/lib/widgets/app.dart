import 'package:flutter/material.dart';
import 'package:insta3/widgets/app_bar_widget.dart';
import 'package:insta3/widgets/content_widgets.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBarWidget.appBar,
        backgroundColor: Colors.white,
        body: ContentWidget(),
      ),
    );
  }
}

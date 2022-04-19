import 'package:flutter/material.dart';
import 'package:insta/instagram/image_name.dart';

class InstagramMenuWidget extends StatelessWidget {
  const InstagramMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const _AppBarTitleWidget(),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              color: Colors.white,
              child: Column(
                children: const [
                  _TopMenuWidget(),
                  _CenterMenuWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  _BottomMenuWidget(),
                  SizedBox(
                    height: 10,
                  ),
                  _TextInfoWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  _BottomButtons(),
                  SizedBox(
                    height: 10,
                  ),
                  _ImagesWidget(),
                  _ImagesSecondRowWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class _ImagesSecondRowWidget extends StatelessWidget {
  const _ImagesSecondRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          height: 150,
          child: Image.asset(ImageName.cat4),
        ),
        const SizedBox(width: 2,),
        SizedBox(
          width: 150,
          height: 150,
          child: Image.asset(ImageName.cat5),
        ),
        const SizedBox(width: 2,),
        SizedBox(
          width: 150,
          height: 150,
          child: Image.asset(ImageName.cat6),
        )
      ],
    );
  }
}

class _ImagesWidget extends StatelessWidget {
  const _ImagesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          height: 150,
          child: Image.asset(ImageName.cat1),
        ),
        const SizedBox(width: 2,),
        SizedBox(
          width: 150,
          height: 150,
          child: Image.asset(ImageName.cat2),
        ),
        const SizedBox(width: 2,),
        SizedBox(
          width: 150,
          height: 150,
          child: Image.asset(ImageName.cat3),
        )
      ],
    );
  }
}

class _AppBarTitleWidget extends StatelessWidget {
  const _AppBarTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Instagram',
      style: TextStyle(color: Colors.black),
    );
  }
}

class _TopMenuWidget extends StatelessWidget {
  const _TopMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.home,
      Icons.send,
      Icons.add_box_outlined,
      Icons.access_time_sharp,
      Icons.favorite
    ];
    final widgetIcons = <Widget>[];
    for (var icon in icons) {
      widgetIcons.add(SizedBox(
        width: 80,
        height: 80,
        child: Icon(icon),
      ));
    }
    return Row(
      children: [...widgetIcons],
    );
  }
}

class _CenterMenuWidget extends StatelessWidget {
  const _CenterMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: Image.asset(ImageName.avatarPNG),
        ),
        Column(
          children: [
            Row(
              children: const [
                Text(
                  'necro_fairy',
                  style: TextStyle(
                      fontSize: 28, color: Color.fromRGBO(38, 38, 38, 1)),
                ),
                Icon(Icons.settings)
              ],
            ),
            const TextButton(
                onPressed: null, child: Text('Редактировать профиль'), )
          ],
        ),
      ],
    );
  }
}

class _BottomMenuWidget extends StatelessWidget {
  const _BottomMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(width: 200, child: Text('Necrofairy')),
        SizedBox(width: 200, child: Text('Еда и котики!')),
        SizedBox(
            width: 200,
            child: Text(
              'vk.com/necrofairy',
              style:
                  TextStyle(color: Color.fromRGBO(0, 55, 107, 1), fontSize: 14),
            )),
      ],
    );
  }
}

class StringsData {
  final String first;
  final String second;

  StringsData(this.first, this.second);
}

class _TextInfoWidget extends StatelessWidget {
  const _TextInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final infoData = <StringsData>[
      StringsData('25', 'публикаций'),
      StringsData('5', 'подписчиков'),
      StringsData('12', 'подписок')
    ];
    final widgets = <Widget>[];
    for (var s in infoData) {
      widgets.add(SizedBox(
        width: 130,
        child: Column(
          children: [
            Text(
              s.first,
              style: const TextStyle(
                  color: Color.fromRGBO(38, 38, 38, 1),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              s.second,
              style: const TextStyle(color: Color.fromRGBO(142, 142, 142, 1)),
            )
          ],
        ),
      ));
    }
    return Row(
      children: widgets,
    );
  }
}

class _BottomButtons extends StatelessWidget {
  const _BottomButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SizedBox(
          width: 100,
          child: Align(alignment: Alignment.topLeft, child: Icon(Icons.apps)),
        ),
        SizedBox(
          width: 100,
          child: Icon(Icons.amp_stories_outlined),
        ),
        SizedBox(
          width: 100,
          child: Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.account_box_rounded)),
        )
      ],
    );
  }
}

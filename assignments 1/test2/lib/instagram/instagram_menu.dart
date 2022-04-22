import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test2/instagram/image_name.dart';

class InstagramMenu extends StatelessWidget {
  const InstagramMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: const Color.fromRGBO(255, 255, 255, 1.0),
          child: Column(
            children: const [
              _TopIcons(),
              SizedBox(
                height: 20,
              ),
              _TopMenu(),
              SizedBox(
                height: 20,
              ),
              _MiddleMenu(),
              SizedBox(
                height: 20,
              ),
              _InfoMenu(),
              SizedBox(
                height: 20,
              ),
              _BottomMenu(),
              SizedBox(
                height: 20,
              ),
              _Photos(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopIcons extends StatelessWidget {
  const _TopIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.home, size: 50),
        SizedBox(
          width: 25,
        ),
        Icon(Icons.send, size: 50),
        SizedBox(
          width: 25,
        ),
        Icon(Icons.add_box_outlined, size: 50),
        SizedBox(
          width: 25,
        ),
        Icon(Icons.access_time, size: 50),
        SizedBox(
          width: 25,
        ),
        Icon(Icons.favorite, size: 50),
      ],
    );
  }
}

class _TopMenu extends StatelessWidget {
  const _TopMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 100, height: 100, child: Image.asset(ImageName.avatar)),
        const SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Row(
              children: const [
                SizedBox(
                  width: 35,
                ),
                Text(
                  'necro_fairy',
                  style: TextStyle(fontSize: 28),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.settings,
                  size: 50,
                )
              ],
            ),
            TextButton(
              onPressed: null,
              child: const Text('Редактировать профиль'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(205, 198, 198, 1.0))),
            )
          ],
        )
      ],
    );
  }
}

class _MiddleMenu extends StatelessWidget {
  const _MiddleMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 350,
              child: Text(
                'Necrofairy',
                style: TextStyle(fontWeight: FontWeight.w600),
              )),
          Container(width: 350, child: Text('Food and cats!')),
          Container(
              width: 350,
              child: Text(
                'vk.com/necrofairy',
                style: TextStyle(color: Color.fromRGBO(71, 146, 232, 1.0)),
              )),
        ],
      ),
    );
  }
}

class StringsInfo {
  String text1;
  String text2;

  StringsInfo(this.text1, this.text2);
}

class _InfoMenu extends StatelessWidget {
  const _InfoMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final strings = [
      StringsInfo('25', 'публикаций'),
      StringsInfo('5', 'подписчиков'),
      StringsInfo('12', 'подписок'),
    ];
    final widgets = <Widget>[];
    for (var info in strings) {
      widgets.add(Container(
          width: 125,
          child: Column(
            children: [
              Text(
                info.text1,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Text(
                info.text2,
                style: TextStyle(color: Color.fromRGBO(156, 154, 154, 1.0)),
              )
            ],
          )));
    }

    return Column(
      children: [
        Container(
          width: 400,
          height: 1,
          color: Color.fromRGBO(5, 5, 5, 1.0),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [...widgets],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 400,
          height: 1,
          color: Color.fromRGBO(5, 5, 5, 1.0),
        ),
      ],
    );
  }
}

class _BottomMenu extends StatelessWidget {
  const _BottomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icons = [Icons.apps, Icons.amp_stories, Icons.account_box];
    final widgets = <Widget>[];
    for (var icon in icons) {
      widgets.add(Container(
        width: 130,
        child: Icon(
          icon,
          size: 50,
        ),
      ));
    }

    return Row(
      children: [
        ...widgets,
      ],
    );
  }
}

class _PhotoRow {
  final Image i1;
  final Image i2;
  final Image i3;

  _PhotoRow(this.i1, this.i2, this.i3);
}

class _Photos extends StatelessWidget {
  const _Photos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final images = [
      _PhotoRow(Image.asset(ImageName.cat1), Image.asset(ImageName.cat2),
          Image.asset(ImageName.cat3)),
      _PhotoRow(Image.asset(ImageName.cat4), Image.asset(ImageName.cat5),
          Image.asset(ImageName.cat6))
    ];
    final widgets = <Widget>[];
    for (var images in images) {
      widgets.add(Row(
        children: [
          Container(
            width: 130,
            height: 130,
            child: images.i1,
          ),
          Container(
            width: 1,
          ),
          Container(
            width: 130,
            height: 130,
            child: images.i2,
          ),
          Container(
            width: 1,
          ),
          Container(
            width: 130,
            height: 130,
            child: images.i3,
          ),
        ],
      ));
    }
    return Column(
      children: [
        Container(
          width: 400,
          height: 1,
          color: Colors.black,
        ),
        ...widgets,
      ],
    );
  }
}

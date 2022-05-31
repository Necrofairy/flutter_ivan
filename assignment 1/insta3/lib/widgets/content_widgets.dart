import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:insta3/widgets/images_name.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: _TopIconsMenuWidget(),
          ),
          _SeparatorWidget(),
          _MiddleMenuWidget(),
          _SeparatorWidget(),
          _MiddleInfoWidget(),
          _SeparatorWidget(),
          _BottomInfoWidget(),
          _SeparatorWidget(),
          _BottomIconsWidget(),
          _SeparatorWidget(),
          _BottomImages(),
        ],
      ),
    );
  }
}

class _TopIconsMenuWidget extends StatelessWidget {
  const _TopIconsMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icons = [
      const Icon(
        Icons.home,
        size: 50,
      ),
      const Icon(
        Icons.send,
        size: 50,
      ),
      const Icon(
        Icons.add_box_outlined,
        size: 50,
      ),
      const Icon(
        Icons.access_time_sharp,
        size: 50,
      ),
      const Icon(
        Icons.favorite,
        size: 50,
      ),
    ];

    final widgets = <Widget>[];
    for (var icon in icons) {
      widgets.add(icon);
      widgets.add(const Spacer());
    }

    return Row(
      children: [...widgets],
    );
  }
}

class _SeparatorWidget extends StatelessWidget {
  const _SeparatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.black,
    );
  }
}

class _MiddleMenuWidget extends StatelessWidget {
  const _MiddleMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(ImagesName.avatar),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    'necro_fairy',
                    style: TextStyle(color: Colors.black, fontSize: 28),
                  ),
                  SizedBox(
                    width: 10,
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
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                    side: MaterialStateProperty.all(
                        const BorderSide(color: Colors.black, width: 1))),
              )
            ],
          ),
        )
      ],
    );
  }
}

class _MiddleInfoWidget extends StatelessWidget {
  const _MiddleInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Necrofairy',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 2,
          ),
          Text('Food and cats!'),
          SizedBox(
            height: 2,
          ),
          Text(
            'vk.com/necrofairy',
            style: TextStyle(
                color: Color.fromRGBO(47, 83, 132, 1.0),
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

class _StringInfo {
  final int number;
  final String text;

  _StringInfo({required this.number, required this.text});
}

class _BottomInfoWidget extends StatelessWidget {
  const _BottomInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var numberAndString = [
      _StringInfo(number: 25, text: 'публикаций'),
      _StringInfo(number: 6, text: 'подписчиков'),
      _StringInfo(number: 13, text: 'подписок')
    ];
    var widgets = <Widget>[];
    for (var el in numberAndString) {
      widgets.add(Column(
        children: [
          Text(
            '${el.number}',
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
          Text(
            el.text,
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ));
    }
    var row = <Widget>[];
    for (var widget in widgets) {
      row.add(const Spacer());
      row.add(widget);
    }
    row.add(const Spacer());

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: row),
    );
  }
}

class _BottomIconsWidget extends StatelessWidget {
  const _BottomIconsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var icons = [
      const Icon(
        Icons.apps,
        size: 50,
      ),
      const Icon(
        Icons.amp_stories,
        size: 50,
      ),
      const Icon(
        Icons.account_box,
        size: 50,
      )
    ];
    var widget = <Widget>[];

    for (var icon in icons) {
      widget.add(const Spacer());
      widget.add(icon);
    }
    widget.add(const Spacer());

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [...widget],
      ),
    );
  }
}

class _ImageInfo {
  final Image i1;
  final Image i2;
  final Image i3;

  _ImageInfo({required this.i1, required this.i2, required this.i3});
}

class _BottomImages extends StatelessWidget {
  const _BottomImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var images = [
      _ImageInfo(
          i1: Image.asset(ImagesName.cat1),
          i2: Image.asset(ImagesName.cat2),
          i3: Image.asset(ImagesName.cat3)),
      _ImageInfo(
          i1: Image.asset(ImagesName.cat4),
          i2: Image.asset(ImagesName.cat5),
          i3: Image.asset(ImagesName.cat6))
    ];
    var widget = <Widget>[];
    for(var i in images) {
      widget.add(Row(children: [
        SizedBox(width: 100, height: 100,child: i.i1),
        const Spacer(),
        SizedBox(width: 100, height: 100,child: i.i2),
        const Spacer(),
        SizedBox(width: 100, height: 100,child: i.i3),
      ],));
    }
    return Column(
      children: [
        ...widget
      ],
    );
  }
}

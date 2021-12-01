import 'package:example/buildin_transformers.dart';
import 'package:flutter/material.dart';

import 'package:another_transformer_page_view/another_transformer_page_view.dart';

import 'package:flutter/cupertino.dart';

// 1111111 !!!!!!

void main() => runApp(MyApp());
List<Color> list = [Colors.yellow, Colors.green, Colors.blue];

List<String> images = [
  'assets/Hepburn2.jpg',
  'assets/Hepburn5.jpg',
  'assets/Hepburn4.jpg',
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  IndexController _controller;
  final List<String> _types = [
    'AccordionTransformer',
    'ThreeDTransformer',
    'ScaleAndFadeTransformer',
    'ZoomInPageTransformer',
    'ZoomOutPageTransformer',
    'DeepthPageTransformer'
  ];

  String _type;
  FixedExtentScrollController controller;

  double _viewportFraction = 1.0;

  @override
  void initState() {
    _controller = IndexController();
    _type = 'AccordionTransformer';
    controller = FixedExtentScrollController();
    super.initState();
  }

  PageTransformer getTransformer() {
    switch (_type) {
      case 'AccordionTransformer':
        return AccordionTransformer();
      case 'ThreeDTransformer':
        return ThreeDTransformer();
      case 'ScaleAndFadeTransformer':
        return ScaleAndFadeTransformer();
      case 'ZoomInPageTransformer':
        return ZoomInPageTransformer();
      case 'ZoomOutPageTransformer':
        return ZoomOutPageTransformer();
      case 'DeepthPageTransformer':
        return DeepthPageTransformer();
    }

    throw Exception('Not a type');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  _controller.previous();
                },
                child: Text('Preious'),
              ),
              SizedBox(
                width: 8.0,
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.next();
                },
                child: Text('Next'),
              ),
              SizedBox(
                width: 8.0,
              ),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return CupertinoPicker(
                            scrollController: controller,
                            itemExtent: 30.0,
                            onSelectedItemChanged: (int index) {
                              setState(() {
                                controller = FixedExtentScrollController(
                                    initialItem: index);
                                _type = _types[index];
                                if (_type == 'ScaleAndFadeTransformer') {
                                  _viewportFraction = 0.8;
                                } else {
                                  _viewportFraction = 1.0;
                                }
                              });
                            },
                            children: _types.map((t) => Text(t)).toList());
                      });
                },
                child: Text('Change Animation'),
              ),
            ],
          ),
          Expanded(
              child: SizedBox(
            child: TransformerPageView(
                loop: true,
                viewportFraction: _viewportFraction,
                controller: _controller,
                transformer: getTransformer(),
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: 3),
          ))
        ],
      ),
    );
  }
}

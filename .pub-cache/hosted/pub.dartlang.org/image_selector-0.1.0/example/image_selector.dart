library image_selector;

import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:typed_data';

class ImageSelector {
  static Future<Uint8List> fromGallery(BuildContext context) async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    Uint8List pngData;
    await showCupertinoDialog(
        context: context,
        builder: (context) {
          return _Dialog(
              image: image,
              callback: (Uint8List _pngData) {
                pngData = _pngData;
              });
        });
    return pngData;
  }
}

class _Dialog extends StatefulWidget {
  final File image;
  final Function callback;
  _Dialog({this.image, this.callback});
  @override
  _DialogState createState() => _DialogState(image: image, callback: callback);
}

class _DialogState extends State<_Dialog> {
  Function callback;
  double width;
  File image;
  double scale = 1.0;
  double previousScale;
  double startX, startY, x = 0, y = 0, previousX, previousY;
  _DialogState({this.image, this.callback});
  GlobalKey scr = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Stack(children: [
      Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(220, 0, 0, 0)),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              "Adjust image",
              style: TextStyle(color: CupertinoColors.white),
            ),
            padding: EdgeInsets.all(30),
          ),
          GestureDetector(
            child: CustomPaint(
              painter: _Box(),
              child: RepaintBoundary(
                  key: scr,
                  child: Container(
                    width: width,
                    color: CupertinoColors.black,
                    height: width,
                    child: ClipRect(
                        child: new Transform(
                            transform: new Matrix4.translationValues(x, y, 0),
                            alignment: FractionalOffset.center,
                            child: new Transform(
                                transform: new Matrix4.identity()
                                  ..scale(scale, scale),
                                alignment: FractionalOffset.center,
                                child: Image.file(
                                  image,
                                )))),
                  )),
            ),
            onScaleStart: (ScaleStartDetails details) {
              previousScale = scale;
              startX = details.focalPoint.dx;
              startY = details.focalPoint.dy;
              previousX = x;
              previousY = y;
            },
            onScaleUpdate: (ScaleUpdateDetails details) {
              setState(() {
                if (details.scale == 1) {
                  x = details.focalPoint.dx - startX + previousX;
                  y = details.focalPoint.dy - startY + previousY;
                }
                scale = previousScale * details.scale;
              });
            },
            onScaleEnd: (ScaleEndDetails details) {
              previousScale = null;
              previousX = null;
              previousY = null;
            },
          ),
          Container(
              padding: EdgeInsets.all(50),
              child: CupertinoButton.filled(
                  child: Text("Next"),
                  onPressed: () async {
                    RenderRepaintBoundary boundary =
                        scr.currentContext.findRenderObject();
                    ui.Image image = await boundary.toImage();
                    ByteData byteData =
                        await image.toByteData(format: ui.ImageByteFormat.png);
                    Uint8List pngBytes = byteData.buffer.asUint8List();
                    callback(pngBytes);
                    Navigator.of(context, rootNavigator: true).pop();
                  }))
        ],
      )
    ]);
  }
}

class _Box extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = Paint();
    paint.strokeWidth = 3;
    paint.color = Color.fromARGB(200, 255, 255, 255);
    canvas.drawLine(Offset(0, 0), Offset(0, size.height), paint);
    canvas.drawLine(
        Offset(0, size.height), Offset(size.width, size.height), paint);
    canvas.drawLine(
        Offset(size.width, size.height), Offset(size.width, 0), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(0, 0), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

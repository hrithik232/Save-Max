import 'package:flutter/cupertino.dart';
import 'dart:typed_data';
import 'image_selector.dart';

void main() async {
    return runApp(CupertinoApp(home: Main()));
}

class Main extends StatefulWidget {
    @override
    MainState createState() => MainState();
}

class MainState extends State<Main> {
    Image image;
    @override
    Widget build(BuildContext context) {
        return CupertinoPageScaffold(
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoButton.filled(
                        child: Text("Select Image"),
                        onPressed: () async{
                            Uint8List pngBytes = await ImageSelector.fromGallery(context);
                            setState(() {
                                image = Image.memory(
                                    pngBytes,
                                    width: 200,
                                    height: 200,
                                );
                            });
                        }
                    ),
                    Container(
                      margin: EdgeInsets.all(50),
                        child: image!=null?image:Text("No image selected")
                    )
                ]
            )
        ));
    }
}
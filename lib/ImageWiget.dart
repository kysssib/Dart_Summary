import 'package:flutter/material.dart';

class ImageWidgetApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _ImageWidgetApp();
  }
}

class _ImageWidgetApp extends State<ImageWidgetApp>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Image Widget')),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(radius: 50.0, backgroundImage: AssetImage('image/20191123.png'),),
              //Image.asset('image/20191123.png',width: 150,),
              Text('YuSung', style: TextStyle(fontFamily: 'NanumGothic', fontSize: 30, color: Colors.blue))
            ],
          )
        )
      )
    );
  }
}
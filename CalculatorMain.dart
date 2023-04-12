import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Widget Example';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget {
  @override
  _WidgetExampleState createState() => _WidgetExampleState();
}

class _WidgetExampleState extends State<WidgetApp> {
  String sum = '';
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();
  List _buttonList = ['ADD','SUB','MUL','DIV'];
  List<DropdownMenuItem<String>> _dropdownMenuItems = new List.empty(growable: true);
  String? _buttonText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Example')
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(15),
                child: Text('flutter'),),
              Padding(padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(keyboardType: TextInputType.number, controller: value1),),
              Padding(padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(keyboardType: TextInputType.number, controller: value2),),
              Padding(padding: EdgeInsets.all(15),
                  child:ElevatedButton(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.add),
                        Text('$_buttonText'),
                      ],
                    ),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)),
                    onPressed: () {
                      setState(() {
                        var value1Int = double.parse(value1.value.text);
                        var value2Int = double.parse(value2.value.text);
                        var result;

                        if(_buttonText == 'ADD') {
                          result = value1Int + value2Int;
                        } else if (_buttonText == 'SUB') {
                          result = value1Int - value2Int;
                        } else if (_buttonText == 'MUL') {
                          result = value1Int * value2Int;
                        }  else{
                          result = value1Int / value2Int;
                        }
                        sum = '$result';
                      });
                    },)
              ),
              Padding(padding: EdgeInsets.all(15),
                child: Text('Result : $sum',style: TextStyle(fontSize: 20))),
              Padding(padding: EdgeInsets.all(15),
                child: DropdownButton(items: null, onChanged: null),),
              Padding(padding: EdgeInsets.all(15),
                child:  DropdownButton(items: _dropdownMenuItems, onChanged: (String? value){
                  setState(() {
                    _buttonText = value;
                  });
                }, value: _buttonText,))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    for(var item in _buttonList) {
      _dropdownMenuItems.add(DropdownMenuItem(value: item, child: Text(item)));
      _buttonText = _dropdownMenuItems[0].value;
    }
  }
}


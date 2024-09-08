import 'package:calculadora/components/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/display.dart';
import '../components/keyboard.dart';

class CalculatorPage extends StatefulWidget {

  @override
  State<CalculatorPage> createState() => _CalculatorState();
}

class _CalculatorState extends State<CalculatorPage> {

  final Memory memory = Memory();

  _onPressed(String command){
    setState(() {
      memory.applyCommand(command);
      print(memory.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    return MaterialApp(
      home: Column(
        children: <Widget>[
          //Display('1,258.2', '6,291÷5'),
          Display(memory: memory),
          Keyboard(_onPressed),
          //FontLoaderExample()
        ],
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
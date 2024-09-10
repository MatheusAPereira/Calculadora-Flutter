import 'package:calculadora/components/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/display.dart';
import '../components/keyboard.dart';

class CalculatorPage extends StatefulWidget {

  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorState();
}

class _CalculatorState extends State<CalculatorPage> {

  final Memory memory = Memory();

  _onPressed(String command){
    setState(() {
      memory.applyCommand(command);
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
          Display(memory: memory),
          Keyboard(_onPressed),
        ],
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


import 'package:calculadora/components/calculator.dart';

class Memory{

  static final commands = ['C', '±', '⌫', '='];
  static final operations = ['÷', '×', '−', '+'];
  static final numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  Calculator calculator = Calculator();

  void applyCommand(String command){
    if(!commands.contains(command)){
      if(Wrapper.initMode == true){
        Wrapper.value = command;
        Wrapper.initMode = false;
      } else if (Wrapper.resultMode && Memory.operations.contains(command)){
        Wrapper.value += command;
        Wrapper.resultMode = false;
      } else if (Wrapper.resultMode && Memory.numbers.contains(command)){
        Wrapper.value == command;
      } else {
        Wrapper.value += command;
      }
    } else {
      switch (command) {
        case 'C':
          _clear();
          break;
        case '±':
          break;
        case '⌫':
          break;
        case '=':
          String result = calculator.calc(Wrapper.value);
          Wrapper.value = result;
          Wrapper.resultMode = true;
          break;
        Default:
        break;
      }
    }
  }

  _onCommand(command){
    if(Wrapper.initMode == true){
        Wrapper.value = command;
        Wrapper.initMode = false;
      } else if (Wrapper.resultMode && Memory.operations.contains(command)){
        Wrapper.value += command;
        Wrapper.resultMode = false;
      } else if (Wrapper.resultMode && Memory.numbers.contains(command)){
        Wrapper.value == command;
      } else {
        Wrapper.value += command;
      }
  }

  _clear(){
    Wrapper.value = '0';
    Wrapper.initMode = true;
  }

  String get value{
      return Wrapper.value;
  }

}

class Wrapper{
  static bool initMode = true;
  static String value = '0';
  static bool resultMode = false;
}
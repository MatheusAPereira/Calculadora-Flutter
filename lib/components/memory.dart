

import 'package:calculadora/components/calculator.dart';

class Memory{

  final commands = ['C', '±', '⌫', '='];
  final numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  Calculator calculator = Calculator();

  void applyCommand(String command){
    if(numbers.contains(command) & Wrapper.resultMode){
      Wrapper.value = command;
      Wrapper.resultMode = false;
    } else if (commands.contains(command)){

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
          print('cheguei!');
          break;
      }
    } else {
      if(Wrapper.initMode == true){
        Wrapper.value = command;
        Wrapper.initMode = false;
      } else {
        Wrapper.value += command;
      }
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
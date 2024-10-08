import 'package:calculadora/components/calculator.dart';

class Memory{

  static final commands = ['C', '±', '⌫', '='];
  static final operations = ['÷', '×', '−', '+'];
  static final numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  static final toDo = ['%'];
  Calculator calculator = Calculator();

  void applyCommand(String command){
    if(toDo.contains(command)){
      command = '';
    }
    if(!commands.contains(command)){
      if(Wrapper.initMode == true){
        Wrapper.value = command;
        Wrapper.initMode = false;
      } else if (Wrapper.resultMode && Memory.operations.contains(command)){
        Wrapper.value += command;
        Wrapper.resultMode = false;
      } else if (Wrapper.resultMode && Memory.numbers.contains(command)){
        Wrapper.value = command;
        Wrapper.resultMode = false;
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
          _delete();
          break;
        case '=':
          String result = calculator.calc(Wrapper.value);
          Wrapper.lastValue = value;
          Wrapper.value = _doubleToIntString(result);
          Wrapper.resultMode = true;
      }
    }
  }

  String _doubleToIntString(String result){
    if(result.contains('.')){
      double rDouble = double.parse(result);
      int rInt = rDouble.toInt();
      return rInt.toString();
    }
    return result;
  }

  _clear(){
    Wrapper.value = '0';
    Wrapper.lastValue = '';
    Wrapper.initMode = true;
  }

  _delete(){
    int length = Wrapper.value.length;
    if(length > 1){
      Wrapper.value = Wrapper.value.substring(0, length - 1);
      Wrapper.resultMode = false;
    } else {
      Wrapper.value = '0';
      Wrapper.lastValue = '';
      Wrapper.initMode = true;
    }
  }

  String get value{
      return Wrapper.value;
  }

  String get lastValue{
    return Wrapper.lastValue;
  }

}

class Wrapper{
  static bool initMode = true;
  static String value = '0';
  static String lastValue = '';
  static bool resultMode = false;
  
}
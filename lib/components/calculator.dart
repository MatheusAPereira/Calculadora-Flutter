class Calculator {

  String calc(String expression){

    String expressao = expression;

    double resultado;
    
    try {
      resultado = _calcular(expressao);
    } catch (e) {
      throw Exception('Expressão inválida');
    }
    return resultado.toString();
  }

  double _calcular(String expressao) {
  List<String> tokens = [];

  for (var i=0; i < expressao.length && i >= 0;){
    if(_testarDigito(expressao[i])){
      String digitos = _unirDigitos(expressao, i);
      tokens.add(digitos);
      i += digitos.length; 
    } else {
      tokens.add(expressao[i]);
      i++;
    }
  }

  List<String> posfixa = _converterParaPosfixa(tokens);

  return _avaliarPosfixa(posfixa);
}

List<String> _converterParaPosfixa(List<String> tokens) {
  List<String> posfixa = [];
  List<String> pilha = [];

  for (String token in tokens) {
    if (token.isEmpty) continue;
    if (token == '÷' || token == '×' || token == '−'){
      token = _trocarOperador(token);
    }
    if (token == '+' || token == '-' || token == '*' || token == '/') {
      while (pilha.isNotEmpty && _precedencia(pilha.last) >= _precedencia(token)) {
        posfixa.add(pilha.removeLast());
      }
      pilha.add(token);
    } else if (token == '(') {
      pilha.add(token);
    } else if (token == ')') {
      while (pilha.isNotEmpty && pilha.last != '(') {
        posfixa.add(pilha.removeLast());
      }
      pilha.removeLast();
    } else {
      posfixa.add(token);
    }
  }

  while (pilha.isNotEmpty) {
    posfixa.add(pilha.removeLast());
  }

  return posfixa;
}

int _precedencia(String operador) {
  switch (operador) {
    case '+':
    case '-':
      return 1;
    case '*':
    case '/':
      return 2;
    default:
      return 0;
  }
}

double _avaliarPosfixa(List<String> posfixa) {
  List<double> pilha = [];

  for (String token in posfixa) {
    if (token == '+' || token == '-' || token == '*' || token == '/') {
      if (pilha.length < 2) {
        throw Exception("Expressão inválida");
      }
      double num2 = pilha.removeLast();
      double num1 = pilha.removeLast();

      switch (token) {
        case '+':
          pilha.add(num1 + num2);
          break;
        case '-':
          pilha.add(num1 - num2);
          break;
        case '*':
          pilha.add(num1 * num2);
          break;
        case '/':
          if (num2 != 0) {
            pilha.add(num1 / num2);
          } else {
            throw Exception('Divisão por zero');
          }
          break;
      }
    } else {
      pilha.add(double.parse(token));
    }
  }

  return pilha.last;
}

bool _testarDigito(String s) {
 return s.codeUnitAt(0) >= 48 && s.codeUnitAt(0) <= 57;
}

String _unirDigitos(String expressao, int i){
 var resultado = '';
 while(i < expressao.length && _testarDigito(expressao[i])){
 resultado += expressao[i];
 i++;
 }
 return resultado;
}

String _trocarOperador(String token){

  switch (token) {
    case '÷':
      return '/';
    case '×':
     return '*';
    case '−':
      return '-';
  }

  return token;
}
}
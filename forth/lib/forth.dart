import 'package:collection/collection.dart';

class Forth {
  var stack = <int>[];
  final emptyStackException = Exception('Stack empty');
  final List<String> arithmetics = ['+', '-', '*', '/'];
  final List<String> manipulations = ['DUP', 'DROP', 'SWAP', 'OVER'];
  final customDefinitions = <String, String>{};

  void evaluate(String sentence) {
    final commands = sentence.trim().split(' ');
    final operations = commands
        .map((operator) => operator.toUpperCase())
        .map(
          (operator) {
            if (!commands.isValidDefinition &&
                customDefinitions.containsKey(operator)) {
              return customDefinitions[operator]!;
            }
            return operator;
          },
        )
        .join(' ')
        .split(' ')
        .toList();

    if (operations.isValidDefinition) {
      if (operations.length >= 4 && operations.elementAt(1).isNumeric)
        throw Exception('Invalid definition');

      setCustomDefinition(operations);
      return;
    }

    final validCommand = operations.every((operator) {
      return operator.isNumeric ||
          arithmetics.contains(operator) ||
          manipulations.contains(operator);
    });

    if (!validCommand) throw Exception('Unknown command');

    final numbers = operations.where((operator) => operator.isNumeric);
    final arithmeticAndManipulations = operations.where(
      (operator) =>
          arithmetics.contains(operator) || manipulations.contains(operator),
    );

    operations.forEachIndexed((index, operator) {
      if (((numbers.length <= 1 && arithmetics.contains(operator)) ||
              (numbers.length < 1 && manipulations.contains(operator))) &&
          arithmeticAndManipulations.length > 0) throw emptyStackException;

      if (operator.isNumeric) stack.add(operator.toInt);

      if (arithmetics.contains(operator)) {
        try {
          final arithmeticResult = stack.reduce(
            (value, number) {
              return value.performArithmetic(
                number,
                arithmetics.firstWhere((element) => element == operator),
              );
            },
          );
          stack = <int>[arithmeticResult];
        } catch (e) {
          throw e;
        }
      }
      if (manipulations.contains(operator))
        switch (operator) {
          case 'DUP':
            stack.add(stack.last);
            break;
          case 'DROP':
            stack.removeLast();
            break;
          case 'SWAP':
            if (stack.length < 2) throw emptyStackException;
            final removedValue = stack.removeAt(stack.length - 1);
            stack.insert(stack.length - 1, removedValue);
            break;
          case 'OVER':
            if (stack.length < 2) throw emptyStackException;
            stack.add(stack.elementAt(stack.length - 2));
            break;
        }
    });
  }

  void setCustomDefinition(List<String> operations) {
    final definitionOperations = operations.definitionOperations.split(' ').map(
      (operation) {
        if (customDefinitions.containsKey(operation)) {
          return customDefinitions[operation]!;
        }
        return operation;
      },
    ).join(' ');
    customDefinitions.update(
      operations[1],
      (_) => definitionOperations,
      ifAbsent: () => definitionOperations,
    );
  }
}

extension on String {
  bool get isNumeric => num.tryParse(this) != null;

  int get toInt => isNumeric ? int.parse(this) : 0;
}

extension on List<String> {
  bool get isValidDefinition => first == ':' && last == ';';

  String get definitionOperations => sublist(2, length - 1).join(' ');
}

extension on int {
  int performArithmetic(int number, String operation) {
    switch (operation) {
      case '+':
        return this + number;
      case '-':
        return this - number;
      case '*':
        return (this * number).toInt();
      case '/':
        if (number == 0) throw Exception('Division by zero');
        return this ~/ number;
      default:
        return 0;
    }
  }
}

enum CalcButtonType {
  zero,
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  plus,
  minus,
  equal,
  clear
}

extension CalcButtonTypeActions on CalcButtonType {
  String get displayValue {
    switch (this) {
      case CalcButtonType.zero:
        return "0";

      case CalcButtonType.one:
        return "1";

      case CalcButtonType.two:
        return "2";

      case CalcButtonType.three:
        return "3";

      case CalcButtonType.four:
        return "4";

      case CalcButtonType.five:
        return "5";

      case CalcButtonType.six:
        return "6";

      case CalcButtonType.seven:
        return "7";

      case CalcButtonType.eight:
        return "8";

      case CalcButtonType.nine:
        return "9";

      case CalcButtonType.equal:
        return "=";

      case CalcButtonType.plus:
        return "+";

      case CalcButtonType.minus:
        return "-";

      case CalcButtonType.clear:
        return "clear";

      default:
        return 'null';
    }
  }

  int? get integerValue {
    switch (this) {
      case CalcButtonType.zero:
        return 0;

      case CalcButtonType.one:
        return 1;

      case CalcButtonType.two:
        return 2;

      case CalcButtonType.three:
        return 3;

      case CalcButtonType.four:
        return 4;

      case CalcButtonType.five:
        return 5;

      case CalcButtonType.six:
        return 6;

      case CalcButtonType.seven:
        return 7;

      case CalcButtonType.eight:
        return 8;

      case CalcButtonType.nine:
        return 9;

      default:
        return null;
    }
  }
}

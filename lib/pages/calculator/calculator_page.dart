
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled6/base/widgets/custom_app_bar.dart';
import 'package:untitled6/pages/calculator/widget/calc_button.dart';

import 'calc_button_type.dart';

// num + num + num * num


class CalculatorPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _CalculatorPage();
  }
}

class _CalculatorPage extends State<CalculatorPage> {

  int firstValue = 0;
  int secondValue = 0;
  CalcButtonType? operation;

  String viewCalc = "";
  int viewCalcInteger = 0;

  void clearCalc({bool first = true, bool second = true, bool operator = true, bool result = true}) {
    if (first) {
      firstValue = 0;
    }

    if (second) {
      secondValue = 0;
    }

    if (operator) {
      operation = null;
    }

    if (result) {
      viewCalc = "0";
    }
    return;
  }

  void equal() {
    switch (operation) {
      case CalcButtonType.plus:
        viewCalc = (firstValue + secondValue).toString();
        viewCalcInteger = firstValue + secondValue;
        break;

      case CalcButtonType.minus:
        viewCalc = (firstValue - secondValue).toString();
        viewCalcInteger = firstValue - secondValue;
        break;
    }

    firstValue = viewCalcInteger;
    clearCalc(first: false, result: false);
    return;
  }

  void manageNumBuilderAndOperators(CalcButtonType calcAction) {
    // Operator is appear
    if (calcAction.integerValue == null) {
      operation = calcAction;
    } else if (operation == null) {
      firstValue = (firstValue * 10) + calcAction.integerValue!;
    } else {
      secondValue = (secondValue * 10) + calcAction.integerValue!;
      return;
    }
  }

  void onButtonTap(CalcButtonType calcAction) {

    setState(() {
    });

    if (calcAction == CalcButtonType.clear) {
      return clearCalc();
    }

    if (calcAction == CalcButtonType.equal) {
      return equal();
    }

    manageNumBuilderAndOperators(calcAction);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Calculator"),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.black87,
          child: Column(
            children: [
              Text("Hello calculator"),
              Container(
                width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2)
                  ),
                  child: Center(
                      child: Text(viewCalc,
                        style: const TextStyle(
                            fontSize: 45,
                            color: Colors.grey
                        ),)
                  )
              ),
              Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("$firstValue${operation == null ? "" : "   ""${operation!.displayValue}${secondValue == 0 ? "" : "   $secondValue"}"}",
                        style: const TextStyle(
                            fontSize: 45,
                            color: Colors.grey
                        ),
                      ),
                    ],
                  )
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CalcButton(CalcButtonType.one, onButtonTap),
                  CalcButton(CalcButtonType.two, onButtonTap),
                  CalcButton(CalcButtonType.three, onButtonTap),
                  CalcButton(CalcButtonType.plus, onButtonTap),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CalcButton(CalcButtonType.four, onButtonTap),
                  CalcButton(CalcButtonType.five, onButtonTap),
                  CalcButton(CalcButtonType.six, onButtonTap),
                  CalcButton(CalcButtonType.minus, onButtonTap),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CalcButton(CalcButtonType.seven, onButtonTap),
                  CalcButton(CalcButtonType.eight, onButtonTap),
                  CalcButton(CalcButtonType.nine, onButtonTap),
                  CalcButton(CalcButtonType.equal, onButtonTap),
                ],
              ),
              CalcButton(CalcButtonType.zero, onButtonTap),
              CalcButton(CalcButtonType.clear, onButtonTap),
            ],
          ),
        ),
      ),
    );
  }
}
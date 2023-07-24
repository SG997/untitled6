import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../calc_button_type.dart';

class CalcButton extends StatelessWidget {
  CalcButtonType actionType;
  Function(CalcButtonType) onTap;

  CalcButton(this.actionType, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap(actionType);
      },
      child: Container(
        width: 80,
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.white70, Colors.grey], // Define your gradient colors here
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.green),

        child: Center(
            child: Text(actionType.displayValue,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
        )
        ),
      ),
    );
  }
}

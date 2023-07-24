import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';

import '../calculator/calculator_page.dart';
import '../nobel_prize/nobel_prize_page.dart';

class RootPgae extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RootPgae();
  }
}

class _RootPgae extends State<RootPgae> {

  void goToCalcPage() {
    Get.to(CalculatorPage());
  }

  void goToNobelPrizeApi() {
    Get.to(NobelPrizePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              InkWell(
                onTap: ()=>{
                  goToNobelPrizeApi()
                },
                child: RootButton("assets/lottie/nobel_animation.json", "Nobel prize countries")
              ),

              InkWell(
                onTap: ()=>{
                  goToCalcPage()
                },
                child: RootButton("assets/lottie/calculator.json", "Calculator")
              )
            ]
        ),
      ),
    ));
  }
}

class RootButton extends StatelessWidget {
  String filePath;
  String text;

  RootButton(this.filePath, this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(30),
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Column(
          children: [

            Container(
                width: 80,
                child: Lottie.asset(
                    filePath
                )
            ),
            Text(text,
              style: TextStyle(
                  fontSize: 30
              ),),
          ],
        ),
      ),
    );
  }

}

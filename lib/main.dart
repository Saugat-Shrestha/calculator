import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String equation = '0';
  String result = " 0";
  String expression = "";
  bottonPressed(TextBtn) {
    setState(() {
      if (TextBtn == 'AC') {
        equation = "0";
        result = "0";
      } else if (TextBtn == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = '0';
        }
      } else if (TextBtn == "=") {
        expression = equation;

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          "error";
        }
      } else {
        if (equation == '0') {
          equation = TextBtn;
        } else {
          equation = equation + TextBtn;
        }
      }
    });
  }

  Widget calbtn(
    String TextBtn,
    Color backColor,
    double btnWidth,
    Color btnColor,
  ) {
    return InkWell(
      onTap: () {
        bottonPressed(TextBtn);
      },
      child: Container(
        width: btnWidth,
        alignment: Alignment.center,
        height: 80,
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          TextBtn,
          style: TextStyle(color: btnColor, fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(8)),
        centerTitle: true,
        title: Text("Calculator"),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              height: 80,
              width: double.infinity,
              color: Colors.black,
              child: Text(
                equation,
                style: TextStyle(
                    fontSize: 38,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerRight,
              height: 100,
              width: double.infinity,
              color: Colors.black,
              child: Text(
                result,
                style: TextStyle(
                    fontSize: 38,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      calbtn("AC", Colors.orange, 80, Colors.white),
                      calbtn("-", Colors.white10, 80, Colors.white),
                      calbtn("/", Colors.white10, 80, Colors.white),
                      calbtn("⌫", Colors.white10, 80, Colors.white),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      calbtn("1", Colors.red, 80, Colors.white),
                      calbtn("2", Colors.red, 80, Colors.white),
                      calbtn("3", Colors.red, 80, Colors.white),
                      calbtn("*", Colors.white10, 80, Colors.white),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      calbtn("4", Colors.red, 80, Colors.white),
                      calbtn("5", Colors.red, 80, Colors.white),
                      calbtn("6", Colors.red, 80, Colors.white),
                      calbtn("+", Colors.white10, 80, Colors.white),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      calbtn("7", Colors.red, 80, Colors.white),
                      calbtn("8", Colors.red, 80, Colors.white),
                      calbtn("9", Colors.red, 80, Colors.white),
                      calbtn("%", Colors.white10, 80, Colors.white),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      calbtn("0", Colors.red, 190, Colors.white),
                      calbtn(".", Colors.red, 80, Colors.white),
                      calbtn("=", Colors.white10, 80, Colors.white),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

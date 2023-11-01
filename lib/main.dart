import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  String equation = "0";
  String result = "0";
  String expression = "";
  buttonPresed(Txt) {
    setState(() {
      if (Txt == 'AC') {
        equation = '0';
        result = '0';
      } else if (Txt == '⌫') {
        equation = equation.substring(0, equation.length - 1);

        if (equation == '') {
          equation = '0';
        }
      } else if (Txt == '=') {
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('÷', '+');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          'Error';
        }
      } else {
        if (equation == '0') {
          equation = Txt;
        } else
          equation = equation + Txt;
      }
    });
  }

  //widget
  Widget CalBtn(
    String Txt,
    Color txtbar,
    double btnwidth,
    Color btnColor,
  ) {
    return InkWell(
      onTap: () {
        buttonPresed(Txt);
      },
      child: Container(
          alignment: Alignment.center,
          width: btnwidth,
          height: 80,
          decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            Txt,
            style: TextStyle(
              color: txtbar,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent[100],
        title: Text("Calculator"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              alignment: Alignment.centerRight,
              color: Colors.black,
              child: Text(
                equation,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              width: double.infinity,
              alignment: Alignment.centerRight,
              color: Colors.black,
              child: Text(
                result,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
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
                      CalBtn("AC", Colors.white, 80,
                          Colors.deepOrangeAccent[100]!),
                      CalBtn(
                          "%", Colors.white, 80, Colors.deepOrangeAccent[100]!),
                      CalBtn(
                          "÷", Colors.white, 80, Colors.deepOrangeAccent[100]!),
                      CalBtn(
                          "⌫", Colors.white, 80, Colors.deepOrangeAccent[100]!),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CalBtn("7", Colors.white, 80, Colors.white10!),
                      CalBtn("8", Colors.white, 80, Colors.white10!),
                      CalBtn("9", Colors.white, 80, Colors.white10!),
                      CalBtn(
                          "*", Colors.white, 80, Colors.deepOrangeAccent[100]!),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CalBtn("4", Colors.white, 80, Colors.white10!),
                      CalBtn("5", Colors.white, 80, Colors.white10!),
                      CalBtn("6", Colors.white, 80, Colors.white10!),
                      CalBtn(
                          "-", Colors.white, 80, Colors.deepOrangeAccent[100]!),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CalBtn("1", Colors.white, 80, Colors.white10!),
                      CalBtn("2", Colors.white, 80, Colors.white10!),
                      CalBtn("3", Colors.white, 80, Colors.white10!),
                      CalBtn(
                          "+", Colors.white, 80, Colors.deepOrangeAccent[100]!),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CalBtn("0", Colors.white, 180, Colors.white10!),
                      CalBtn("9", Colors.white, 80, Colors.white10!),
                      CalBtn(
                          "=", Colors.white, 80, Colors.deepOrangeAccent[100]!),
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

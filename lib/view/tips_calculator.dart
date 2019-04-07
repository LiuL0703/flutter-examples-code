import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  double billAmount;
  double tipPercentage;
  double total;
  double calculatedTip;

  void initState(){
    super.initState();
    billAmount = 0.0;
    tipPercentage = 0.0;
    total = 0.0;
    calculatedTip = 0.0;
  }

  _saveBillAmount(String value){
    setState(() {
      billAmount = double.parse(value) ?? 0.0;
    });
  }
  _saveTipPercentage(String value){
    setState(() {
      tipPercentage = double.parse(value) ?? 0.0;
    });
  }

  _calculateTotal(){
    setState(() {
      calculatedTip = billAmount*tipPercentage/100.0;
      total = calculatedTip+billAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tip Calculator"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(labelText: "Bill amount(\$)"),
              onChanged: (String value){
                _saveBillAmount(value);
              },
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(labelText: "Tip %", hintText: "15"),
              onChanged: (String value){
                _saveTipPercentage(value);
              },
            ),
            new RaisedButton(
              child: new Text("Calculate"),
              onPressed: (){
                _calculateTotal();
                showDialog(context: context,builder: (BuildContext context){
                  return new AlertDialog(
                    content: new Text("Tip: \$$calculatedTip \n"
                        "Total: \$$total")
                  );
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
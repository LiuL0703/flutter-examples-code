import 'package:flutter/material.dart';

class UsingStepper extends StatefulWidget{
  @override
  UsingStepperState createState()=> new UsingStepperState();
}

class UsingStepperState extends State<UsingStepper>{
  int current_step = 0;
  List<Step> my_steps = [
    new Step(
      title: new Text('第一步'),
      // content 可以是任何widget
      content: new Text('☝️☝️☝️'),
      isActive: true),
    new Step(
      title: new Text('第二步'),
      content: new Text('👂👂👂'),
      state: StepState.editing,
      isActive: true),
    new Step(
      title: new Text('第三步'),
      content: new Text('☂️☂️☂️'),
      isActive: true
    )
  ];


  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Using Stepper'),
      ),
      body: new Container(
        child: new Stepper(
          currentStep: this.current_step,
          steps: my_steps,
          type: StepperType.vertical,
          onStepTapped: (step){
            setState(() {
              current_step = step;
            });
            // print("onStepTapped: "+step.toString());
          },
          onStepCancel: (){
            setState(() {
              current_step = current_step > 0 ? current_step - 1 : 0;
            });
            // print("onStepCancel: "+ current_step.toString());
          },
          onStepContinue: (){
            setState(() {
              current_step = current_step < my_steps.length - 1 
                ? current_step + 1 : 0;
            });
            // print("onStepContinue: "+ current_step.toString());
          },
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var result = "";
  var bgColor = const Color.fromARGB(255, 165, 182, 241);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 65, 53, 206),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: const Text(
                'Your BMI Calculator ;)',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.black),
              ),
            ),
          ),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'BMI Range for healthy person is 18 to 25.',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  TextField(
                    controller: wtController,
                    decoration: const InputDecoration(
                      label: Text(
                        'Enter your weight in kgs',
                      ),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: const InputDecoration(
                      label: Text(
                        'Enter your height in Feet',
                      ),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: inchController,
                    decoration: const InputDecoration(
                      label: Text('Enter your height in Inches'),
                      prefix: Icon(Icons.height),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inchController.text.toString();

                        if (wt != "" && ft != "" && inch != "") {
                          // BMI Calc

                          var iWt = int.parse(wt);
                          var iFt = int.parse(ft);
                          var iInch = int.parse(inch);

                          var tInch = (iFt * 12) + iInch;
                          var tM = tInch * 2.54 / 100;
                          var bmi = iWt / (tM * tM);
                          var msg = "";

                          if (bmi > 25) {
                            msg = "You are overweight";
                            bgColor = const Color.fromARGB(255, 215, 63, 52);
                          } else if (bmi < 18) {
                            msg = "You are underweight";
                            bgColor = const Color.fromARGB(255, 219, 209, 68);
                          } else {
                            msg = "Your weight is normal.";
                            bgColor = const Color.fromARGB(255, 75, 194, 79);
                          }
                          setState(() {
                            result =
                                "$msg \n Your BMI is :${bmi.toStringAsFixed(2)}";
                          });
                        } else {
                          setState(() {
                            result = "Please fill all the required blanks";
                          });
                        }
                      },
                      child: const Text(
                        'Calculate',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      )),
                  const SizedBox(
                    height: 11,
                  ),
                  Text(
                    result,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

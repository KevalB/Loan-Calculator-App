import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:practical_4/screens/res_screen.dart';
import 'dart:math' as math;

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final principalController = TextEditingController();
  final interestController = TextEditingController();
  int selectedYears = 1;
  int selectedMonths = 0;
  bool isTenureSelectionVisible = false;

  @override
  void dispose() {
    principalController.dispose();
    interestController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Color textColor = Colors.black; // Customize the color as needed
    Color secondButtonColor = Colors.white; // Customize the color as needed
    Color buttonColor = Colors.blue; // Customize the color as needed

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Loan Calculator',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Principal',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: principalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: InputBorder.none),
            ),
            SizedBox(height: 16.0),
            Text(
              'Interest (percentage)',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: interestController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: InputBorder.none),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Text(
                  'Loan Tenure',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      '$selectedYears years $selectedMonths months',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isTenureSelectionVisible = !isTenureSelectionVisible;
                        });
                      },
                      child: Icon(
                        isTenureSelectionVisible
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Visibility(
              visible: isTenureSelectionVisible,
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.025,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Years",
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.01,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 0, right: 0),
                                decoration: BoxDecoration(
                                  color: secondButtonColor,
                                  border: Border.all(
                                    color: textColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: NumberPicker(
                                  itemHeight: screenHeight * 0.03,
                                  itemWidth: screenWidth * 0.17,
                                  textStyle: TextStyle(color: textColor),
                                  selectedTextStyle: TextStyle(
                                    color: buttonColor,
                                    fontSize: 27,
                                  ),
                                  value: selectedYears,
                                  minValue: 0,
                                  maxValue: 31,
                                  onChanged: (value) =>
                                      setState(() => selectedYears = value),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Months",
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.01,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 0, right: 0),
                                decoration: BoxDecoration(
                                  color: secondButtonColor,
                                  border: Border.all(
                                    color: textColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: NumberPicker(
                                  itemHeight: screenHeight * 0.03,
                                  itemWidth: screenWidth * 0.17,
                                  textStyle: TextStyle(color: textColor),
                                  selectedTextStyle: TextStyle(
                                    color: buttonColor,
                                    fontSize: 27,
                                  ),
                                  value: selectedMonths,
                                  minValue: 0,
                                  maxValue: 11,
                                  onChanged: (value) =>
                                      setState(() => selectedMonths = value),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                ],
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Your navigation logic here
                  double principalAmount =
                      double.tryParse(principalController.text) ?? 0;
                  double interestRate =
                      double.tryParse(interestController.text) ?? 0;

                  double monthlyInterestRate = (interestRate / 12) / 100;
                  int totalMonths = (selectedYears * 12) + selectedMonths;

                  if (principalAmount > 0 && interestRate > 0) {
                    double emi = principalAmount *
                        (monthlyInterestRate *
                            math.pow(1 + monthlyInterestRate, totalMonths)) /
                        (math.pow(1 + monthlyInterestRate, totalMonths) - 1);

                    double totalPayment = emi * totalMonths;
                    double totalPrincipal = principalAmount;
                    double totalInterest = totalPayment - totalPrincipal;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          emi: emi,
                          totalPayment: totalPayment,
                          principal: totalPrincipal,
                          interestRate: interestRate,
                          tenureYears: selectedYears,
                          tenureMonths: selectedMonths,
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Light orange color
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  minimumSize: Size(double.infinity, 50.0),
                ),
                child: Text(
                  'Calculate',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

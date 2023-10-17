import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final double emi;
  final double totalPayment;
  final double principal;
  final double interestRate;
  final int tenureYears;
  final int tenureMonths;

  const ResultScreen({
    required this.emi,
    required this.totalPayment,
    required this.principal,
    required this.interestRate,
    required this.tenureYears,
    required this.tenureMonths,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    // Calculate the ratio of principal and interest
    double principalRatio = widget.principal / widget.totalPayment;
    double interestRatio =
        (widget.totalPayment - widget.principal) / widget.totalPayment;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Result',
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
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 232, 231, 231),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      'EMI',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.020,
                    ),
                    Text(
                      '${widget.tenureYears} years ${widget.tenureMonths} months',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.020,
                    ),
                    Text(
                      '₹ ${widget.emi.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 30, color: Colors.orange),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.050,
                    ),
                    Text(
                      'Total payment',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text('₹ ${widget.totalPayment.toStringAsFixed(2)}'),
                    // Total amount line with fixed length, variable segments for principal and interest
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 2,
                          color: Colors.grey, // Fixed gray background
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 2,
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width *
                                    0.2 *
                                    principalRatio,
                                height: 2,
                                color: Colors.green,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width *
                                    0.1 *
                                    interestRatio,
                                height: 2,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.050,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.blue,
                              size: 10,
                            ),
                            Text(
                              'Total principal',
                              style: TextStyle(fontSize: 15),
                            ),
                            Text('₹ ${widget.principal.toStringAsFixed(2)}'),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.circle, color: Colors.orange, size: 10),
                            Text(
                              'Total interest',
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              '₹ ${(widget.totalPayment - widget.principal).toStringAsFixed(2)}',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 150, // Set your desired width
                    height: 60, // Set your desired height
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle the Stats button action
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      child:
                          Text('Stats', style: TextStyle(color: Colors.black)),
                    ),
                  ),
                  Container(
                    width: 150, // Set your desired width
                    height: 60, // Set your desired height
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle the Share
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.deepOrange),
                      ),
                      child:
                          Text('Share', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

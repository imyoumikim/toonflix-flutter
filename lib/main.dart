import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());  // MyApp()은 앱의 시작점
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {  // 1. material(Google style) 2. cupertino(Apple style)
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("Hey, Selena",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text("Welcome back",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 120,),
              Text("Total Balance",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 5,),
              const Text("\$5 194 482",
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30,),
              Row(          // Transfer Box
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1B33B),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      child: Text("Transfer",
                      style: TextStyle(
                        fontSize: 20,
                      ),),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
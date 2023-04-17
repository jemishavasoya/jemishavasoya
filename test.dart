import 'package:flutter/material.dart';

void main() {
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({Key? key}) : super(key: key);

 // This widget is the root of your application.
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Flutter Demo',
     theme: ThemeData(
       // This is the theme of your application.
       //
       // Try running your application with "flutter run". You'll see the
       // application has a blue toolbar. Then, without quitting the app, try
       // changing the primarySwatch below to Colors.green and then invoke
       // "hot reload" (press "r" in the console where you ran "flutter run",
       // or simply save your changes to "hot reload" in a Flutter IDE).
       // Notice that the counter didn't reset back to zero; the application
       // is not restarted.
       primarySwatch: Colors.blue,
     ),
     home: const TestScreen(),
   );
 }
}

class TestScreen extends StatefulWidget {
 const TestScreen({Key? key}) : super(key: key);

 @override
 State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
 TextEditingController editingController = TextEditingController();
 List<int> list = [];
 int lenght = 0;
 @override
 Widget build(BuildContext context) {
   return SafeArea(
       child: Scaffold(
     body: Column(
       children: [
         TextField(
           controller: editingController,
           keyboardType: TextInputType.number,
         ),
         InkWell(
           onTap: () {
             setState(() {
               lenght = int.parse(editingController.text);
               list.clear();
               for(int i=1;i<=lenght;i++){
                 list.add(i);
               }
                 if(lenght == 1){
                   list.clear();
                   for(int i=1;i<=4;i++){
                     list.add(1);
                   }
                 }

               if(lenght == 2){
                 for(int i=1;i<=lenght;i++){
                   list.add(i);
                 }
               }

               if(lenght == 3){
                 int temp = list.first;
                 list.add(temp);
               }

             });
           },
           child: Container(
               height: 60,
               width: 150,
               color: Colors.green,
               child: const Center(child: Text('Submit'))),
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
           InkWell(onTap: () {
             print("<<");
             int temp =  list.last;
             list.removeLast();
             list.insert(0, temp);
             setState((){});
           },child: CircleAvatar(child: Text("<<"),)),
               if(list.isEmpty)
                 for(int i=0;i<4;i++)
                   Center(child: Text("0")),

               if(list.isNotEmpty)
           for(int i=0;i<4;i++)
             Center(child: Text(list[i].toString())),
           InkWell(onTap: () {
             print(">>");
             int temp =  list.first;
             list.removeAt(0);
             if (lenght == 3 ) {
               temp =  list.first;
               list.add(temp);
             }else{
               list.add(temp);
             }
             setState((){});
           },child: CircleAvatar(child: const Text(">>"),)),
         ]),
         // Expanded(
         //   child: ListView.builder(
         //     itemCount: lenght,
         //     itemBuilder: (context, index) {
         //     return Container(
         //       height: 150,
         //       margin: const EdgeInsets.symmetric(vertical: 5),
         //       child: Row(children: [
         //         Expanded(child: Container(height: 150,color: index % 2 == 0 ? Colors.transparent :Colors.red,child: Center(child: index % 2 == 0 ? SizedBox():Text((index + 1).toString())),)),
         //         Expanded(child: Container(height: 150,color: index % 2 != 0 ? Colors.transparent :Colors.red,child: Center(child: index % 2 != 0 ? SizedBox():Text((index + 1).toString())),)),
         //       ]),
         //     );
         //   },),
         // )
       ],
     ),
   ));
 }
}










///TIMER —----------------- DEMO


import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Countdown List',
     theme: ThemeData(
       primarySwatch: Colors.blue,
     ),
     home: HomePage(),
   );
 }
}

class HomePage extends StatefulWidget {
 @override
 _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 int _numRows = 0;
 int _minValue = 0;
 int _maxValue = 0;

 void _startCountdownList() {
   Navigator.push(
     context,
     MaterialPageRoute(
       builder: (context) => CountdownListScreen(
         numRows: _numRows,
         minValue: _minValue,
         maxValue: _maxValue,
       ),
     ),
   );
 }

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Text(
             'Enter the number of rows:',
           ),
           TextField(
             onChanged: (value) {
               _numRows = int.tryParse(value)!;
             },
             keyboardType: TextInputType.number,
           ),
           Text(
             'Enter the minimum value:',
           ),
           TextField(
             onChanged: (value) {
               _minValue = int.tryParse(value)!;
             },
             keyboardType: TextInputType.number,
           ),
           Text(
             'Enter the maximum value:',
           ),
           TextField(
             onChanged: (value) {
               _maxValue = int.tryParse(value)!;
             },
             keyboardType: TextInputType.number,
           ),
           SizedBox(height: 20),
           ElevatedButton(
             onPressed: _startCountdownList,
             child: Text('Start'),
           ),
         ],
       ),
     ),
   );
 }
}


class CountdownListScreen extends StatefulWidget {
 CountdownListScreen({
   Key? key,
   required this.numRows,
   required this.minValue,
   required this.maxValue,
 }) : super(key: key);

 int numRows;
 int minValue;
 int maxValue;

 @override
 _CountdownListScreenState createState() => _CountdownListScreenState();
}

class _CountdownListScreenState extends State<CountdownListScreen> {
 List<int> _countdownValues = [];
 List<bool> _finishedRows = [];

 void _startCountdowns() {
   for (int i = 0; i < widget.numRows; i++) {
     _countdownValues.add(widget.minValue + Random().nextInt(widget.maxValue - widget.minValue));
     _finishedRows.add(false);
     Timer.periodic(Duration(seconds: 1), (timer) {
       setState(() {
         if (_countdownValues[i] > 0) {
           _countdownValues[i]--;
         } else {
           _finishedRows[i] = true;
           timer.cancel();
         }
       });
     });
   }
 }

 @override
 void initState() {
   super.initState();
   _startCountdowns();
 }

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Countdown List'),
     ),
     body: ListView.builder(
       itemCount: widget.numRows,
       itemBuilder: (BuildContext context, int index) {
         return Container(
           color: _finishedRows[index] ? Colors.green : null,
           child: ListTile(
             title: Text('Countdown ${index + 1}'),
             trailing: Text(
               '${_countdownValues[index]}',
               style: TextStyle(fontSize: 32),
             ),
           ),
         );
       },
     ),
   );
 }
}


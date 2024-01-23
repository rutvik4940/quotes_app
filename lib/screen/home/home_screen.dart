import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
   void initState() {
   super.initState();
    Future.delayed(const Duration(seconds: 1),() =>classconvert() ,);
   }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        convert();
      },
      child: Scaffold(
          body: Center(
            child:ListView.builder(itemCount: quotesList.length,itemBuilder:(context, index) => Container(
              height: 120,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
              ),
              child: Text("${qutestomodel[index].quotes}",style: TextStyle(fontSize: 18)),
            ),)
          ),
        ),
    );

  }
    void convert()
   {
     showDialog(context: context, builder: (context)
     {
       return
         AlertDialog(
           title: const Text("Are You Sure in Exit! "),
           actions: [
             ElevatedButton(onPressed: () {
               exit(0);
             },style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue)),
                 child: const Text(
                   "YES", style: TextStyle(color: Colors.white),),
     ),
             ElevatedButton(onPressed: () {
               Navigator.pop(context);
             },style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue),), child: const Text("NO", style: TextStyle(color: Colors.white),)
       ),
       ]
         );
     }
     );
   }
    void classconvert()
    {
      Random r1=Random();
      int i=r1.nextInt(quotesList.length);
     showDialog(context: context, builder: (context) => AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            const Text("Today's quotes",style: TextStyle(fontSize: 20)),
            const SizedBox(height: 5,),
           Text( "${qutestomodel[i].quotes}"),
          ],
        ),
      )
      );
    }
}

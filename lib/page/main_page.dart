

import 'package:flutter/material.dart';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:jadwal/page/category_page.dart';
import 'package:jadwal/page/home_page.dart';
import 'package:jadwal/page/trasnsactiona_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _children = [HomeDart(), CategoryPage()];

  //pengaturam pindah page
  int currentIndex = 0;

  void onTapTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:(currentIndex == 0) ? CalendarAppBar(
        backButton: false,
        accent: Colors.green,
        locale: "id",
        // ignore: avoid_print
        onDateChanged: (value) => print(value),
        firstDate: DateTime.now().subtract(const Duration(days: 140)),
        lastDate: DateTime.now(),
      ) : PreferredSize(preferredSize: Size.fromHeight(100), 
          child: Container(
            child: Padding(padding:EdgeInsets.symmetric(horizontal: 30, vertical: 26), child: Text('Categories', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
          )
        ),

      floatingActionButton:Visibility(
        visible: currentIndex == 1 ? false : true,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransaksiPage(),))
            .then((value){
              setState(() {});
            });

            
          }, 
          backgroundColor: Colors.green,
          shape: const CircleBorder(), 
          child: const Icon(Icons.add),
          ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: () {onTapTapped(0);}, icon: const Icon(Icons.home)),
          const SizedBox(width: 15,),
          IconButton(onPressed: () {onTapTapped(1);}, icon: const Icon(Icons.list))
        ],
      ),
      ),
      body: _children[currentIndex],
    );
  }
}
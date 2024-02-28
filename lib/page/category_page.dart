

import 'package:flutter/material.dart';

void main() {
  runApp(CategoryPage());
}

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool isExpense = true;

  void openDialog() {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
          content: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Text("Add Income"),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Name"
                    ),
                  ),
                  ElevatedButton(onPressed: (){}, child: Text("Save"))
                ],
              ),
            ),
          ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Switch(
                value: isExpense, 
                onChanged: (bool value) {
                  setState(() {
                    isExpense = value;
                  });
                }, 
                inactiveTrackColor: Colors.green[200], 
                inactiveThumbColor: Colors.green,
                activeColor: Colors.red,
                ),
            ),
            IconButton(onPressed: (){openDialog();}, icon: Icon(Icons.add))
            ],
        ),

        //list pengeluaran
        Padding(
          padding: EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
          child: Card(
            elevation: 10,
            child: ListTile(
              leading: (isExpense) ? Icon(Icons.upload, color: Colors.red,) : Icon(Icons.download, color: Colors.green,),
              title: Text("Makan"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.delete),
                  SizedBox(width: 10),
                  Icon(Icons.edit)
                ],
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
          child: Card(
            elevation: 10,
            child: ListTile(
              leading: (isExpense) ? Icon(Icons.upload, color: Colors.red,) : Icon(Icons.download, color: Colors.green,),
              title: Text("Makan"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.delete),
                  SizedBox(width: 10),
                  Icon(Icons.edit)
                ],
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
          child: Card(
            elevation: 10,
            child: ListTile(
              leading: (isExpense) ? Icon(Icons.upload, color: Colors.red,) : Icon(Icons.download, color: Colors.green,),
              title: Text("Makan"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.delete),
                  SizedBox(width: 10),
                  Icon(Icons.edit)
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
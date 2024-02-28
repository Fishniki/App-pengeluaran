

import 'package:flutter/material.dart';

void main() {
  runApp(const HomeDart());
}

class HomeDart extends StatefulWidget {
  const HomeDart({super.key});

  @override
  State<HomeDart> createState() => _HomeDartState();
}

class _HomeDartState extends State<HomeDart> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //dashboard total include
            Padding(
            padding: EdgeInsets.all(16),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        child: const Icon(Icons.download, color: Colors.green,),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 10,),
                          Text("Income", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),),
                          Text("Rp 3.800.000", style: TextStyle(color: Colors.white, fontSize: 16),)
                        ],
                      ),
                      ],
                    ),

                    Row(
                      children: [
                        Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        child: const Icon(Icons.upload, color: Colors.red,),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 10,),
                          Text("Expense", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),),
                          Text("Rp 3.800.000", style: TextStyle(color: Colors.white, fontSize: 16),)
                        ],
                      ),
                      ],
                    ),
                  ],
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(16)
                ),
              ),
            ),

            //text transaction
            Padding(
              padding: EdgeInsets.all(16),
              child: Text("Transaction", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),

            //list transaksi
            Padding(
              padding: EdgeInsets.all(16),
              child: Card(
                elevation: 10,
                child: ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.delete),
                      SizedBox(width: 10),
                      Icon(Icons.edit),
                    ],
                  ),
              
                  title: Text("Rp 20.000"),
                  subtitle: Text("Makan Siang"),
                  leading: Container(
                    child:  Icon(Icons.upload, color: Colors.red,
                  ),
                   decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                ),
                          ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 10,
                child: ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.delete),
                      SizedBox(width: 10),
                      Icon(Icons.edit),
                    ],
                  ),
              
                  title: Text("Rp 20.000"),
                  subtitle: Text("Makan Siang"),
                  leading: Container(
                    child:  Icon(Icons.download, color: Colors.green,
                  ),
                   decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                ),
                          ),
              ),
            )
          ],
        ),
        ),
    );
  }
}
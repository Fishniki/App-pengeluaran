import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(TransaksiPage());
}

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({super.key});

  @override
  State<TransaksiPage> createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  bool isExpense = true;
  List<String> list = [
    "Makan dan Jajan",
    "Transportasi",
    "Hiburan",
    "Lainnnya"
  ];
  late String dropDowmValue = list.first;
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Transaction",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
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
                SizedBox(
                  width: 10,
                ),
                Text(isExpense ? "Expense" : "Income")
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Amount",
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Category",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: DropdownButton<String>(
                isExpanded: true,
                value: dropDowmValue,
                items: list.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDowmValue = newValue!;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                readOnly: true,
                controller: dateController,
                decoration: InputDecoration(labelText: "Enter Date", labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                onTap: () async {
                  DateTime? pickeDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2099),
                      // locale: Locale('id', 'ID'),
                    );
                  if (pickeDate != null) {
                    String formatDate = DateFormat("yyyy-mm-dd").format(pickeDate);
                    dateController.text = formatDate;
                  }
                },
              ),
            ),
            SizedBox(height: 15,),
            Center(child: ElevatedButton(onPressed: (){}, child: Text("SAVE"),))
          ],
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:jadwal/data/database.dart';

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
  TextEditingController categoryNameController = TextEditingController();
  int type = 2;

  //koneksi ke database
  final AppDatabase database = AppDatabase();
  //syntax untuk mengirim ke database
  Future insert(String name, int type) async {
    DateTime now = DateTime.now();
    final row = await database.into(database.categories).insertReturning(
        CategoriesCompanion.insert(
            nama: name, type: type, createdAt: now, updatedAt: now));
    print(row);
  }

  //query awitch expense dan income
  Future <List<Category>> getAllCategory(int type) async {
    return await database.getAllCategoryRepo(type);
  }

  void openDialog(Category? category) {
    if (category != null) {
      categoryNameController.text = category.nama;
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Text(isExpense ? "Expense" : "Income"),
                    TextFormField(
                      controller: categoryNameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: "Name"),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (category == null) {
                            insert(categoryNameController.text, isExpense ? 2 : 1);
                          }else{
                            
                          }

                              Navigator.of(context, rootNavigator: true).pop('dialog');
                              setState(() {
                                
                              });
                              categoryNameController.clear();
                        },
                        child: Text("Save"))
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
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
                    type = value ? 2:1; //tanda '?' = true/ tanda ':' = else nya
                  });
                },
                inactiveTrackColor: Colors.green[200],
                inactiveThumbColor: Colors.green,
                activeColor: Colors.red,
              ),
            ),
            IconButton(
                onPressed: () {
                  openDialog(null);
                },
                icon: Icon(Icons.add))
          ],
        ),

        

        FutureBuilder<List<Category>>(
          future: getAllCategory(type),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                if (snapshot.data!.length > 0){
                  return ListView.builder(
                    
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                    return Padding(
              padding: EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  leading: (isExpense)
                      ? Icon(
                          Icons.upload,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.download,
                          color: Colors.green,
                        ),
                  title: Text(snapshot.data![index].nama),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () {
                    
                  }, icon: Icon(Icons.delete)),

                  SizedBox(width: 10),

                  IconButton(onPressed: () {
                    openDialog(snapshot.data![index]);
                  }, icon: Icon(Icons.edit)),
                ],
              ),
            ),
          ),
        );
        
                  },);
                } else {
                  return Center(
                    child: Text("No has data")
                  );
                // ignore: dead_code
                };
              } else {
                return Center(
                  child: Text("No has data"),
                );
              // ignore: dead_code
              };
            // ignore: dead_code
            };
          },
          
          
        ),

        //list pengeluaran
        Padding(
          padding: EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
          child: Card(
            elevation: 10,
            child: ListTile(
              leading: (isExpense)
                  ? Icon(
                      Icons.upload,
                      color: Colors.red,
                    )
                  : Icon(
                      Icons.download,
                      color: Colors.green,
                    ),
              title: Text("Makan"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  SizedBox(width: 10),
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                ],
              ),
            ),
          ),
        ),
        
      ],
    ));
  }
}

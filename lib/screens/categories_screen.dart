import 'package:flutter/material.dart';
import 'package:todo/models/category.dart';
import 'package:todo/screens/home_screen.dart';
import 'package:todo/services/category_service.dart';

class CategoresScreen extends StatefulWidget {
  const CategoresScreen({Key? key}) : super(key: key);

  @override
  State<CategoresScreen> createState() => _CategoresScreenState();
}

class _CategoresScreenState extends State<CategoresScreen> {
  var _categoryNameController = TextEditingController();
  var _categoryDescriptionController = TextEditingController();
  var _category = Category();
  var _categoryService = CategoryService();
  _showFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (parm) {
          return AlertDialog(
            actions: [
              TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.pink,
                  ),
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: (() {
                    // print("Category : ${_categoryNameController.text}");
                    // print("Category : ${_categoryDescriptionController.text}");
                    _category.name = _categoryNameController.text;
                    _category.description = _categoryDescriptionController.text;
                    _categoryService.saveCategory(_category);
                  }),
                  child: const Text("Save")),
            ],
            title: const Text("Categories Form"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _categoryNameController,
                    decoration: const InputDecoration(
                        hintText: "write a category ", labelText: "Category"),
                  ),
                  TextField(
                    controller: _categoryDescriptionController,
                    decoration: const InputDecoration(
                        hintText: "write a Description ",
                        labelText: "Description"),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.resolveWith<double>(
                (Set<MaterialState> states) {
                  // if the button is pressed the elevation is 10.0, if not
                  // it is 5.0
                  if (states.contains(MaterialState.pressed)) return 10.0;
                  return 0.0;
                },
              ),
            ),
            child: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeScreen()));
            }),
        title: Text("Categories "),
      ),
      body: Center(child: Text("welcome to categoriesscreen")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

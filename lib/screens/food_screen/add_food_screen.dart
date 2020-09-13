import 'package:flutter/material.dart';
import 'package:health_app/models/food.dart';
import 'package:health_app/resources/health_app_api.dart';
import 'package:provider/provider.dart';

class AddFoodScreen extends StatefulWidget {
  @override
  _AddFoodScreenState createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen> {
  String ingredient;
  List<Food> foods = List<Food>();
  bool isLoading = false;

  void _addContact(context) async {
    /// Validate the client name input
    if (ingredient == null) {
      // commonToast("You must include a name.");
      return;
    } else {
      setState(() {
        isLoading = true;
      });
      List<Food> result = await HealthAppApi().searchFood(ingredient);
      setState(() {
        isLoading = false;
        foods = result;
      });
    }

    /// Save contact data, email and phone are optional - null values replaced by empty string
    // Provider.of<ContactsData>(context, listen: false).addContact(

    // );
    //Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Choose food'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            onPressed: () {
              _addContact(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
                onChanged: (nameIngredient) {
                  setState(() {
                    ingredient = nameIngredient;
                  });
                },
              ),
              Expanded(
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: foods.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Text(foods[index].id.toString()),
                            title: Text("Test"),
                            subtitle: Text(foods[index].description),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

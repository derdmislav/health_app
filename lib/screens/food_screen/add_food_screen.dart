import 'package:flutter/material.dart';
import 'package:health_app/models/food.dart';
import 'package:health_app/resources/health_app_api.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddFoodScreen extends StatefulWidget {
  @override
  _AddFoodScreenState createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen> {
  String ingredient;
  List<Food> foods = List<Food>();
  bool isLoading = false;
  final TextEditingController controller = TextEditingController();

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
  void dispose() {
    controller.dispose();
    super.dispose();
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
              'Search',
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
                controller: controller,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
                //ADDED CONTROLLER FOR DONE BUTTON
                //added dispose for controller
                onEditingComplete: () {
                  setState(() {
                    ingredient = controller.text;
                    _addContact(context);
                  });
                },
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
                            onTap: () {
                              Fluttertoast.showToast(
                                msg: 'Food added to your list',
                                backgroundColor: Theme.of(context).accentColor,
                              );

                              print(foods[index].description);
                              print('energy');
                              print(foods[index].energy);
                            },
                            leading: IconButton(
                                icon: Icon(
                                  Icons.playlist_add,
                                  color: Theme.of(context).accentColor,
                                ),
                                onPressed: null),
                            title: Text(foods[index].description.toString()),
                            subtitle: Text(foods[index].dataType),
                            trailing: Text('${foods[index].energy} kcal'),
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

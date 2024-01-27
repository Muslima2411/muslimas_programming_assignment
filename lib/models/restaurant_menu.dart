import 'dart:io';
import 'package:programming_assingment/app.dart';

import 'meal_model.dart';

Map<String, Meal> meals = {
  "soup": Meal(name: "🍛 Soup", price: 23, description: "description"),
  "palov": Meal(name: "🍚 Palov", price: 18, description: "description"),
  "manti": Meal(name: "🥟 Manti", price: 15, description: "description"),
  "salad": Meal(name: "🥗 Salad", price: 15, description: "description"),
  "rolls": Meal(name: "🍱 Rolls", price: 15, description: "description"),
};

Map<String, Meal> drinks = {
  "tea": Meal(name: "🫖 Tea", price: 23, description: "description"),
  "coffee": Meal(name: "☕️ Coffee", price: 23, description: "description"),
  "coke": Meal(name: "🥤 Coke", price: 23, description: "description"),
  "juice": Meal(name: "🧃 Juice", price: 23, description: "description"),
  "bubble tea": Meal(name: "🧋 Bubble Tea", price: 23, description: "description"),
  "cocktail": Meal(name: "🍸 Cocktail", price: 23, description: "description")
};

Map<String, Meal> disserts  = {
  "cupcake": Meal(name: "🧁 Cupcake", price: 23, description: "description"),
  "cake": Meal(name: "🎂 Cake", price: 23, description: "description"),
  "donuts": Meal(name: "🍩 Donuts", price: 23, description: "description"),
  "icecream": Meal(name: "🍨 Ice-Cream", price: 23, description: "description"),
  "pie": Meal(name: "🥧 Pie", price: 23, description: "description"),
};


class RestaurantMenu {

  static menuFunctions() {
    List<String> list = [
      "1. View menu",
      "2. Add a new meal to menu",
      "3. Remove a meal from menu",
      "4. Update a meal from menu"
    ];
    displayMain(list);
    stdout.write("Enter number:");
    String choice = stdin.readLineSync()!;
    switch(choice){
      case "1": {
        displayMenu();
        break;
      }
      case "2": {
        addMenu();
        break;
      }
      case "3": {
        removeMenu();
        break;
      }
      case "4": {
        updateMenu();
        break;
      }
      case "0": {
        exit(0);
      }
      default:{
        menuFunctions();
      }
    }
  }

  static displayMenu(){
    String menuType = choosingMenu();
    switch(menuType){
      case "1":
        displayItem(meals);
        break;
      case "2":
        displayItem(drinks);
        break;
      case "3":
        displayItem(disserts);
        break;
     case "4":
       menuFunctions();
        break;
     case "0":
       exit(0);
      default:
        displayMenu();
    }
  }
  static displayItem(Map<String, Meal> items) {
    print("\n\t\t\t-Menu-\n");
    int counter = 0;
    items.forEach((key, value) {
      counter++;
      print("$counter.$value");
    });
    print("\n\t${++counter}. Go Back");
    print("\t${++counter}. Exit");
    stdout.write("\nEnter number:");
    String a = stdin.readLineSync()!;
    switch(a){
      case "1":
        displayMenu();
        break;
      case "0":
        exit(0);
      default:
        displayItem(items);
    }
  }

  static addMenu(){
    String menuType = choosingMenu();
    switch(menuType){
      case "1":
        addNewItem(meals);
        break;
      case "2":
        addNewItem(drinks);
        break;
      case "3":
        addNewItem(disserts);
        break;
      case "4":
        menuFunctions();
        break;
      case "0":
        exit(0);
      default:
        addMenu();
    }
  }
  static addNewItem(Map<String, Meal> items) {
    print("\n=====================================");
    print("\tYou are adding new ITEM\n");
    stdout.write("\tEnter item name:");
    String name = stdin.readLineSync()!;
    stdout.write("\tEnter item cost:");
    double cost = double.parse(stdin.readLineSync()!);
    stdout.write("\tEnter item description:");
    String description = stdin.readLineSync()!;
    Meal newItem = Meal(name: name, price: cost, description: description);
    items.addAll({name:newItem});
    displayItem(items);
  }

  static removeMenu(){
    String menuType = choosingMenu();
    switch(menuType){
      case "1":
        removeItem(meals);
        break;
      case "2":
        removeItem(drinks);
        break;
      case "3":
        removeItem(disserts);
        break;
      case "4":
        menuFunctions();
        break;
      case "0":
        exit(0);
      default:
        removeMenu();
    }
  }
  static removeItem(Map<String, Meal> items) {
    List listItems = [];
    items.forEach((key, value) {
      listItems.add(key);
    });
    print("\n\t\t\t-Menu-\n");
    int counter = 0;
    items.forEach((key, value) {
      counter++;
      print("$counter. $value");
    });
    print("\n\t${counter+1}. Go Back");
    print("\t${counter+2}. Exit");
    stdout.write("\nEnter number of the meal you want to remove:");
    String a = stdin.readLineSync()!;
    if(int.tryParse(a) == counter+1){
      displayMenu();
    }else if(int.tryParse(a) == counter+2){
      exit(0);
    }else {
      int indexToRemove = int.parse(a) - 1;
      if (indexToRemove >= 0 && indexToRemove < listItems.length) {
        items.remove(listItems[indexToRemove]);
        listItems.removeAt(indexToRemove);
       displayAfterRemove(items);
      } else {
        print('Invalid input. Please enter a valid number.');
        removeItem(items);
      }
    }
  }

  static updateMenu(){
    String menuType = choosingMenu();
    switch(menuType){
      case "1":
        updateItem(meals);
        break;
      case "2":
        updateItem(drinks);
        break;
      case "3":
        updateItem(disserts);
        break;
      case "4":
        menuFunctions();
        break;
      case "0":
        exit(0);
      default:
        updateMenu();
    }
  }
  static updateItem(Map<String, Meal> items) {
    List listItems = [];
    items.forEach((key, value) {
      listItems.add(key);
    });
    print("\n\t\t\t-Menu-\n");
    int counter = 0;
    items.forEach((key, value) {
      counter++;
      print("$counter. $value");
    });
    print("\n\t${counter+1}. Go Back");
    print("\t${counter+2}. Exit");
    stdout.write("\nEnter number of the meal you want to update:");
    String a = stdin.readLineSync()!;
    if(int.tryParse(a) == counter+1){
      displayMenu();
    }else if(int.tryParse(a) == counter+2){
      exit(0);
    }else {
      int indexToUpdate = int.parse(a) - 1;
      if (indexToUpdate >= 0 && indexToUpdate < listItems.length) {
        stdout.write("Enter cost of the meal:");
        double cost = double.parse(stdin.readLineSync()!);
        stdout.write("Enter description of the meal:");
        String description = stdin.readLineSync()!;
        items.update(listItems[indexToUpdate], (value) {
          value.price = cost;
          value.description = description;
          print("Successfully Updated");
          return value;
        });
        displayAfterUpdate(items);
      } else {
        print('Invalid input. Please enter a valid number.');
        updateItem(items);
      }
    }
  }

  static bool isValidItem(String mealName, Map<String, Meal> items) {
    return items.containsKey(mealName);
  }

  static displayAfterRemove(Map<String, Meal> items) {
    print("\n\t\t\t-Menu-\n");
    items.forEach((key, value) {
      print("$value");
    });
    print("\n\t1. Go Back");
    print("\t0. Exit");
    stdout.write("\nEnter number:");
    String a = stdin.readLineSync()!;
    switch(a){
      case "1":
        menuFunctions();
        break;
      case "0":
        exit(0);
      default:
        displayAfterRemove(items);
    }
  }

  static displayAfterUpdate(Map<String, Meal> items) {
    print("\n\t\t\t-Menu-\n");
    items.forEach((key, value) {
      print("$value");
    });
    print("\n\t1. Go Back");
    print("\t0. Exit");
    stdout.write("\nEnter number:");
    String a = stdin.readLineSync()!;
    switch(a){
      case "1":
        menuFunctions();
        break;
      case "0":
        exit(0);
      default:
        displayAfterUpdate(items);
    }
  }

  static String choosingMenu(){
    print("\n\t1. 🍲 Meals");
    print("\t2. 🍹 Drinks");
    print("\t3. 🍰 Desserts");
    print("\n\t4. Go Back");
    print("\t0. Exit");
    stdout.write("\nEnter number : ");
    String choice = stdin.readLineSync()!;
    return choice;
  }

}


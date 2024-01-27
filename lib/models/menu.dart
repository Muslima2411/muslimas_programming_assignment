
import 'package:programming_assingment/models/reservation.dart';
import 'package:programming_assingment/models/restaurant_menu.dart';

import 'meal_model.dart';

List<Reservation> reservationsList = [Reservation(customerName: "bob",dayOfWeek: 1, tableNumber: 1, numberOfGuests: 4, mealChoices: {meals["soup"]!:2})];


class Menu{
  static int totalTables = 20;

  static int isTableAvailable(int dayOfWeek) {
    int occupiedTables = 0;

    for (var reservation in reservationsList) {
      if (reservation.dayOfWeek == dayOfWeek) {
        occupiedTables++;
      }
    }

    return occupiedTables;
  }

  static List<Meal> offerMenu(){
    List<Meal>? basket = [];
    String choice = RestaurantMenu.choosingMenu();
    switch(choice){
      case "1":
        basket = displayMenu(meals);
        break;
      case "2":
        basket = displayMenu(drinks);
        break;
      case "3":
        basket = displayMenu(disserts);
        break;
      default:
        offerMenu();
    }

    return basket;
  }

  static List<Meal> displayMenu(Map<String, Meal> items){
    List<Meal> listItems = [];
    items.forEach((key, value) {
      listItems.add(value);
    });
    print("\n\t\t\t-Menu-\n");
    int counter = 0;
    items.forEach((key, value) {
      counter++;
      print("$counter.$value");
    });
    return listItems;

  }
}
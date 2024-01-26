import 'dart:io';
import 'package:programming_assingment/models/restaurant_menu.dart';
import 'meal_model.dart';


class Reservation {
  late String customerName;
  late int dayOfWeek;
  late int tableNumber;
  late int numberOfGuests;
  Map<Meal, int> mealChoices;

  Reservation(
      {required this.customerName,
        required this.dayOfWeek,
        required this.tableNumber,
        required this.numberOfGuests,
        required this.mealChoices});

  double calculateTotalCost() {
    double totalCost = 0.0;
    return totalCost;
  }

  void returnMealDetails() {
    mealChoices.forEach((key, value) {
      print("$key($value) ----- ${value*key.price} so'm ");
    });
  }

// bool checkTimingConflict(String newDate, String newTime) {
//   String key = '$newDate $newTime';
//
//   // Assuming reservations is a Map where keys are date and time strings
//   if (reservations.containsKey(key)) {
//     print("Sorry, there is a timing conflict. The table is already reserved at $newDate $newTime.");
//     return true; // Conflict found
//   } else {
//     return false; // No conflict
//   }
// }

//...


}
// void searchMeal(){
//   stdout.write("Enter NAME of the meal:");
//   String name = stdin.readLineSync()!;
//   if(mealChoices[name] == null) return null;
//   else{
//     return mealChoices[name];
//   }
// }

// addNewItem(RestaurantMenu menu) {
//   returnMealDetails();
//   print("You are adding new ITEM\n");
//   stdout.write("enter item name:");
//   var newItem = menu.search();
//   while(newItem == null){
//     print("You are adding wrong ITEM\n");
//     stdout.write("enter item name:");
//     newItem = menu.search();
//   }
//
// }

// removeItem(RestaurantMenu menu) {
//   returnMealDetails();
//   stdout.write("Enter NAME of the meal you want to remove");
//   String name = stdin.readLineSync()!;
//   var newItem = menu.search();
//   while(newItem == null){
//     print("You are adding wrong ITEM\n");
//     stdout.write("enter item name:");
//     newItem = menu.search();
//   }
//   mealChoices.removeWhere((key, value) => key == name);
// }
// bool checkTimingConflict(String newDate, String newTime) {
//   String key = '$newDate $newTime';
//
//   // Assuming reservations is a Map where keys are date and time strings
//   if (reservations.containsKey(key)) {
//     print("Sorry, there is a timing conflict. The table is already reserved at $newDate $newTime.");
//     return true; // Conflict found
//   } else {
//     return false; // No conflict
//   }
// }


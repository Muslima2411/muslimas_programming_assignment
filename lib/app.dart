import 'dart:io';
import 'package:programming_assingment/models/reservation_system.dart';
import 'package:programming_assingment/models/restaurant_menu.dart';

void run() => display();

displayMain(List<String> listOfActions){
  print("\n=====================================");
  print("\tMubeen's family restaurant");
  print("=====================================\n");
  listOfActions.forEach((element) {
    print('\t $element');
  });
  print("\t 0. Exit");
  print("\n=====================================");
}

void display(){
  displayMain(["1. Reservation", "2. Menu"]);
  stdout.write("\nEnter number : ");
  String choice = stdin.readLineSync()!;
  switch(choice){
    case "1":
      ReservationSystem.displayReservation();
      break;
    case "2":
      RestaurantMenu.menuFunctions();
      break;
    case "0":
      print("Thank You For Your Choice!");
      exit(0);
    default:
      print("Wrong Input, Try again!\n");
      display();
  }
}
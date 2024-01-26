import 'dart:io';
import 'package:programming_assingment/app.dart';
import 'restaurant_menu.dart';

class ReservationSystem {

  static displayReservation(){
    print("\n=========================================");
    print("\tRestaurant Table Reservation System");
    print("=========================================\n");

    print("\t1. Make a Reservation");
    print("\t2. Update a Reservation");
    print("\t3. Cancel a Reservation");
    print("\t4. View Reservations");
    print("\t5. Go Back");
    print("\t0. Exit");
    options();
  }

  static options(){
    stdout.write("\nEnter number : ");
    String choice = stdin.readLineSync()!;
    switch(choice){
      case "1":
        makeReservation();
        break;
      case "2":
        updateReservation();
        break;
      case "3":
        cancelReservation();
        break;
      case "4":
        viewReservations();
        break;
      case "5":
        display();
        break;
      case "0":
        print("Thank You For Your Choice!");
        exit(0);
      default:
        print("Wrong Input, Try again!\n");
        displayReservation();
    }
  }

  static void makeReservation() {
    stdout.write("Enter customer name: ");
    String name = stdin.readLineSync()!;
    stdout.write("Enter reservation date (YYYY-MM-DD): ");
    String newDate = stdin.readLineSync()!;
    stdout.write("Enter reservation time (HH:MM): ");
    String newTime = stdin.readLineSync()!;
    stdout.write("Enter number of people: ");
    String people = stdin.readLineSync()!;

    if (reservation.checkTimingConflict(newDate, newTime)) {
      // some function
      print("Please choose a different date and time for your reservation.");
    } else {
      // some function
    }


    print("\n\t\tView our Menu");
    print("================================");
    offerFood();

    ///TODO stdout.write("\nEnter number of porsions of the meal: ");
    //
    // int porsions = int.parse(stdin.readLineSync()!);
    //
    // Map<Meal, int> mealChoices = {
    //   item!:porsions
    // };

    // Reservation reservation = Reservation(customerName: name, date: date, time: time, numberOfGuests: int.parse(people), mealChoices: mealChoices);
  }

  static void updateReservation() {
    stdout.write("Enter new reservation date (YYYY-MM-DD): ");
    String newDate = stdin.readLineSync()!;
    stdout.write("Enter new reservation time (HH:MM): ");
    String newTime = stdin.readLineSync()!;
    stdout.write("Enter new number of guests: ");
    int guests = int.parse(stdin.readLineSync()!);
    // String prevData = reservation.date;
    // reservation.date = '$newDate $newTime';
    // int prevNumGuests = reservation.numberOfGuests;
    // reservation.numberOfGuests = guests;
    print("Do you want to update your menu?");
    print("1. Yes");
    print("2. No");
    stdout.write("Enter a number (1 or 2): ");
    String thisCase = stdin.readLineSync()!;
    // switch(thisCase){
    //   case "1":{
    //     print("Previous meal choice");
    //     print(reservation.mealChoices);
    //
    //   }
    // }

  }

  static void cancelReservation() {
  stdout.write("Enter reservation date (YYYY-MM-DD) to cancel: ");
  String date = stdin.readLineSync()!;
  stdout.write("Enter reservation time (HH:MM) to cancel: ");
  String time = stdin.readLineSync()!;
  String key = '$date $time';
  //
  // if (!reservations.containsKey(key)) {
  //   print("Reservation not found.");
  // } else {
  //   reservations.remove(key);
  //   print("Reservation cancelled.");
  // }
}

  static void viewReservations() {
  // if (reservations.isEmpty) {
  //   print("No reservations found.");
  // } else {
  //   print("\nCurrent Reservations:");
  //   reservations.forEach((key, value) {
  //     String date = key.split(' ')[0];
  //     String time = key.split(' ')[1];
  //     String name = value['name'];
  //     String people = value['people'];
  //     print("Date: $date \nTime: $time \nName: $name \nPeople: $people");
  //   });
  // }
}

  static void offerFood(){
    RestaurantMenu.displayMenu();
  }
}


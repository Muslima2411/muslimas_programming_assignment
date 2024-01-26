import 'dart:io';
import 'package:programming_assingment/app.dart';
import 'package:programming_assingment/models/reservation.dart';
import 'meal_model.dart';
import 'menu.dart';
import 'restaurant_menu.dart';

List<String> daysOfWeek = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday"
];

class ReservationSystem {
  static displayReservation() {
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

  static options() {
    stdout.write("\nEnter number : ");
    String choice = stdin.readLineSync()!;
    switch (choice) {
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
    print("Welcome to our reservation system!\n"
        "Please enter the required information so we can find you a table");
    stdout.writeln("Enter your name:");
    String customerName = stdin.readLineSync()!;

    if (reservationsList.any((reservation) => reservation.customerName == customerName)) {
      print("Sorry, a reservation with the same name already exists.");
      makeReservation(); // Go back to the main menu
      return;
    }

    print("\nChoose the day: ");
    print("1 - Monday\n"
        "2 - Tuesday\n"
        "3 - Wednesday\n"
        "4 - Thursday\n"
        "5 - Friday\n"
        "6 - Saturday\n"
        "7 - Sunday\n");
    stdout.writeln("Choose the day in numbers(1-7):");
    int? chosenDay = int.tryParse(stdin.readLineSync()!);
    while (chosenDay == null || chosenDay < 1 || chosenDay > 7) {
      stdout.writeln("Choose the day in numbers(1-7):");
      chosenDay = int.tryParse(stdin.readLineSync()!);
    }

    stdout.writeln("Enter the number of ppl(1-4):");
    int? numOfPpl = int.tryParse(stdin.readLineSync()!);
    while (numOfPpl == null || numOfPpl < 1 || numOfPpl > 4) {
      stdout.writeln("Enter the number of ppl(1-4):");
      numOfPpl = int.tryParse(stdin.readLineSync()!);
    }

    // Check table availability
    if (Menu.isTableAvailable(chosenDay) < Menu.totalTables) {
      print(
          "Congratulations, your table number is ${reservationsList.last.tableNumber + 1}");
    } else {
      print("Sorry, the table is not available for the selected day.");
      return;
    }

    List<Meal> menu = [];
    Reservation reservation;
    Map<Meal, int> mealchoices = {};

    // Set minimum and maximum values for the number of meals
    const int minMeals = 1;
    const int maxMeals = 10;

    while (true) {
      print("Choose a category:");
      menu = Menu.offerMenu();
      stdout.write("Enter a number:");
      int? mealNumber = int.tryParse(stdin.readLineSync()!);
      if (mealNumber == null) {
        break;
      }
      stdout.write("Enter the quantity for this meal:");
      int? quantity = int.tryParse(stdin.readLineSync()!);
      if (quantity == null || quantity < minMeals || quantity > maxMeals) {
        print(
            "Invalid quantity. Please enter a number between $minMeals and $maxMeals.");
        continue;
      }
      // Add the selected meal and quantity to the mealChoices
      Map<Meal, int> order = {menu[mealNumber - 1]: quantity};
      mealchoices.addAll(order);
      // Display the selected meals
      print("Your selected meals for this order:\n");
      mealchoices.forEach((key, value) {
        print("\t${key.name}($value) - \$ ${key.price * value}\n");
      });
      // Calculate total price for this reservation

      double totalPrice = 0;
      mealchoices.forEach((key, value) {
        totalPrice += key.price * value;
      });

      print("\tTotal price: \$$totalPrice\n");

      // Ask if the customer wants to continue ordering
      stdout.writeln("Do you want to continue ordering? (yes/no)");
      String? continueOrdering = stdin.readLineSync();
      while(continueOrdering == null){
        stdout.writeln("Do you want to continue ordering? (yes/no)");
        continueOrdering = stdin.readLineSync();
      }


      if (continueOrdering.toLowerCase().trim() == "no") {
        // Check if the number of meals is within the required range
        if (mealchoices.length < minMeals || mealchoices.length > maxMeals) {
          print(
              "Invalid number of meals. You must order between $minMeals and $maxMeals meals.");
          display();
        }

        reservation = Reservation(
            customerName: customerName,
            dayOfWeek: chosenDay,
            tableNumber: reservationsList.last.tableNumber + 1,
            numberOfGuests: numOfPpl,
            mealChoices: mealchoices);
        // print(reservation);
        // Add the reservation to the list
        reservationsList.add(reservation);
        // print(reservationsList);

        print("Reservation confirmed! Thank you for choosing our restaurant.");
        break;
      }
    }
    display();
  }

  static void updateReservation() {

    List<Meal> menu = [];
    Reservation reservation;
    Map<Meal, int> mealchoices = {};

    // Set minimum and maximum values for the number of meals
    const int minMeals = 1;
    const int maxMeals = 10;


    stdout.write("Enter your previous customer  name: ");
    String name = stdin.readLineSync()!;
    reservationsList.forEach((element) {
      if (element.customerName == (name)) {
        viewReserv(element);
        stdout.write("New day (1-7) or leave it empty without change: ");
        int day = int.tryParse(stdin.readLineSync()!)?? element.dayOfWeek;
        stdout.write("New number of guests (1-4) or leave it empty without change: ");
        int guests = int.tryParse(stdin.readLineSync()!)?? element.numberOfGuests;// String prevData = reservation.date;
        print("Do you want to update your menu?");
        print("Enter yes/no:");
        String thisCase = stdin.readLineSync()!;
        switch(thisCase){
          case "yes":{
            element.numberOfGuests = guests;
            element.dayOfWeek = day;
            print("Previous meal choice");
            viewReserv(element);
            while (true) {
              print("Choose a category:");
              menu = Menu.offerMenu();
              stdout.write("Enter a number:");
              int? mealNumber = int.tryParse(stdin.readLineSync()!);
              if (mealNumber == null) {
                break;
              }
              stdout.write("Enter the quantity for this meal:");
              int? quantity = int.tryParse(stdin.readLineSync()!);
              if (quantity == null || quantity < minMeals || quantity > maxMeals) {
                print(
                    "Invalid quantity. Please enter a number between $minMeals and $maxMeals.");
                continue;
              }
              // Add the selected meal and quantity to the mealChoices
              Map<Meal, int> order = {menu[mealNumber - 1]: quantity};
              mealchoices.addAll(order);
              // Display the selected meals
              print("Your selected meals for this order:\n");
              mealchoices.forEach((key, value) {
                print("\t${key.name}($value) - \$ ${key.price * value}\n");
              });
              // Calculate total price for this reservation

              double totalPrice = 0;
              mealchoices.forEach((key, value) {
                totalPrice += key.price * value;
              });

              print("\tTotal price: \$$totalPrice\n");

              // Ask if the customer wants to continue ordering
              stdout.write("Do you want to continue ordering? (yes/no)");
              String? continueOrdering = stdin.readLineSync();
              while(continueOrdering == null){
                stdout.write("Do you want to continue ordering? (yes/no)");
                continueOrdering = stdin.readLineSync();
              }

              if (continueOrdering.toLowerCase().trim() == "no") {
                // Check if the number of meals is within the required range
                if (mealchoices.length < minMeals || mealchoices.length > maxMeals) {
                  print(
                      "Invalid number of meals. You must order between $minMeals and $maxMeals meals.");
                  display();
                }

                print("Reservation confirmed! Thank you for choosing our restaurant.");
                break;
              }
          }
          element.mealChoices = mealchoices;
            break;
          }
          case "no":{
            element.numberOfGuests = guests;
            element.dayOfWeek = day;
           break;
          }
          default:
            print("Wrong input Updating Canceled!");
        }
      }
    });
    display();
  }

  static void cancelReservation() {
    stdout.write("Enter customer name to cancel reservation: ");
    String name = stdin.readLineSync()!;
    bool found = false;

    // Created a copy of the list to avoid concurrent modification
    List<Reservation> copyList = List.from(reservationsList);

    for (Reservation element in copyList) {
      if (element.customerName == name) {
        found = true;
        reservationsList.remove(element);
        print("Reservation cancelled successfully.");
      }
    }

    if (found) {
      display();
    } else {
      print("Reservation not found.");
      cancelReservation();
    }
  }

  static void viewReservations() {
    String keys = "";
    double totalCost = 0;
    if (reservationsList.isEmpty) {
      print("No reservations found.");
    } else {
      print("\nCurrent Reservations:");
      reservationsList.forEach((element) {
       viewReserv(element);
      });
    }
    print("\n\t1. Go Back");
    print("\t0. Exit");
    stdout.write("Enter a number(0 or 1):");
    String a = stdin.readLineSync()!;
    switch (a) {
      case "1":
        displayReservation();
        break;
      case "0":
        exit(0);
      default:
        print("Wrong input try again");
        viewReservations();
    }
  }

  static void offerFood() {
    RestaurantMenu.displayMenu();
  }

  static void viewReserv(Reservation reservation) {
    String keys = "";
    double totalCost = 0;

    print("---------------------------------");
    print("\t${daysOfWeek[reservation.dayOfWeek - 1]}\n \t\tTable №${reservation.tableNumber} - ${reservation.customerName.toUpperCase()}\n \t\tNumber of people - ${reservation.numberOfGuests}");

    if (reservation.mealChoices.isNotEmpty) {
      reservation.mealChoices.forEach((key, value) {
        totalCost += key.price * value;
        keys += key.name.toString();
        keys += " , ";
      });
      keys = keys.substring(0, keys.length - 2);
      print("\t\tMenu - $keys");
      print("\n\t\tTotal Cost: \$$totalCost");
    } else {
      print("\t\tNo meal choices for this reservation.");
      print("\n\t\tTotal Cost: \$0.0");
    }
  }

}

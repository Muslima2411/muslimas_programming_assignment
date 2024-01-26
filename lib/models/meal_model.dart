class Meal{
  late String name;
  late double price;
  late String description;

  Meal({required this.name, required this.price, required this.description });

  @override
  String toString() {
    return '\t$name -\t$price sum';
  }
}
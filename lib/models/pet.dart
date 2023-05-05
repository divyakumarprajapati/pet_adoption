class Pet {
  final int id;
  final String name;
  final int age;
  final double price;
  final String image;
  bool adopted;

  Pet({
    required this.id,
    required this.name,
    required this.age,
    required this.price,
    required this.image,
    this.adopted = false,
  });

  void adopt() {
    adopted = true;
  }

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      price: json['price'],
      image: json['image'],
    );
  }
}

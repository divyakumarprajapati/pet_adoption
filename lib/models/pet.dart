class Pet {
  final int id;
  final String name;
  final int age;
  final double price;
  final String image;

  Pet({
    required this.id,
    required this.name,
    required this.age,
    required this.price,
    required this.image,
  });

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

class Food {
  int id;
  String description;

  Food({this.id, this.description});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json["fdcId"],
      description: json["description"],
    );
  }
}

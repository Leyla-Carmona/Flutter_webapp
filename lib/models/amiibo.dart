class Amiibo {
  String title;
  String img;
  String name;
  String type;

  Amiibo({
    required this.title,
    required this.img,
    required this.name,
    required this.type,
  });

  factory Amiibo.fromJson(Map<String, dynamic> json) {
    return Amiibo(
      title: json['gameSeries'], // Asegúrate de que aquí sea 'gameSeries'
      img: json['image'], // Este también es correcto
      name: json['name'], // Aquí también es correcto
      type: json['type'], // Y este también
    );
  }

  Map<String, dynamic> toJson() {
    return {'image': img, 'gameSeries': title, 'name': name, 'type': type};
  }
}

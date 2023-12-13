class Car {
  late int? id;
  late String? name;
  late String? type;
  late String? description;
  late String? photoUrl;
  late String? videoUrl;
  late String? lat;
  late String? long;

  Car(
      {this.id,
      this.name,
      this.type,
      this.description,
      this.photoUrl,
      this.videoUrl,
      this.lat,
      this.long = ""});

  Car.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['nome'];
    type = json['tipo'];
    description = json['descricao'];
    photoUrl = json['urlFoto'];
    videoUrl = json['urlVideo'];
    lat = json['latitude'];
    long = json['longitude'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['nome'] = name;
    data['tipo'] = type;
    data['descricao'] = description;
    data['urlFoto'] = photoUrl;
    data['urlVideo'] = videoUrl;
    data['latitude'] = lat;
    data['longitude'] = long;
    return data;
  }
}

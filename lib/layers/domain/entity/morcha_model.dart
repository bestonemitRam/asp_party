class MorchaModel {
  dynamic date;
  dynamic title;
  dynamic description;
  dynamic img_url;
  dynamic link_url;
  dynamic city;
  dynamic name;

  MorchaModel(
      {this.img_url,
      this.title,
      this.description,
      this.date,
      this.link_url,
      this.city,
      this.name});

  factory MorchaModel.fromMap(Map<dynamic, dynamic> data) {
    return MorchaModel(
      img_url: data['img_url'],
      title: data['title'],
      description: data['description'],
      date: data['date'],
      link_url: data['link_url'],
      city: data['city'],
      name: data['name'],
    );
  }
  factory MorchaModel.fromJson(Map<String, dynamic> json) {
    return MorchaModel(
      img_url: json['img_url'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      link_url: json['link_url'],
      city: json['city'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'img_url': img_url,
      'title': title,
      'description': description,
      'date': date,
      'link_url': link_url,
      'city': city,
      'name': name,
    };
  }
}

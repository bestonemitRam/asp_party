class NewsModel {

  dynamic date;
  dynamic title;
  dynamic description;
  dynamic img_url;
 



  NewsModel({this.img_url, this.title, this.description, this.date});

  factory NewsModel.fromMap(Map<dynamic, dynamic> data)
   {
    return NewsModel(
      img_url: data['img_url'],
      title: data['title'],
      description: data['description'],
            date: data['date'],
    );
  }
  factory NewsModel.fromJson(Map<String, dynamic> json)
   {
    return NewsModel(
      img_url: json['img_url'],
      title: json['title'],
      description: json['description'],
       date: json['date'],
    );
  }

  Map<String, dynamic> toJson() 
  {
    return 
    {
      'img_url': img_url,
      'title': title,
      'description': description,
       'date': date,
    };
  }
}

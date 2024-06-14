class VideoMode 
{
  dynamic video_url;

  dynamic title;
   dynamic description;

  VideoMode({
    this.video_url,
    this.title,
     this.description
  });

  factory VideoMode.fromMap(Map<dynamic, dynamic> data) {
    return VideoMode(
      video_url: data['video_url'],
        title: data['title'],
              description: data['description'],
    );
  }
  factory VideoMode.fromJson(Map<String, dynamic> json) {
    return VideoMode(
      video_url: json['video_url'],
      title: json['title'],
          description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'video_url': video_url,
        'title': title,
           'description': description,
    };
  }
}

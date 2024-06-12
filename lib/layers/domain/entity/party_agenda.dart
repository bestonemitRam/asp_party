class PartyAgendaModel {
 
  dynamic img;
 
  PartyAgendaModel(
      {
      this.img,
     });

  factory PartyAgendaModel.fromMap(Map<dynamic, dynamic> data) {
    return PartyAgendaModel(
     
      img: data['img'],
     
    );
  }
  factory PartyAgendaModel.fromJson(Map<String, dynamic> json) {
    return PartyAgendaModel(
    
      img: json['img'],
    
    );
  }

  Map<String, dynamic> toJson() {
    return {
     
      'img': img,
    
    };
  }
}

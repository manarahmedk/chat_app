class Message{
  String? message;
  String? id;
  DateTime? createdAt;

  Message({this.message,this.id, this.createdAt});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    createdAt=json['createdAt'].toDate();
    id=json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['createdAt'] = createdAt;
    data['id'] = id;

    return data;
  }
}
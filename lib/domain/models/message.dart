import 'package:equatable/equatable.dart';

class Message extends Equatable {
  String id;
  String text;
  String? userId;

  String time;

  Message({
    required this.id,
    required this.text,
    this.userId,
    required this.time,
  });
  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        text: json["text"],
        userId: json["user_id"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['userId'] = this.userId;
    data['time'] = this.time;
    return data;
  }

  @override
  List<Object?> get props => [id, text, userId, time];
}

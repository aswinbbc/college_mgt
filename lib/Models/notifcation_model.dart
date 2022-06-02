class NotficationModel {
  String? id;
  String? subject;
  String? message;

  NotficationModel({this.id, this.subject, this.message});

  NotficationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subject'] = this.subject;
    data['message'] = this.message;
    return data;
  }
}

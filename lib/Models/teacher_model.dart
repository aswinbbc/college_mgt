class Teacher {
  String? tName;
  String? subId;
  String? tEmail;
  String? tPhone;

  Teacher({this.tName, this.subId, this.tEmail, this.tPhone});

  Teacher.fromJson(Map<String, dynamic> json) {
    tName = json['t_name'];
    subId = json['sub_id'];
    tEmail = json['t_email'];
    tPhone = json['t_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['t_name'] = this.tName;
    data['sub_id'] = this.subId;
    data['t_email'] = this.tEmail;
    data['t_phone'] = this.tPhone;
    return data;
  }
}

class Student {
  String? regNo;
  String? name;
  String? department;
  String? email;
  String? mobile;

  Student({this.regNo, this.name, this.department, this.email, this.mobile});

  Student.fromJson(Map<String, dynamic> json) {
    regNo = json['reg_no'];
    name = json['name'];
    department = json['department'];
    email = json['email'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reg_no'] = this.regNo;
    data['name'] = this.name;
    data['department'] = this.department;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    return data;
  }
}

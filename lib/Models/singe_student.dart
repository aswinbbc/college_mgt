class SingleStudent {
  String? id;
  String? departmentId;
  String? semId;
  String? regNo;
  String? rollNo;
  String? name;
  String? email;
  String? mobile;
  String? address;

  SingleStudent(
      {this.id,
      this.departmentId,
      this.semId,
      this.regNo,
      this.rollNo,
      this.name,
      this.email,
      this.mobile,
      this.address});

  SingleStudent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departmentId = json['department_id'];
    semId = json['sem_id'];
    regNo = json['reg_no'];
    rollNo = json['roll_no'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['department_id'] = this.departmentId;
    data['sem_id'] = this.semId;
    data['reg_no'] = this.regNo;
    data['roll_no'] = this.rollNo;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    return data;
  }
}

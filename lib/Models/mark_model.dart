class Mark {
  String? sub1;
  String? mark1;
  String? sub2;
  String? mark2;
  String? sub3;
  String? mark3;
  String? sub4;
  String? mark4;
  String? sub5;
  String? mark5;
  String? sub6;
  String? mark6;

  Mark(
      {this.sub1,
      this.mark1,
      this.sub2,
      this.mark2,
      this.sub3,
      this.mark3,
      this.sub4,
      this.mark4,
      this.sub5,
      this.mark5,
      this.sub6,
      this.mark6});

  Mark.fromJson(Map<String, dynamic> json) {
    sub1 = json['sub1'];
    mark1 = json['mark1'];
    sub2 = json['sub2'];
    mark2 = json['mark2'];
    sub3 = json['sub3'];
    mark3 = json['mark3'];
    sub4 = json['sub4'];
    mark4 = json['mark4'];
    sub5 = json['sub5'];
    mark5 = json['mark5'];
    sub6 = json['sub6'];
    mark6 = json['mark6'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub1'] = this.sub1;
    data['mark1'] = this.mark1;
    data['sub2'] = this.sub2;
    data['mark2'] = this.mark2;
    data['sub3'] = this.sub3;
    data['mark3'] = this.mark3;
    data['sub4'] = this.sub4;
    data['mark4'] = this.mark4;
    data['sub5'] = this.sub5;
    data['mark5'] = this.mark5;
    data['sub6'] = this.sub6;
    data['mark6'] = this.mark6;
    return data;
  }
}

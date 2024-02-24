class SignUpModel{
  String id,firstName,lastName,userName,email,phoneNumber,profilePic;
  DateTime monthTime,yearTime;
  bool ispayment;
  SignUpModel({
    required this.email,
    required this.phoneNumber,
    required this.userName,
    required this.lastName,
    required this.firstName,
    required this.id,
    required this.monthTime,
    required this.yearTime,
    required this.profilePic,
    this.ispayment=false
});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['userName'] = this.userName;
    data['yearTime'] = this.yearTime;
    data['monthTime'] = this.monthTime;
    data['lastName'] = this.lastName;
    data['firstName'] = this.firstName;
    data['id'] = this.id;
    data['profilePic'] = this.profilePic;
    data['ispayment'] = this.ispayment;
    return data;
  }

}
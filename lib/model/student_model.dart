class StudentModel {
  String? id;
  String? name;
  int? phone;
  String? email;
  String? address;

  StudentModel({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.address,
  });

  StudentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
    };
  }
}

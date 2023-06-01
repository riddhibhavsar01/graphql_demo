
class Data {
  Data({
    required this.customer,
  });
  late final Customer customer;

  Data.fromJson(Map<String, dynamic>? json){
    customer = Customer.fromJson(json?['customer']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['customer'] = customer.toJson();
    return _data;
  }
}

class Customer {
  Customer({
    required this.firstname,
    required this.lastname,
    this.suffix,
    required this.email,
    this.dob,
    this.gender,
    required this.addresses,
  });
  late final String firstname;
  late final String lastname;
  late final Null suffix;
  late final String email;
  late final Null dob;
  late final Null gender;
  late final List<dynamic> addresses;

  Customer.fromJson(Map<String, dynamic> json){
    firstname = json['firstname'];
    lastname = json['lastname'];
    suffix = null;
    email = json['email'];
    dob = null;
    gender = null;
    addresses = List.castFrom<dynamic, dynamic>(json['addresses']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['firstname'] = firstname;
    _data['lastname'] = lastname;
    _data['suffix'] = suffix;
    _data['email'] = email;
    _data['dob'] = dob;
    _data['gender'] = gender;
    _data['addresses'] = addresses;
    return _data;
  }
}


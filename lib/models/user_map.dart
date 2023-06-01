import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserMap{
  late String _name;
  late String _id;
  late LatLng _lastKnownLocation;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  LatLng get lastKnownLocation => _lastKnownLocation;

  set lastKnownLocation(LatLng value) {
    _lastKnownLocation = value;
  }

  set id(String value) {
    _id = value;
  }

  UserMap(this._name, this._id, this._lastKnownLocation);
}


List<UserMap> getUsers(){
  List<UserMap> list = [];
  list.add(UserMap('abc', '1', LatLng(28.625550000000004,77.3732)));
  list.add(UserMap('pqr', '2', LatLng(28.626760000000004,77.37417)));
  list.add(UserMap('xyz', '3', LatLng(28.627920000000003,77.37425)));
  list.add(UserMap('jwt', '4', LatLng(28.628850000000003,77.37437)));
  list.add(UserMap('stu', '5', LatLng(28.63064,77.37421)));
 return list;

}
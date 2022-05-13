import 'package:hive/hive.dart';
part 'User.g.dart';

@HiveType(typeId: 0)
class UserData extends HiveObject {
  @HiveField(0)
  final String UID;
  @HiveField(1)
  final String? city;
  @HiveField(2)
  final String fullName;
  @HiveField(3)
  final String? streetAddress;

  UserData(
      {required this.UID,
      this.city,
      required this.fullName,
      this.streetAddress});
  Map<String, dynamic> toMap() {
    return {
      'UID': UID,
      'fullName': fullName,
      'city': city,
      'streetAddress': streetAddress
    };
  }

  UserData.fromMap(Map<String, dynamic> map)
      : UID = map["UID"],
        city = map["city"],
        fullName = map["fullName"],
        streetAddress = map["streetAddress"];
}

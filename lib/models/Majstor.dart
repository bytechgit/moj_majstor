class Majstor {
  final String UID;
  final String? city;
  final String fullName;
  final String? streetAddress;
  final double? score;
  final String? phoneNumber;

  const Majstor(
      {required this.UID,
      this.city,
      required this.fullName,
      this.streetAddress,
      this.phoneNumber,
      this.score});
  Map<String, dynamic> toMap() {
    return {
      'UID': UID,
      'fullName': fullName,
      'city': city,
      'streetAddress': streetAddress,
      'score': score,
      'phoneNumber': phoneNumber
    };
  }

  Majstor.fromMap(Map<String, dynamic> map)
      : UID = map["UID"],
        city = map["city"],
        fullName = map["fullName"],
        streetAddress = map["streetAddress"],
        score = map["score"],
        phoneNumber = map["phoneNumber"];
}

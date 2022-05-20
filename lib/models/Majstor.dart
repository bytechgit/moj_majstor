class MajstorModel {
  final String UID;
  final String? city;
  final String fullName;
  final String? streetAddress;
  final String? phoneNumber;
  final List<String>? occupation;
  final String? description;
  final double? rate;
  final int? reviewsNumber;
  final int? recommendationNumber;
  final String? profilePicture;
  final String? primaryOccupation;

  MajstorModel(
      {required this.UID,
      this.city,
      required this.fullName,
      this.streetAddress,
      this.phoneNumber,
      this.occupation,
      this.description,
      this.rate = 0,
      this.reviewsNumber,
      this.recommendationNumber,
      this.profilePicture,
      this.primaryOccupation});
  Map<String, dynamic> toMap() {
    return {
      'UID': UID,
      'fullName': fullName,
      'city': city,
      'streetAddress': streetAddress,
      'phoneNumber': phoneNumber,
      'occupation': occupation,
      'rate': rate,
      'reviewsNumber': reviewsNumber,
      'recommendationNumber': recommendationNumber,
      'profilePicture': profilePicture,
      'primaryOccupation': primaryOccupation
    };
  }

  MajstorModel.fromMap(Map<String, dynamic> map)
      : UID = map["UID"],
        city = map["city"],
        fullName = map["fullName"],
        streetAddress = map["streetAddress"],
        phoneNumber = map["phoneNumber"],
        occupation = (((map["occupation"] ?? []) as List<dynamic>)
            .map((e) => e.toString())
            .toList()),
        description = map["description"],
        rate = ((map["rate"]) ?? 0).toDouble(),
        reviewsNumber = map["reviewsNumber"],
        recommendationNumber = map["recommendationNumber"],
        profilePicture = map["profilePicture"],
        primaryOccupation = map["primaryOccupation"];
}

class ReviewModel {
  late String profileImage;
  late String fullName;
  late double rate;
  String? commentText;

  ReviewModel({
    required String profileImage,
    required String fullName,
    required double rate,
    String? commentText,
  }) {
    this.profileImage = profileImage;
    this.fullName = fullName;
    this.rate = rate;
    this.commentText = commentText;
  }
}

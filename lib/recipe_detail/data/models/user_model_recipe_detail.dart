class UserModelInRecipeDetail {
  final int id;
  final String username, fullName, image;

  UserModelInRecipeDetail({
    required this.id,
    required this.username,
    required this.fullName,
    required this.image
  });

  factory UserModelInRecipeDetail.fromJson(Map<String, dynamic> json) {
    return UserModelInRecipeDetail(
      id: json['id'],
      username: json['username'],
      fullName: json['fullName'],
      image: json['profilePhoto'],
    );
  }
}

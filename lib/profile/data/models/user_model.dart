class UserModel {
  final int id, recipesCount, followingCount, followerCount;
  final String profilePhoto, username, presentation, fullName;

  UserModel({
    required this.id,
    required this.recipesCount,
    required this.followingCount,
    required this.followerCount,
    required this.profilePhoto,
    required this.username,
    required this.presentation,
    required this.fullName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      recipesCount: json["recipesCount"],
      followingCount: json["followingCount"],
      followerCount: json["followerCount"],
      profilePhoto: json["profilePhoto"],
      username: json["username"],
      presentation: json["presentation"],
      fullName: json["fullName"],
    );
  }
}

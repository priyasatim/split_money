class UserData {
  String name;
  String email;
  List<UserData> friends; // List of friends as UserData objects
  bool isLogin;

  UserData({
    required this.name,
    required this.email,
    this.friends = const [],
    required this.isLogin,

  });

  // Convert UserData to JSON format for Firestore
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "friends": friends.map((friend) => friend.toJson()).toList(),
      "isLogin": isLogin,
    };
  }

  // Factory method to create UserData from JSON
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json["name"],
      email: json["email"],
      friends: (json["friends"] as List<dynamic>?)
          ?.map((friendJson) => UserData.fromJson(friendJson))
          .toList() ??
          [],
      isLogin: json["isLogin"],

    );
  }
}
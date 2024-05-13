import "package:complete/models/personality.dart";
import "package:complete/models/profile.dart";
class UserModel{
  final String? id;
  final String? email;
  final bool? isVerified;
  final List<String>? conversations;
  final PersonalityModel? personality;
  final ProfileModel? profile;
  UserModel({this.id, this.email, this.isVerified, this.conversations, this.personality, this.profile});
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": email,
      "isVerified": isVerified,
      "conversations": conversations,
      "personality": personality?.toMap(),
      "profile": profile?.toMap(),
    };
  }
  static UserModel makeUser(data){
    return UserModel(
      id: data["id"],
      email: data["email"],
      isVerified: data["isVerified"],
      conversations: data["conversations"],
      personality: PersonalityModel.makePersonality(data["personality"]),
      profile: ProfileModel.makeProfile(data["profile"]),
    );
  }
}
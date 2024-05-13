import "package:complete/models/gender_prefs.dart";
class ProfileModel{
  final int? age;
  final int? maxAge;
  final int? minAge;
  final bool? emailNotifications;
  final String? gender;
  final String? firstName;
  final String? lastName;
  final GenderPrefModel? genderPrefs;
  final int? qScore;
  final int? qAnswered;
  final bool? completed;
  ProfileModel({this.age, this.maxAge, this.minAge, this.emailNotifications, this.gender, this.firstName, this.lastName, this.genderPrefs, this.qScore, this.qAnswered, this.completed});
  // Checks if the profile is complete
  bool get isProfileComplete{
    bool partA = age != null && maxAge != null && minAge != null && emailNotifications != null;
    bool partB = gender != null && firstName != null && lastName != null && genderPrefs != null && qScore != null && qAnswered != null;
    return partA && partB;
  }

  Map<String, dynamic> toMap() {
    return {
      "age": age,
      "maxAge": maxAge,
      "minAge": minAge,
      "emailNotifications": emailNotifications,
      "gender": gender,
      "firstName": firstName,
      "lastName": lastName,
      "genderPrefs": genderPrefs?.toMap(),
      "qScore": qScore,
      "qAnswered": qAnswered,
    };
  }

  static ProfileModel makeProfile(Map<String, dynamic> data){
    return ProfileModel(
      age: data["age"],
      maxAge: data["maxAge"],
      minAge: data["minAge"],
      emailNotifications: data["emailNotifications"],
      gender: data["gender"],
      firstName: data["firstName"],
      lastName: data["lastName"],
      genderPrefs: GenderPrefModel.makeGenderPref(data["genderPrefs"]), 
      qScore: data["qScore"],
      qAnswered: data["qAnswered"],
    );
  }
}
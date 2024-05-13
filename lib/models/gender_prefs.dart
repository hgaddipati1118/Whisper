class GenderPrefModel {
  final bool? male;
  final bool? female;
  final bool? nonBinary;
  final bool? all;
  final String? other;
  GenderPrefModel(
      {this.male, this.female, this.nonBinary, this.all, this.other});
  Map<String, dynamic> toMap() {
    return {
      "male": male,
      "female": female,
      "nonBinary": nonBinary,
      "all": all,
      "other": other,
    };
  }

  static GenderPrefModel makeGenderPref(Map<String, dynamic> data) {
    return GenderPrefModel(
        all: data["all"],
        male: data['male'],
        female: data['female'],
        nonBinary: data['nonBinary'],
        other: data['other']);
  }
}

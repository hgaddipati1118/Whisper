class PersonalityModel{
  final int? ambition;
  final int? ambitionCount;
  final int? communication;
  final int? communicationCount;
  final int? creativity;
  final int? creativityCount;
  final int? compassion;
  final int? compassionCount;
  final int? expressiveness;
  final int? expressivenessCount;
  final int? humor;
  final int? humorCount;
  final int? extraversion;
  final int? extraversionCount;
  final int? flexibility;
  final int? flexibilityCount;
  final int? optimism;
  final int? optimismCount;
  final int? spontaneity;
  final int? spontaneityCount;
  PersonalityModel({this.ambition, this.ambitionCount, this.communication, this.communicationCount, this.creativity, this.creativityCount, this.compassion, this.compassionCount, this.expressiveness, this.expressivenessCount, this.humor, this.humorCount, this.extraversion, this.extraversionCount, this.flexibility, this.flexibilityCount, this.optimism, this.optimismCount, this.spontaneity, this.spontaneityCount});
  Map<String, dynamic> toMap() {
    return {
      "ambition": ambition,
      "ambitionCount": ambitionCount,
      "communication": communication,
      "communicationCount": communicationCount,
      "creativity": creativity,
      "creativityCount": creativityCount,
      "compassion": compassion,
      "compassionCount": compassionCount,
      "expressiveness": expressiveness,
      "expressivenessCount": expressivenessCount,
      "humor": humor,
      "humorCount": humorCount,
      "extraversion": extraversion,
      "extraversionCount": extraversionCount,
      "flexibility": flexibility,
      "flexibilityCount": flexibilityCount,
      "optimism": optimism,
      "optimismCount": optimismCount,
      "spontaneity": spontaneity,
      "spontaneityCount": spontaneityCount,
    };
  }
  
  static PersonalityModel makePersonality(Map<String, dynamic> data){
    return PersonalityModel(
      ambition: data["ambition"],
      ambitionCount: data["ambitionCount"],
      communication: data["communication"],
      communicationCount: data["communicationCount"],
      creativity: data["creativity"],
      creativityCount: data["creativityCount"],
      compassion: data["compassion"],
      compassionCount: data["compassionCount"],
      expressiveness: data["expressiveness"],
      expressivenessCount: data["expressivenessCount"],
      humor: data["humor"],
      humorCount: data["humorCount"],
      extraversion: data["extraversion"],
      extraversionCount: data["extraversionCount"],
      flexibility: data["flexibility"],
      flexibilityCount: data["flexibilityCount"],
      optimism: data["optimism"],
      optimismCount: data["optimismCount"],
      spontaneity: data["spontaneity"],
      spontaneityCount: data["spontaneityCount"],
    );
  }

}
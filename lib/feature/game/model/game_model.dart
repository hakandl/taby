class GameModel {
  String? word;
  String? taboo;

  GameModel({
    this.word,
    this.taboo,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      word: json['word'] as String?,
      taboo: json['taboo'] as String?,
    );
  }
}

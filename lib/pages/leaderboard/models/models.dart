import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class RankingsResponse {
  @JsonKey(name: 'rankingLandingModels')
  final List<PlayerRanking> rankings;

  RankingsResponse({
    required this.rankings,
  });
  factory RankingsResponse.fromJson(Map<String, dynamic> json) =>
      _$RankingsResponseFromJson(json);
}

@JsonSerializable()
class PlayerRanking {
  final String playerFullName;
  final int rankThisWeek;

  PlayerRanking({
    required this.playerFullName,
    required this.rankThisWeek,
  });

  factory PlayerRanking.fromJson(Map<String, dynamic> json) =>
      _$PlayerRankingFromJson(json);
}

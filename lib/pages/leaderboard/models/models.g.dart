// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankingsResponse _$RankingsResponseFromJson(Map<String, dynamic> json) =>
    RankingsResponse(
      rankings: (json['rankingLandingModels'] as List<dynamic>)
          .map((e) => PlayerRanking.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RankingsResponseToJson(RankingsResponse instance) =>
    <String, dynamic>{
      'rankingLandingModels': instance.rankings,
    };

PlayerRanking _$PlayerRankingFromJson(Map<String, dynamic> json) =>
    PlayerRanking(
      playerFullName: json['playerFullName'] as String,
      rankThisWeek: json['rankThisWeek'] as int,
    );

Map<String, dynamic> _$PlayerRankingToJson(PlayerRanking instance) =>
    <String, dynamic>{
      'playerFullName': instance.playerFullName,
      'rankThisWeek': instance.rankThisWeek,
    };

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:midam_wagr/pages/leaderboard/models/models.dart';
import 'package:provider/provider.dart';

const midAmRankingsUrl =
    '/rankings/getRankings?rankingsType=0&pageNumber=4&week=0&year=2021&region=0&countries=&playerName=&county=&pageSize=50&playerIDs=&age=25&asOfDate=2023-09-09&includeFirstStats=false&sortString=&isRangeUnder=false&isRangeOver=true&isThisAgeOnly=false&date=';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: context
            .read<Dio>()
            .get<Map<String, dynamic>>(midAmRankingsUrl)
            .then((value) {
          final data = value.data;

          if (data == null) return <PlayerRanking>[];

          return RankingsResponse.fromJson(data).rankings;
        }),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemBuilder: (context, index) {
              final ranking = snapshot.data![index];
              return ListTile(
                leading: Text('${index + 1}'),
                title: Text(ranking.playerFullName),
              );
            },
            itemCount: snapshot.data?.length ?? 0,
          );
        },
      ),
    );
  }
}

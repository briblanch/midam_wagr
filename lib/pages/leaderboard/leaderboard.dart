import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:midam_wagr/pages/leaderboard/models/models.dart';
import 'package:provider/provider.dart';

const midAmRankingsUrl = '/api/rankings';

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

          return Center(
            child: SizedBox(
              width: 400,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final ranking = snapshot.data![index];
                  return ListTile(
                    leading: Text('${index + 1}'),
                    title: Text(ranking.playerFullName),
                  );
                },
                itemCount: snapshot.data?.length ?? 0,
              ),
            ),
          );
        },
      ),
    );
  }
}

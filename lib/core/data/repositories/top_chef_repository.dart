import 'package:recipe_app/core/client.dart';

import '../models/top_chef_model_small.dart';

class TopChefRepository {
  TopChefRepository({required this.client});

  final ApiClient client;

  List<TopChefModelSmall> topChefsHome = [];

  Future<List<TopChefModelSmall>> fetchTopChefs(int limit) async {
    if (topChefsHome.isNotEmpty) return topChefsHome;

    var rawChefs = await client.fetchTopChefs(limit);
    topChefsHome = rawChefs.map((chef) => TopChefModelSmall.fromJson(chef)).toList();
    return topChefsHome;
  }
}

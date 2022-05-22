import '../../../../core/network/api_provider.dart';
import '../datasources/api_urls.dart';
import '../models/commit_list_response.dart';

class CommitListRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<CommitListResponse>> fetchCommitListResponse(
      int numberOfCommits) async {
    final response = await _apiProvider
        .getWithoutBearer('$commitApiUrl?$perPageApiUrl$numberOfCommits');
    return (response as Iterable)
        .map((response) => CommitListResponse.fromJson(response))
        .toList();
  }
}

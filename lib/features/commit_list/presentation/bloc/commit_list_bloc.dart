import 'dart:async';

import '/core/network/response.dart';
import '../../data/models/commit_list_response.dart';
import '../../data/repositories/commit_list_repository.dart';

class CommitListBloc {
  final CommitListRepository _commitListRepository = CommitListRepository();
  final StreamController<Response<List<CommitListResponse>>> _streamController =
      StreamController<Response<List<CommitListResponse>>>();

  StreamSink<Response<List<CommitListResponse>>> get chunkListSink =>
      _streamController.sink;
  Stream<Response<List<CommitListResponse>>> get chunkListStream =>
      _streamController.stream;

  CommitListBloc(int numberOfCommits) {
    fetchCommitList(numberOfCommits);
  }

  fetchCommitList(int numberOfCommits) async {
    chunkListSink.add(Response.loading('Fetching User Data...'));
    try {
      List<CommitListResponse> commitListResponse =
          await _commitListRepository.fetchCommitListResponse(numberOfCommits);
      chunkListSink.add(Response.completed(commitListResponse));
    } catch (e) {
      chunkListSink.add(Response.error(e.toString()));
    }
  }

  dispose() {
    _streamController.close();
  }
}

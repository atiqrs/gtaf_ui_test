import 'dart:async';

import '/core/network/response.dart';
import '../../data/models/commit_list_response.dart';
import '../../data/repositories/commit_list_repository.dart';

class CommitListBloc {
  CommitListRepository? _commitListRepository = CommitListRepository();
  StreamController<Response<CommitListResponse>> _streamController = StreamController<Response<CommitListResponse>>();

  StreamSink<Response<CommitListResponse>> get chunkListSink => _streamController.sink;
  Stream<Response<CommitListResponse>> get chunkListStream => _streamController.stream;

  CommitListBloc(int numberOfCommits) {
    fetchCommitList(numberOfCommits);
  }

  fetchCommitList(int numberOfCommits) async {
    chunkListSink.add(Response.loading('Fetching User Data...'));
    try {
      CommitListResponse commitListResponse = await _commitListRepository!.fetchCommitListResponse(numberOfCommits);
      chunkListSink.add(Response.completed(commitListResponse));
    } catch (e) {
      chunkListSink.add(Response.error(e.toString()));
    }
  }

  dispose() {
    _streamController.close();
  }
}

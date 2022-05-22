import 'dart:async';

import '/core/network/response.dart';
import '../../data/models/user_profile_response.dart';
import '../../data/repositories/user_profile_repository.dart';

class UserProfileBloc {
  final UserProfileRepository _userProfileRepository = UserProfileRepository();
  final StreamController<Response<UserProfileResponse>> _streamController =
      StreamController<Response<UserProfileResponse>>();

  StreamSink<Response<UserProfileResponse>> get chunkListSink =>
      _streamController.sink;
  Stream<Response<UserProfileResponse>> get chunkListStream =>
      _streamController.stream;

  UserProfileBloc(int numberOfCommits) {
    fetchUserProfile(numberOfCommits);
  }

  fetchUserProfile(int numberOfCommits) async {
    chunkListSink.add(Response.loading('Fetching User Data...'));
    try {
      UserProfileResponse userProfileResponse =
          await _userProfileRepository.fetchUserProfileResponse();
      chunkListSink.add(Response.completed(userProfileResponse));
    } catch (e) {
      chunkListSink.add(Response.error(e.toString()));
    }
  }

  dispose() {
    _streamController.close();
  }
}

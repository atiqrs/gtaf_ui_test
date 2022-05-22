import 'dart:async';

import 'package:gtaf_ui_test/features/user_profile/data/models/user_profile_response.dart';
import 'package:gtaf_ui_test/features/user_profile/data/repositories/user_profile_repository.dart';

import '/core/network/response.dart';

class UserProfileBloc {
  final UserProfileRepository _userProfileRepository = UserProfileRepository();
  final StreamController<Response<UserProfileResponse>> _streamController =
      StreamController<Response<UserProfileResponse>>();

  StreamSink<Response<UserProfileResponse>> get chunkListSink =>
      _streamController.sink;
  Stream<Response<UserProfileResponse>> get chunkListStream =>
      _streamController.stream;

  UserProfileBloc() {
    fetchUserProfile();
  }

  fetchUserProfile() async {
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

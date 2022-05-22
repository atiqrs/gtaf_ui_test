import '../../../../core/network/api_provider.dart';
import '../datasources/api_urls.dart';
import '../models/user_profile_response.dart';

class UserProfileRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<UserProfileResponse> fetchUserProfileResponse() async {
    final response = await _apiProvider.getWithoutBearer(userProfileApiUrl);
    return UserProfileResponse.fromJson(response);
  }
}

import '../../http/index.dart';
import '../../models/others/user_secret.dart';
import '../../models/response/user/auth_response.dart';
import '../../models/response/user/user_model.dart';

class UserRepository extends API {
  static const String _loginUser = "/user/login";
  static const String _getAllUser = "/user/all";
  static const String _getUserInfo = "/user/info/";

  Future<AuthResponse> loginUser({required String email, required String password}) async {
    return httpRequest(
      path: _loginUser,
      method: HttpMethod.post,
      requiredToken: false,
      data: {
        "email": email,
        "password": password,
      },
      onSuccess: (response) {
        return AuthResponse.fromJson(response.data[DATA_FIELD]);
      },
    );
  }

  Future<UserListResponse> fetchUserList({int page = 1, int count = 99999}) async {
    return httpRequest(
      path: _getAllUser,
      query: {
        "page": page,
        "count": count,
      },
      onSuccess: (response) {
        return UserListResponse.fromJson(response.data);
      },
    );
  }

  Future<UserModel> fetchUserInfo() async {
    String? userId = UserSecret.instance.userId;
    if (userId == null) {
      throw SessionExpiredException();
    }
    return httpRequest(
      path: _getUserInfo + userId,
      onSuccess: (response) {
        return UserModel.fromJson(response.data[DATA_FIELD]);
      },
    );
  }
}

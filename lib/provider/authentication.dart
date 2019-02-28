abstract class BaseAuth {
  Future<String> getCurrentUser();
  Future<String> getUserState();
}

class Auth implements BaseAuth {
  Future<String> getCurrentUser() async {}
  Future<String> getUserState() async {}
}

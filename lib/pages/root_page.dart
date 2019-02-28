import 'package:flutter/material.dart';
import '../provider/authentication.dart';
import '../pages/home.dart';
import '../pages/login.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

enum AuthStatus {
  NOT_LOGGED_IN,
  LOGGED_IN,
  NOT_DETERMINED,
}

//Build the page
class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userData = "";

  void initState() {
    super.initState();
    //widget.auth.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return _loadingScreen();
        break;

      case AuthStatus.NOT_LOGGED_IN:
        return new LoginPage();
        break;
      case AuthStatus.LOGGED_IN:
        return new HomePage(userdata: _userData);
        break;
      default:
        return _loadingScreen();
    }
  }

//onesignal

//list Widget
  Widget _loadingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}

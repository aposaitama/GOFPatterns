abstract class AuthHandler {
  AuthHandler? nextHandler;

  void setNext(AuthHandler handler) {
    nextHandler = handler;
  }

  bool check(String username, String password);
}

class BaseAuthHandler extends AuthHandler {
  @override
  bool check(String username, String password) {
    //if nexthandler not missed (!null), then ruck check() method, otherwise return true.
    return nextHandler?.check(username, password) ?? true;
  }
}

class UsernamePasswordHandler extends BaseAuthHandler {
  final Map<String, String> validUsers = {
    'user1': 'password1',
    'user2': 'password2'
  };

  @override
  bool check(String username, String password) {
    if (validUsers[username] == password) {
      print('Username and password are correct.');
      //next
      return super.check(username, password);
    } else {
      print('Invalid username or password.');
      return false;
    }
  }
}

class ActiveUserHandler extends BaseAuthHandler {
  final List<String> activeUsers = ['user1', 'user2'];

  @override
  bool check(String username, String password) {
    if (activeUsers.contains(username)) {
      print('User is active.');
      //next
      return super.check(username, password);
    } else {
      print('User is inactive.');
      return false;
    }
  }
}

class AccessLevelHandler extends BaseAuthHandler {
  final List<String> adminUsers = ['user1'];

  @override
  bool check(String username, String password) {
    if (adminUsers.contains(username)) {
      print('User has admin access.');
      //next
      return super.check(username, password);
    } else {
      print('User does not have the required access level.');
      return false;
    }
  }
}

void main() {
  final usernamePasswordHandler = UsernamePasswordHandler();
  final activeUserHandler = ActiveUserHandler();
  final accessLevelHandler = AccessLevelHandler();

  //cor
  usernamePasswordHandler.setNext(activeUserHandler);
  activeUserHandler.setNext(accessLevelHandler);

  print('--- Authentication Attempt 1 ---');
  bool result = usernamePasswordHandler.check('user1', 'password1');
  print('Authentication result: $result\n');

  print('--- Authentication Attempt 2 ---');
  result = usernamePasswordHandler.check('user2', 'wrong_password');
  print('Authentication result: $result\n');

  print('--- Authentication Attempt 3 ---');
  result = usernamePasswordHandler.check('user2', 'password2');
  print('Authentication result: $result');
}

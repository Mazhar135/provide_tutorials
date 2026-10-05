import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    setLoading(true); // start spinner

    try {
      Response response = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          'email': email,
          'password': password,
        },
      ).timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        print('Successful');
      } else {
        print('failed: ${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      setLoading(false); // ALWAYS stop spinner
    }
  }
}
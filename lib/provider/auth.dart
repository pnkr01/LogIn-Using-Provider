import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;
import 'package:stl_provider/global.dart';

class AuthProvider with ChangeNotifier {
  bool isLoading = false;
  bool get loading => isLoading;
  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void login(String email, String password, BuildContext context) async {
    setLoading(true);
    try {
      var response = await https.post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        showSnackBar(context, "Sucessfull");
        setLoading(false);
      } else {
        setLoading(false);
        showSnackBar(context, "Unsucessfull");
      }
    } catch (e) {
      showSnackBar(context, e.toString());
      setLoading(false);
    }
  }
}

import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/model/user.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:amazon_clone/utility/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // sign up user
  void signUpUser({
    required String email,
    required String password,
    required BuildContext context,
    required String name,
  }) async {
    try {
      User user = User(
        id: "id",
        name: name,
        email: email,
        password: password,
        address: "address",
        type: "type",
        token: "token",
        cart: [],
      );
      print(user.toJson());
      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: jsonEncode(user.toJson()),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      print(res.body);
      httpErrorHandle(
          response: res,
          context: context,
          onSucess: () => showSnackBar(
              context, 'Account Created! Login with the same Credentials!'));
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
  }

  //signin
  void signInUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({"email": email, "password": password}),
          headers: <String, String>{
            // used when using expressjs
            'Content-Type': 'application/json; charset=UTF-8',
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSucess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            print(jsonDecode(res.body));
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            print("done before prefs" + jsonDecode(res.body)['token']);
            await prefs.setString(
                'X-auth-token', jsonDecode(res.body)['token']);
            print(
              "done after prefs",
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              BottomBar.routeName,
              (route) => false,
            );
          });
    } catch (e) {
      print('error$e');
      showSnackBar(context, e.toString());
    }
  }

  void getUserData(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('X-auth-token');
      if (token == null) {
        prefs.setString('X-auth-token', '');
      } else {
        var tokenRes = await http
            .post(Uri.parse('$uri/tokenIsValid'), headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'X-auth-token': token,
        });
        var response = jsonDecode(tokenRes.body);
        if (response) {
          // get user Data
          http.Response userRes =
              await http.get(Uri.parse('$uri/'), headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'X-auth-token': token,
          });

          var userProvider = Provider.of<UserProvider>(context, listen: false);
          userProvider.setUser(userRes.body);
        }
      }
    } catch (e) {
      print("error in getuserData$e");
      showSnackBar(context, e.toString());
    }
  }
}

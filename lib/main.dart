import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:amazon_clone/model/user.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:amazon_clone/router.dart';
import 'package:amazon_clone/utility/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:dcdg/dcdg.dart';

void main() async {
  await dotenv.load(fileName: ".env"); // Load environment variables
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Amazon Clone",
        theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: GlobalVariables.greyBackgroundCOlor,
          colorScheme: const ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          ),
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  static const String routeName = '/main';
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user;
  final authService = AuthService();
  @override
  void initState() {
    authService.getUserData(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('main-starting');
    // print(Provider.of<UserProvider>(context).user.token);
    if (Provider.of<UserProvider>(context).user.token.isNotEmpty) {
      user = Provider.of<UserProvider>(context).user;
      print(user!.type);
      print(user!.type == 'admin');
    }
    // return const BottomBar();
    if (user != null) {
      if (user!.type == 'admin') {
        return const AdminScreen();
      } else {
        return const BottomBar();
      }
    } else {
      return const AuthScreen();
    }
  }
}

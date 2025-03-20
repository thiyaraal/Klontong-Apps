import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kelontong_app/core/helpers/provider_documentation.dart'
    // ignore: library_prefixes
    as AppProviders;
import 'package:kelontong_app/core/helpers/routing_documentations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.getProviders(),
      child: MaterialApp(
        title: 'Kelontong App',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: AppRoutes.login,
        onGenerateRoute: AppRoutes.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

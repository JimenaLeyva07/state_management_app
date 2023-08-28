import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_app/services/user_service.dart';

import 'pages/page_one.dart';
import 'pages/page_two.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserService(),
        )
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        initialRoute: 'pageOne',
        routes: {
          //Si son más de 4 rutas, es mejor ponerla en otra pag
          'pageOne': (context) => const PageOne(),
          'pageTwo': (context) => const PageTwo()
        },
      ),
    );
  }
}

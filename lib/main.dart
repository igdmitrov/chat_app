import 'package:chat_app/app_service.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart' as provider;

import 'chat_page.dart';
import 'home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'supabase_url',
    anonKey: 'anonKey',
  );

  runApp(
    provider.MultiProvider(
      providers: [
        provider.ChangeNotifierProvider<AppService>(
          create: (_) => AppService(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(),
      routes: {
        '/chat': (_) => const ChatPage(),
      },
    );
  }
}

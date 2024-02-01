import 'package:contact_diary/controller/data_controller.dart';
import 'package:contact_diary/views/screens/add_contact_page.dart';
import 'package:contact_diary/views/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => dataProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      routes: {
        '/': (context) => const HomePage(),
        'add_contact': (context) => const AddContact(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gemini_chat_api/core/helpers/hive_helper.dart';
import 'features/ai_chat/ui/screens/ai_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await HiveHelper().hiveInit();
  try {
    await dotenv.load(fileName: 'assets/.env');
  } catch (e) {
    print('Could not load .env file: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter AI integration',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const AisScreen(),
    );
  }
}

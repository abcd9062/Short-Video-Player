import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:short_video_streaming_demo/presentation/ui/screens/home_screen.dart';
import 'package:short_video_streaming_demo/presentation/ui/screens/video_player_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:short_video_streaming_demo/presentation/viewmodels/video_player_viewmodel.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context) => VideoPlayerViewModel(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:game_workspace/common/app_router.dart';
import 'package:game_workspace/providers/apple_catch_provider.dart';
import 'package:game_workspace/providers/bird_fluffy_provider.dart';
import 'package:game_workspace/providers/dress_up_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BirdFluffyProvider()),
        ChangeNotifierProvider(create: (_) => DressUpProvider()),
        ChangeNotifierProvider(create: (_) => AppleCatchProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,

        routerConfig: AppRouter.router,
      ),
    );
  }
}
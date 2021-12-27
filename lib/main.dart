import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweetraga/dataFiles/appStateNotifier.dart';
import 'package:sweetraga/dataFiles/pageLocate.dart';
import 'package:sweetraga/dataFiles/themeData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<AppStateNotifer>(
    create: (context) => AppStateNotifer(),
    child: SweetRaga(),
  ));
}

class SweetRaga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifer>(
      builder: (context, appState, child) {
        return MaterialApp(
          title: 'Sweet Raga',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: appState.isdarkModeOn ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          routes: pages,
        );
      },
    );
  }
}

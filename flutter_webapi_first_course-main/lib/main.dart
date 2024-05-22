import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/models/journal.dart';
import 'package:flutter_webapi_first_course/screens/add_journal_screen/add_journal_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());

  // JournalService service = JournalService();
  // service.register(Journal.empty());
  // service.getAll();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Journal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        appBarTheme: const AppBarTheme(
          color: Colors.black38,
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        textTheme: GoogleFonts.hammersmithOneTextTheme(),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      initialRoute: "home",
      routes: {
        'home': (context) => const HomeScreen(),
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == 'add-journal') {
          Map<String, dynamic> map = settings.arguments as Map<String, dynamic>;
          final Journal journal = map['journal'] as Journal;
          final bool isEditing = map['is_editing'];
          return MaterialPageRoute(builder: (context) {
            return AddJournalScreen(
              journal: journal,
              isEditing: isEditing,
            );
          });
        }
        return null;
      },
    );
  }
}

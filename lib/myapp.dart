import 'package:flutter/material.dart';
import 'package:contact_manager/models/agenda_data.dart';
import 'package:contact_manager/pages/contacts_page.dart';
import 'package:contact_manager/utils/contacts_example.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AgendaData>(
        create: (context) => agenda,
        child: MaterialApp(
          title: 'Agenda Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ContactsPage(),
        ));
  }
}

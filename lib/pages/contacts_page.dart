import 'package:flutter/material.dart';
import 'package:contact_manager/models/agenda_data.dart';
import 'package:contact_manager/pages/widgets/contacts_list.widget.dart';
import 'package:contact_manager/utils/get_icon_sort.dart';
import 'package:provider/provider.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    AgendaData agenda = Provider.of<AgendaData>(context);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    icon: Icon(getIconSort(agenda.sortOrder)),
                    onPressed: () {
                      agenda.toggleSortOrder();
                    }),
                IconButton(icon: Icon(Icons.filter_alt), onPressed: () {})
              ],
            ),
            body: TabBarView(children: [
              ContactsList(
                contacts: agenda.contacts,
              ),
              ContactsListFavorite(
                contacts: agenda.contacts,
              )
            ]),
            bottomNavigationBar: TabBar(tabs: [
              Tab(icon: Icon(Icons.contacts)),
              Tab(
                icon: Icon(Icons.star),
              )
            ])));
  }
}

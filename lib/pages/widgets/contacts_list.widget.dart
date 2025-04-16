import 'package:flutter/material.dart';
import 'package:contact_manager/models/contact_data.dart';
import 'package:contact_manager/pages/widgets/contacts_tile.widget.dart';

class ContactsList extends StatelessWidget {
  final List<ContactData> contacts;
  const ContactsList({required this.contacts, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: contacts.length,
        padding: EdgeInsets.all(16.0),
        separatorBuilder: (context, index) => Divider(
              height: 16.0,
            ),
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ContactsTile(contact: contact);
        });
  }
}

class ContactsListFavorite extends StatelessWidget {
  final List<ContactData> contacts;
  const ContactsListFavorite({required this.contacts, super.key});

  @override
  Widget build(BuildContext context) {
    final List<ContactData> favorites =
        contacts.where((c) => c.isFavorite).toList();
    return ListView.separated(
        itemCount: favorites.length,
        padding: EdgeInsets.all(16.0),
        separatorBuilder: (context, index) => Divider(
              height: 16.0,
            ),
        itemBuilder: (context, index) {
          final contact = favorites[index];
          return ContactsTile(contact: contact);
        });
  }
}

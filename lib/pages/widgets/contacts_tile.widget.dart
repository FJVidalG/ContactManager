import 'package:flutter/material.dart';
import 'package:contact_manager/models/contact_data.dart';
import 'package:contact_manager/pages/contact_details_page.dart';
import 'package:contact_manager/utils/get_icon_label.dart';

class ContactsTile extends StatelessWidget {
  final ContactData contact;
  const ContactsTile({required this.contact, super.key});

  void _navigationToDetails(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ContactDetailsPage(contact: contact),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: contact,
        builder: (context, child) {
          return ListTile(
              onTap: () => _navigationToDetails(context),
              leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(getIconLabel(contact.label))),
              title: Row(
                children: [
                  Expanded(
                    child:
                        Text("${contact.name ?? ""} ${contact.surname ?? ""}"),
                  ),
                  if (contact.isFavorite) Icon(Icons.star)
                ],
              ),
              subtitle: Text(
                (contact.email != null && contact.phone != null)
                    ? [contact.email, contact.phone].join(", ")
                    : (contact.email ?? contact.phone) ?? "",
              ),
              trailing: PopupMenuButton<ContactMenuAction>(
                  onSelected: (action) {
                    if (action == ContactMenuAction.view) {
                      _navigationToDetails(context);
                    }
                  },
                  itemBuilder: (context) => [
                        PopupMenuItem(
                            value: ContactMenuAction.view,
                            child: Row(children: [
                              Icon(Icons.remove_red_eye),
                              SizedBox(width: 12),
                              Text("Ver")
                            ])),
                        PopupMenuItem(
                            value: ContactMenuAction.edit,
                            child: Row(children: [
                              Icon(Icons.edit),
                              SizedBox(width: 12),
                              Text("Editar")
                            ])),
                        PopupMenuItem(
                            value: ContactMenuAction.delete,
                            child: Row(children: [
                              Icon(Icons.delete),
                              SizedBox(width: 12),
                              Text("Eliminar")
                            ]))
                      ]));
        });
  }
}

//Enum para implementar en el futuro las acciones del PopupMenuButton
enum ContactMenuAction { view, edit, delete }

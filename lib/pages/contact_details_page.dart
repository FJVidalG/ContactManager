import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:contact_manager/models/contact_data.dart';
import 'package:contact_manager/utils/calculate_age.dart';
import 'package:contact_manager/utils/get_icon_label.dart';

class ContactDetailsPage extends StatefulWidget {
  final ContactData contact;

  const ContactDetailsPage({required this.contact, super.key});

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetailsPage> {
  late TextEditingController _ageController;
  late TextEditingController _birthdateController;
  late TextEditingController _labelsController;
  bool _change =
      false; // variable para saber si se ha cambiado algo (favorito y/o etiquetas)

  @override
  void initState() {
    super.initState();
    _ageController = TextEditingController(
        text: widget.contact.birthdate != null
            ? calculateAge(widget.contact.birthdate!).toString()
            : "0");

    _birthdateController = TextEditingController(
        text: widget.contact.birthdate != null
            ? DateFormat('MMM dd, yyyy').format(widget.contact.birthdate!)
            : "N/A");

    _labelsController = TextEditingController(
        text: widget.contact.label != null
            ? widget.contact.label.join(', ')
            : 'N/A');
  }

  @override
  void dispose() {
    // Actualizar modificación al cerrar la página si hubo cambios
    if (_change) {
      widget.contact.modification = DateTime.now();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon:
              Icon(widget.contact.isFavorite ? Icons.star : Icons.star_border),
          onPressed: () {
            setState(() {
              widget.contact.isFavorite = !widget.contact.isFavorite;
              _change = true;
            });
          },
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.edit))
      ]),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
                radius: 70,
                backgroundColor: Colors.grey,
                child: Icon(getIconLabel(widget.contact.label), size: 70)),
            Text(
              "${widget.contact.name}",
              style: TextStyle(fontSize: 32),
            ),
            TextField(
                controller:
                    TextEditingController(text: "${widget.contact.email}"),
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Correo de contacto",
                  suffix: Icon(Icons.email),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text("Enviando email a ${widget.contact.email}")));
                }),
            TextField(
                controller:
                    TextEditingController(text: "${widget.contact.phone}"),
                readOnly: true,
                decoration: InputDecoration(
                    labelText: "Teléfono",
                    suffix: Icon(Icons.phone),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0)),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Llamando al ${widget.contact.phone}")));
                }),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                  flex: 2,
                  child: TextField(
                      controller: _birthdateController,
                      readOnly: true,
                      decoration: InputDecoration(
                          labelText: "Cumpleaños",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 5.0)))),
              Expanded(
                  child: TextField(
                controller: _ageController,
                readOnly: true,
                decoration: InputDecoration(
                    labelText: "Edad",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0)),
              ))
            ]),
            TextField(
              readOnly: true,
              controller: _labelsController,
              decoration: InputDecoration(
                labelText: "Etiquetas",
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
              ),
              onTap: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: _labelsController,
                            keyboardType: TextInputType.text,
                            autofocus: true,
                          ),
                          const SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                widget.contact.label =
                                    _labelsController.text.split(', ');
                                _change = true;
                              });
                              Navigator.of(context).pop();
                            },
                            child: const Text("Guardar"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Creado el ${widget.contact.creation != null ? DateFormat('yyyy-MM-dd hh:mm').format(widget.contact.creation!) : 'N/A'}",
            ),
            Text(
              "Modificado el ${widget.contact.modification != null ? DateFormat('yyyy-MM-dd hh:mm').format(widget.contact.modification!) : 'N/A'}",
            ),
          ],
        ),
      ),
    );
  }
}

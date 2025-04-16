import 'package:flutter/material.dart';
import 'package:contact_manager/models/contact_data.dart';

class ContactFormPage extends StatefulWidget {
  final ContactData contact;

  const ContactFormPage({super.key, required this.contact});

  @override
  State<ContactFormPage> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _surnameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _birthdateController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.contact.name ?? "");
    _surnameController =
        TextEditingController(text: widget.contact.surname ?? "");
    _phoneController = TextEditingController(text: widget.contact.phone ?? "");
    _emailController = TextEditingController(text: widget.contact.email ?? "");
    _birthdateController =
        TextEditingController(text: widget.contact.birthdate.toString());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _birthdateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.contact.id == 0
                ? "Nuevo contacto"
                : "Edición de contacto"),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.check))]),
        body: Form(
          key: _formKey,
          child: ListView(padding: const EdgeInsets.all(16.0), children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                  labelText: "Nombre", border: OutlineInputBorder()),
            ),
            TextFormField(
                controller: _surnameController,
                decoration: InputDecoration(
                    labelText: "Apellidos", border: OutlineInputBorder())),
            TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                    labelText: "Teléfono", border: OutlineInputBorder())),
            TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: "Correo", border: OutlineInputBorder())),
            TextFormField(
                controller: _birthdateController,
                decoration: InputDecoration(
                    labelText: "Fecha de nacimiento",
                    border: OutlineInputBorder()))
          ]),
        ));
  }
}

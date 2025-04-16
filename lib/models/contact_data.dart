import 'package:flutter/foundation.dart';

class ContactData extends ChangeNotifier {
  int id;
  String? name;
  String? surname;
  String? email;
  String? phone;
  DateTime? birthdate;
  DateTime? creation;
  DateTime? modification;
  bool _isFavorite;
  List<String> _label;

  ContactData({
    required this.id,
    this.name,
    this.surname,
    this.email,
    this.phone,
    this.birthdate,
    this.creation,
    this.modification,
    bool isFavorite = false,
    List<String>? label,
  })  : _isFavorite = isFavorite,
        _label = label ?? [];

  bool get isFavorite => _isFavorite;
  set isFavorite(bool value) {
    if (_isFavorite == value) return;
    _isFavorite = value;
    modification = DateTime.now();
    notifyListeners();
  }

  List<String> get label => _label;
  set label(List<String> value) {
    if (listEquals(_label, value)) return;
    _label = value;
    modification = DateTime.now();
    notifyListeners();
  }

  factory ContactData.fromJson(Map<String, dynamic> data) {
    return ContactData(
      id: data["id"] ?? 0,
      name: data["name"],
      surname: data["surname"],
      email: data["email"],
      phone: data["phone"],
      creation: DateTime.tryParse(data["creation"]),
      modification: DateTime.tryParse(data["modification"]),
      isFavorite: data["isFavorite"] ?? false,
      label: data["label"] != null ? List.from(data["label"]) : [],
    );
  }

  @override
  String toString() {
    return "ContactData(\n${[
      "ID: $id",
      if (name != null) "Nombre: $name",
      if (surname != null) "Apellido: $surname",
      if (email != null) "email: $email",
      if (phone != null) "Teléfono: $phone",
      if (creation != null) "Cumpleaños: $birthdate",
      if (creation != null) "Creación: $creation",
      if (modification != null) "Modificación: $modification",
      if (isFavorite) "Es favorito",
      if (label.isNotEmpty) "Etiquetas: ${label.join(", ")}",
    ].map((e) => "\t$e").join(",\n")}\n)";
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      if (name != null) "name": name,
      if (surname != null) "surname": surname,
      if (email != null) "email": email,
      if (phone != null) "phone": phone,
      if (creation != null) "Creación": birthdate!.toIso8601String(),
      if (creation != null) "creation": creation!.toIso8601String(),
      if (modification != null) "modification": modification!.toIso8601String(),
      if (isFavorite) "isFavorite": true,
      if (label.isNotEmpty) "label": List.from(label),
    };
  }

  ContactData copyWith(
      {int? id,
      String? name,
      String? surname,
      String? email,
      String? phone,
      DateTime? birthdate,
      DateTime? creation,
      DateTime? modification,
      bool? isFavorite,
      List<String>? label}) {
    return ContactData(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      birthdate: birthdate ?? this.birthdate,
      creation: creation ?? this.creation,
      modification: modification ?? this.modification,
      isFavorite: isFavorite ?? this.isFavorite,
      label: label ?? List.from(this.label),
    );
  }

  void copyValuesFrom(ContactData source) {
    id = source.id;
    name = source.name;
    surname = source.surname;
    email = source.email;
    phone = source.phone;
    birthdate = source.birthdate;
    creation = source.creation;
    modification = source.modification;
    isFavorite = source.isFavorite;
    label = List.from(source.label);
  }
}

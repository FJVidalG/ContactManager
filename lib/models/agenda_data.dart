import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';

import 'contact_data.dart';

class AgendaData extends ChangeNotifier {
  List<ContactData> _originalContacts = [];
  List<ContactData> _displayedContacts = [];
  SortOrder _currentSortOrder = SortOrder.none;

  AgendaData({List<ContactData>? contacts}) {
    _originalContacts = List.from(contacts ?? []);
    _displayedContacts = List.from(_originalContacts);
  }

  List<ContactData> get contacts => _displayedContacts;
  SortOrder get sortOrder => _currentSortOrder;

  void toggleSortOrder() {
    switch (_currentSortOrder) {
      case SortOrder.none:
        _applySort(true);
        _currentSortOrder = SortOrder.ascending;
        break;
      case SortOrder.ascending:
        _applySort(false);
        _currentSortOrder = SortOrder.descending;
        break;
      case SortOrder.descending:
        _applySort(true);
        _currentSortOrder = SortOrder.ascending;
        break;
    }
    notifyListeners();
  }

  void _applySort(bool ascending) {
    _displayedContacts.sort((a, b) {
      final nameA = removeDiacritics(a.name?.toLowerCase() ?? "");
      final nameB = removeDiacritics(b.name?.toLowerCase() ?? "");
      return ascending ? nameA.compareTo(nameB) : nameB.compareTo(nameA);
    });
  }

  @override
  String toString() {
    return contacts.map((e) => e.toString()).join(",\n");
  }

  AgendaData copyWith({List<ContactData>? contacts}) {
    return AgendaData(
        contacts: contacts ?? this.contacts.map((e) => e.copyWith()).toList());
  }

  Map<String, dynamic> toJson() {
    return {
      if (contacts.isNotEmpty) "contacts": contacts.map((e) => e.toJson())
    };
  }

  factory AgendaData.fromJson(Map<String, dynamic> data) {
    return AgendaData(
        contacts: data["contacts"] != null
            ? List.from(
                data["contacts"].map((e) => ContactData.fromJson(e)).toList())
            : []);
  }
}

enum SortOrder { none, ascending, descending }

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:contact_manager/models/agenda_data.dart';

IconData getIconSort(SortOrder sortOrder) {
  switch (sortOrder) {
    case SortOrder.ascending:
      return FontAwesomeIcons.arrowDownZA;

    case SortOrder.descending:
      return FontAwesomeIcons.arrowDownAZ;
    case SortOrder.none:
    default:
      return FontAwesomeIcons.arrowDownAZ;
  }
}

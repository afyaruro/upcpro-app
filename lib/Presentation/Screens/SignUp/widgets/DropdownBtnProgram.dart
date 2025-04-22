import 'package:flutter/material.dart';
import 'package:upcpro_app/Domain/Entities/Program/ProgramEntity.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

// ignore: non_constant_identifier_names
Widget DropdownBtnProgram({
  required String hintText,
  required List<ProgramEntity> items,
  required ProgramEntity selectedItem,
  required Function(ProgramEntity?) onChanged,
  required BuildContext context,
  required IconData icon,
}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 55,
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    decoration: BoxDecoration(
      color: const Color.fromARGB(55, 180, 182, 180),
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(icon, color: colorText()),
        const SizedBox(width: 10),
        Expanded(
          child: DropdownButtonHideUnderline(
            child: DropdownButton<ProgramEntity>(
              dropdownColor: Color.fromARGB(255, 255, 255, 255),
              elevation: 0,
              value: items.contains(selectedItem) ? selectedItem : items.first,
              hint: Text(hintText, style: TextStyle(color: colorText())),
              icon: Icon(Icons.arrow_drop_down, color: colorText()),
              style: TextStyle(color: colorText(), fontWeight: FontWeight.w600),
              onChanged: onChanged,
              items:
                  items.map((item) {
                    return DropdownMenuItem<ProgramEntity>(
                      value: item,
                      child: Text(item.name),
                    );
                  }).toList(),
              isExpanded: true,
            ),
          ),
        ),
      ],
    ),
  );
}

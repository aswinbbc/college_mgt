import 'package:flutter/material.dart';
import 'package:professor_interface/utils/network_service.dart';
import 'package:select_form_field/select_form_field.dart';

class SemDropdown extends StatefulWidget {
  const SemDropdown({Key? key, required this.onChange}) : super(key: key);
  final Function(String) onChange;
  @override
  State<SemDropdown> createState() => _SemDropdownState();
}

class _SemDropdownState extends State<SemDropdown> {
  List<Map<String, dynamic>> _items = [];

  String selected = "";
  @override
  void initState() {
    getSem().then((value) {
      setState(() {
        _items = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SelectFormField(
      type: SelectFormFieldType.dropdown, // or can be dialog
      initialValue: '',
      labelText: 'Semester',
      items: _items,
      onChanged: widget.onChange,
    );
  }

  Future<List<Map<String, dynamic>>> getSem() async {
    List jsonList = await getData("view_sem.php");

    return jsonList
        .map((e) => {'value': e['id'].toString(), 'label': e['name']})
        .toList();
  }
}

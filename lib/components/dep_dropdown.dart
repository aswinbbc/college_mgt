import 'package:flutter/material.dart';
import 'package:ihrd/utils/network_service.dart';
import 'package:select_form_field/select_form_field.dart';

class depDropdown extends StatefulWidget {
  const depDropdown({Key? key, required this.onChange}) : super(key: key);
  final Function(String) onChange;
  @override
  State<depDropdown> createState() => _depDropdownState();
}

class _depDropdownState extends State<depDropdown> {
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
      labelText: 'department',
      items: _items,
      onChanged: widget.onChange,
    );
  }

  Future<List<Map<String, dynamic>>> getSem() async {
    List jsonList = await getData("view_department.php");

    return jsonList
        .map((e) => {'value': e['id'].toString(), 'label': e['name']})
        .toList();
  }
}

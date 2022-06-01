import 'package:flutter/material.dart';
import 'package:professor_interface/components/dep_dropdown.dart';
import 'package:professor_interface/components/sem_dropdown.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: depDropdown(
        onChange: ((p0) => print(p0)),
      ),
    );
  }
}

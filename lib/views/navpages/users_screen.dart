// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({ Key? key }) : super(key: key);

  @override
  _UsersScreentate createState() => _UsersScreentate();
}

class _UsersScreentate extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
        title: Text(
          "Users",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
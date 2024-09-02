// ignore_for_file: prefer_const_constructors, avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: searchController,
                  onEditingComplete: () {
                    debugPrint('Search input filled');
                    print(searchController.text.trim());
                  },
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Card(
                shape: CircleBorder(),
                elevation: 5,
                color: Colors.green,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.camera_alt_outlined),
                  color: Colors.white,
                ),
              )
           
            ],
          ),
        ),
      ),
    );
  }
}

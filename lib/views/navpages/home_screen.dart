// ignore_for_file: library_private_types_in_public_api, avoid_print, prefer_const_constructors

import 'package:fake_store/models/product.dart';
import 'package:fake_store/service/request.dart';
import 'package:fake_store/views/utils/category_menu.dart';
import 'package:fake_store/views/utils/product_grid.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  bool loading = true;
  bool seek = true;
  List<Product?> products = [];
  List categories = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final responses = await Future.wait([
        get('/products'),
        get('/products/categories'),
      ]);

      setState(() {
        loading = false;
        seek = false;
        products = (responses[0].data as List)
            .map((data) => Product.fromMap(data))
            .toList();
        categories = responses[1].data;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Card(
              shape: CircleBorder(),
              elevation: 5,
              color: Colors.green,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.camera_alt_outlined),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
            CategoryMenu(loading: seek, categories: categories),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Selling",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ProductGrid(loading: loading, products: products)
          ],
        ),
      ),
    );
  }
}

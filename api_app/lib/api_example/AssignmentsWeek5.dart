import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Assignments extends StatefulWidget {
  const Assignments({super.key});

  @override
  State<Assignments> createState() => _AssignmentsState();
}

class _AssignmentsState extends State<Assignments> {
  List<Product> ProductList = [];
  @override
  void initState() {
    super.initState();
    fetchAllUser();
  }

  void fetchAllUser() async {
    try {
      var response = await http.get(
        Uri.parse('http://localhost:8001/products'),
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        setState(() {
          ProductList = jsonList.map((item) => Product.fromJson(item)).toList();
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Product'),
        actions: [
          ElevatedButton(
            onPressed: () {
              fetchAllUser();
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: ProductList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text('${ProductList[index].id}'),
            title: Text('${ProductList[index].name}'),
            trailing: Text('Descrition : ${ProductList[index].description}'),
            subtitle: Text('Price : ${ProductList[index].price}'),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }
}

class Product {
  final int id;
  final String name;
  final String description;
  final double price;

  Product(this.id, this.name, this.description, this.price);

  Product.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      description = json['description'],
      price = json['price'];
}

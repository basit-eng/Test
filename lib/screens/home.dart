import 'package:flutter/material.dart';
import 'package:theaccount/screens/products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
          centerTitle: true,
          elevation: 0.4,
          backgroundColor: Colors.amber[400],
        ),
        body: Center(
          child: ElevatedButton(
            child: Text("Load Data"),
            style: ElevatedButton.styleFrom(
                textStyle: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600),
                onPrimary: Colors.green,
                elevation: 0,
                surfaceTintColor: Colors.orange),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => ProductScreen())));
            },
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theaccount/bloc/product_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<ProductBloc>().add(ProductLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: ((context, state) {
          if (state is Productloadingstate) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is Productloaddedstate) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return Card(
                  // leading: Text(state.products[index].id.toString()),
                  margin: EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        padding: EdgeInsets.all(18),
                        child: Image.network(
                          state.products[index].image.toString(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          state.products[index].title.toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(state.products[index].category.toString(),
                                textAlign: TextAlign.left),
                            Text(
                              state.products[index].price.toString(),
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            state.products[index].description.toString(),
                            textAlign: TextAlign.left),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(08.0),
                        child: Text(
                            state.products[index].rating!.rate.toString(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.left),
                      )
                    ],
                  ),
                );
              },
            );
          } else if (state is Producterrorstate) {
            return Center(
              child: Text(state.error),
            );
          }
          return SizedBox();
        }),
      ),
    );
  }
}

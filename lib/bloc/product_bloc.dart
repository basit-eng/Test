import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:theaccount/repo/products_repo.dart';

import '../models/products_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductLoadedEvent, ProductState> {
  ProductRepo productRepo;
  ProductBloc(this.productRepo) : super(Productloadingstate()) {
    on<ProductLoadedEvent>((event, emit) async {
      try {
        emit(Productloadingstate());
        var data = await productRepo.getProucts();
        print(data);
        emit(Productloaddedstate(data));
      } catch (e) {
        emit(
          Producterrorstate(
            e.toString(),
          ),
        );
      }
    });
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shipper_app/app/storage_service.dart';
import 'package:shipper_app/product/bloc/product_event.dart';
import 'package:shipper_app/product/bloc/product_state.dart';

import '../controllers/product_controller.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(
    this.productController,
  ) : super(const ProductState()) {
    on<ProductInitiated>(
      _onProductInitiated,
    );
    on<ProductsByBrandIdFetched>(
      _onProductsByBrandIdFetched,
    );

    on<OrderStatusChanged>(
      _onOrderStatusChanged,
    );
    on<OrderByIdFetchd>(
      _onOrderByIdFetchd,
    );
  }
  final storageService = StorageService();
  final ProductController productController;
  FutureOr<void> _onProductInitiated(
    ProductInitiated event,
    Emitter<ProductState> emit,
  ) async {}

  FutureOr<void> _onProductsByBrandIdFetched(
    ProductsByBrandIdFetched event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final order = await productController.fetchOrder();
      emit(state.copyWith(order: order, isLoading: false));
    } catch (error) {
      emit(state.copyWith(isLoading: false));
    }
  }

  FutureOr<void> _onOrderStatusChanged(
    OrderStatusChanged event,
    Emitter<ProductState> emit,
  ) async {
    try {
      final accessToken = await storageService.getToken();
      if (accessToken != null) {
        final userId = await storageService.getUserId();
        if (userId != null) {
          await productController.changeOrderStatus(
            event.orderId,
            event.status,
            event.context!,
          );
          emit(state.copyWith(status: event.status));
        }
      }
    } catch (error) {}
  }

  FutureOr<void> _onOrderByIdFetchd(
    OrderByIdFetchd event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final order = await productController.fetchOrderById(event.orderId);
      emit(state.copyWith(orderById: order));
    } catch (error) {
      emit(state.copyWith(isLoading: false));
    }
  }
}

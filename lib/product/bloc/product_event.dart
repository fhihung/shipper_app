import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_event.freezed.dart';

abstract class ProductEvent {
  const ProductEvent();
}

@freezed
class ProductInitiated extends ProductEvent with _$ProductInitiated {
  const factory ProductInitiated() = _ProductInitiated;
}

@freezed
class ProductsByBrandIdFetched extends ProductEvent with _$ProductsByBrandIdFetched {
  const factory ProductsByBrandIdFetched({
    required int userId,
  }) = _ProductsByBrandIdFetched;
}

@freezed
class AddProductPressed extends ProductEvent with _$AddProductPressed {
  const factory AddProductPressed({
    required int productId,
  }) = _AddProductPressed;
}

@freezed
class OrderStatusChanged extends ProductEvent with _$OrderStatusChanged {
  const factory OrderStatusChanged({
    required int orderId,
    required int status,
    BuildContext? context,
  }) = _OrderStatusChanged;
}

@freezed
class OrderByIdFetchd extends ProductEvent with _$OrderByIdFetchd {
  const factory OrderByIdFetchd({
    required int orderId,
    BuildContext? context,
  }) = _OrderByIdFetchd;
}

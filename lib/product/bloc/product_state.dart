import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipper_app/models/m_check_out.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    @Default('') String errorMessage,
    @Default(false) bool isLoading,
    @Default(<MCheckOut>[]) List<MCheckOut> order,
    BuildContext? context,
    MCheckOut? orderById,
    int? status,
  }) = _ProductState;
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/m_category_product.dart';
import '../../models/m_product.dart';
import '../../models/m_user.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default('') String errorMessage,
    @Default(false) bool isLoading,
    @Default(<MProduct>[]) List<MProduct> newProducts,
    @Default(<MCategoryProduct>[]) List<MCategoryProduct> categoryProducts,
    MUser? user,
  }) = _HomeState;
}

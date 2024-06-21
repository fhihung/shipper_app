import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shipper_app/models/m_user.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(false) bool isLoading,
    @Default(false) bool isCompleteOnboarding,
    MUser? user,
    String? token,
  }) = _AppState;
}

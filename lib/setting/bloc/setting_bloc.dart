import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shipper_app/app/storage_service.dart';
import 'package:shipper_app/setting/bloc/setting_event.dart';
import 'package:shipper_app/setting/bloc/setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(const SettingState()) {
    on<SettingInitiated>(
      _onSettingInitiated,
    );
  }
  StorageService storageService = StorageService();

  FutureOr<void> _onSettingInitiated(
    SettingInitiated event,
    Emitter<SettingState> emit,
  ) async {}
}

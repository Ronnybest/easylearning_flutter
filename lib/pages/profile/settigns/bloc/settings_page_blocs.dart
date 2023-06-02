import 'package:easylearning/pages/profile/settigns/bloc/settigns_page_events.dart';
import 'package:easylearning/pages/profile/settigns/bloc/settings_page_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBlocs extends Bloc<SettingsEvents, SettingsStates> {
  SettingsBlocs() : super(const SettingsStates()) {
    on<TriggerSettings>(_triggerSettings);
  }

  _triggerSettings(SettingsEvents event, Emitter<SettingsStates> emit) {
    emit(const SettingsStates());
  }
}

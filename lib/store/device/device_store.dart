import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'device_state.dart';

class DeviceStore extends Cubit<DeviceState> {
  DeviceStore()
      : super(const DeviceState(
          package: null,
          device: null,
        ));

  Future<void> init() async {
    // todo: parallelize (\w destructuring)
    final device = await DeviceInfoPlugin().deviceInfo;
    final package = await PackageInfo.fromPlatform();
    emit(state.copyWith(
      package: package,
      device: device,
    ));
  }
}

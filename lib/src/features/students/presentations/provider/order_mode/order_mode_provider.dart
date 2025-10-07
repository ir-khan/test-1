import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../utils/enums.dart';

part 'order_mode_provider.g.dart';

@riverpod
class ToggleOrderMode extends _$ToggleOrderMode {
  @override
  OrderMode build() => OrderMode.asc;

  void setOrder(OrderMode newMode) => state = newMode;
}

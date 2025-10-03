import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/enums.dart';

class OrderModeNotifier extends Notifier<OrderMode> {
  @override
  OrderMode build() {
    return OrderMode.asc;
  }

  void setLocale(OrderMode newMode) {
    state = newMode;
  }
}

final orderModeProvider = NotifierProvider<OrderModeNotifier, OrderMode>(
  OrderModeNotifier.new,
);

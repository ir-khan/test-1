import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/order_mode/order_mode_provider.dart';
import '../../../../utils/enums.dart';

class AscDescButton extends ConsumerWidget {
  const AscDescButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderMode = ref.watch(orderModeProvider);
    return IconButton(
      onPressed: () {
        ref
            .read(orderModeProvider.notifier)
            .setLocale(
              orderMode == OrderMode.asc ? OrderMode.desc : OrderMode.asc,
            );
      },
      icon: Icon(switch (orderMode) {
        OrderMode.asc => Icons.arrow_upward_rounded,
        OrderMode.desc => Icons.arrow_downward_rounded,
      }),
    );
  }
}

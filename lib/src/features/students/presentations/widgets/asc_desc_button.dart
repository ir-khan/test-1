import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/order_mode/order_mode_provider.dart';
import '../../../../utils/enums.dart';

class AscDescButton extends ConsumerWidget {
  const AscDescButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderMode = ref.watch(toggleOrderModeProvider);
    return IconButton(
      onPressed: () {
        ref
            .read(toggleOrderModeProvider.notifier)
            .setOrder(
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

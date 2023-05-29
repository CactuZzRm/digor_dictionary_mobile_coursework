import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SocketExceptionWidget extends StatelessWidget {
  const SocketExceptionWidget(this.onRefresh, this.isOnCenter, {super.key});
  final Function() onRefresh;
  final bool isOnCenter;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviceHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: isOnCenter?MainAxisAlignment.center:MainAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: isOnCenter ? 0 : deviceHeight * .15,
        ),
        Text(
          tr('unable_to_load_data'),
          style: theme.textTheme.headlineSmall!.copyWith(fontSize: 17),
        ),
        const SizedBox(height: 8),
        Text(
          tr('check_your_network_connection'),
          style: theme.textTheme.headlineSmall!.copyWith(fontSize: 15, color: Colors.black.withOpacity(.5)),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: onRefresh,
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 80),
          ),
          child: Text(
            tr('retry'),
            style: theme.textTheme.headlineSmall!.copyWith(fontSize: 14, color: Colors.white),
          ),
        ),
      ],
    ).animate().fade();
  }
}

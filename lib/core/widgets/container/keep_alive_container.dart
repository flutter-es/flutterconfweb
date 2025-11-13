import 'package:flutter/material.dart';

class KeepAliveContainer extends StatefulWidget {
  const KeepAliveContainer({required this.child, super.key});

  final Widget child;

  @override
  State<KeepAliveContainer> createState() => _KeepAliveContainerState();
}

class _KeepAliveContainerState extends State<KeepAliveContainer>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}

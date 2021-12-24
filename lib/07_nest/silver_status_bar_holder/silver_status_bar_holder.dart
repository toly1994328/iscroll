import 'package:flutter/material.dart';

class SilverStatusBarHolder extends StatelessWidget {
  const SilverStatusBarHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    SliverPersistentHeader(
      pinned: true,
      delegate: _SilverStatusBarHolderSPHD( MediaQuery.of(context).padding.top),
    );
  }
}

class _SilverStatusBarHolderSPHD extends SliverPersistentHeaderDelegate {
  final double height;
  _SilverStatusBarHolderSPHD(this.height);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: height,
      color: Colors.white,
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant _SilverStatusBarHolderSPHD oldDelegate) {
    return oldDelegate.height != height;
  }
}

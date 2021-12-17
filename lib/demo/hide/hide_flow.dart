import 'dart:async';

import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:svideo/src/bloc/meeting_message/bloc.dart';
// import 'package:svideo/src/bloc/meeting_message/state.dart';
// import 'package:svideo/src/pages/meeting_page/views/meeting_chat_page.dart';
//
// import '../app/res/color_unit.dart';
// import '../components/persistent/feedback_widget.dart';

/// create by 张风捷特烈 on 2021/1/12
/// contact me by email 1981462002@qq.com
/// 说明:

class HideFlow extends StatefulWidget {
  final Widget top;
  final Widget bottom;
  final Widget content;
  final LayerLink layerLink;
  final void Function()? onTapMessageIcon;

  HideFlow(
      {required this.top,
      required this.bottom,
      required this.content,
      required this.layerLink,
      this.onTapMessageIcon});

  @override
  _HideFlowState createState() => _HideFlowState();
}

class _HideFlowState extends State<HideFlow> with TickerProviderStateMixin {
  late AnimationController _ctrl;
  late AnimationController _messageBoxCtrl;
  ValueNotifier<bool> openSide = ValueNotifier(false);
  bool _closed = false;
  bool cancelSchedule = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
            vsync: this, duration: Duration(milliseconds: 300))
        // ..addListener(() {
        //   print("----${_ctrl.value}-----------");
        // })
        ;
    startCloseTimer();
    _messageBoxCtrl =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    // _scheduleClose();
  }

  Timer? _hideTimer;
  Timer? _showTimer;

  void _showTooltip(String message, {bool immediately = false}) {
    _hideTimer?.cancel();
    _hideTimer = null;
    if (immediately) {
      ensureTooltipVisible(message);
      return;
    }
    _showTimer ??= Timer(Duration(seconds: 1), () {
      ensureTooltipVisible(message);
    });
  }

  static const showDuration = Duration(seconds: 3);

  bool ensureTooltipVisible(String message) {
    _showTimer?.cancel();
    _showTimer = null;
    if (_entry != null) {
      // Stop trying to hide, if we were.
      _hideTimer?.cancel();
      _hideTimer = null;
      // _controller.forward();
      Future.delayed(showDuration).then((v) {
        _hideTooltip(immediately: true);
      });
      return false; // Already visible.
    }
    _createNewEntry(message);
    Future.delayed(showDuration).then((v) {
      _hideTooltip(immediately: true);
    });
    // _controller.forward();
    return true;
  }

  void _hideTooltip({bool immediately = false}) {
    _showTimer?.cancel();
    _showTimer = null;
    if (immediately) {
      _removeEntry();
      return;
    }
    // _hideTimer ??= Timer(showDuration, _controller.reverse);
  }

  void _removeEntry() {
    _hideTimer?.cancel();
    _hideTimer = null;
    _showTimer?.cancel();
    _showTimer = null;
    _entry?.remove();
    _entry = null;
  }

  void _createNewEntry(String message) {
    final OverlayState overlayState = Overlay.of(
      //1. 得到 overlayState
      context,
      debugRequiredFor: widget,
    )!;

    // final RenderBox box = context.findRenderObject()! as RenderBox;
    // final Offset target = box.localToGlobal(
    //   box.size.center(Offset.zero),
    //   ancestor: overlayState.context.findRenderObject(),
    // );

    final Widget overlay = Directionality(
        textDirection: Directionality.of(context),
        child: _buildFloating(context, message));
    //2. 创建 _entry
    _entry = OverlayEntry(builder: (BuildContext context) => overlay);
    //3. 插入 _entry
    overlayState.insert(_entry!);
  }

  Timer? _closeTimer;

  void startCloseTimer() {
    _closeTimer?.cancel();
    _closeTimer = null;
    _closeTimer = Timer(Duration(seconds: 3), _hide);
  }

  void cancelCloseTimer() {
    _closeTimer?.cancel();
    _closeTimer = null;
  }

  void _hide() async {
    if (!_closed) {
      print('do hide');
      await _ctrl.forward();
      _closed = !_closed;
    }
  }

  ///绘制悬浮控件
  _buildFloating(context, String content) => Positioned(
        width: 150,
        height: 40,
        bottom: 210,
        left: 10,
        child: Builder(builder: (ctx) {
          return GestureDetector(
              onTap: () {
                _hideTooltip(immediately: true);
                widget.onTapMessageIcon?.call();
              },
              child: CompositedTransformFollower(
                link: widget.layerLink,
                followerAnchor: Alignment.bottomLeft,
                targetAnchor: Alignment.topLeft,
                offset: Offset(0, -10),
                child: Material(
                  elevation: 0,
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      content,
                      maxLines: 2,
                      style: TextStyle(height: 1.1),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ));
        }),
      );

  _scheduleClose() async {
    // 延迟 5 s 自动关闭
    await Future.delayed(Duration(seconds: 5));
    if (!_closed) {
      await _ctrl.forward();
      _closed = !_closed;
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: Scaffold(
        onDrawerChanged: (value) {
          openSide.value = value;
        },
        // drawer: MeetingChatPage(),
        // backgroundColor: ColorUnit.dark_bg_color,
        body: Flow(
          delegate: HideFlowDelegate(
              size: MediaQuery.of(context).size,
              repaint: Listenable.merge([_ctrl, openSide]),
              openSide: openSide,
              topAnim: _ctrl),
          children: [
            widget.top,
            SizedBox.shrink(),
            // FeedbackWidget(
            //   duration: Duration(milliseconds: 100),
            //   onBuildPressed: (ctx) {
            //       widget.onTapMessageIcon?.call();
            //   },
            //   child: BlocListener<MeetingMessageBloc,MeetingMessageState>(
            //     listener: _listenMessageState,
            //     child: SizedBox.shrink(),
            //   ),
            // ),
            widget.content,
            widget.bottom,
          ],
        ),
      ),
    );
  }

  void _toggle() {
    if (_closed) {
      _ctrl.reverse();
      // _scheduleClose();
    } else {
      _ctrl.forward();
    }
    _closed = !_closed;
    print("----_toggle--_closed:-$_closed----------");
    if(!_closed){
      startCloseTimer();
    }
  }

  OverlayEntry? _entry;
  bool isShow = false;

  toggleFloating(BuildContext context) {
    if (_entry == null) return;
    if (!isShow) {
      Overlay.of(context)!.insert(_entry!);
    } else {
      _entry!.remove();
    }
    isShow = !isShow;
  }

//
// Widget _buildByMessageState(BuildContext context, MeetingMessageState state) {
//
//
// }

// void _listenMessageState(BuildContext context, MeetingMessageState state) {
//   if(state is MessageLoadedState){
//     if(!state.messages.last.isMe){
//       _showTooltip('${state.messages.last.username} : ${state.messages.last.content}',immediately: true);
//     }
//     // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//     //     content: Container(
//     // padding: EdgeInsets.symmetric(horizontal: 10),
//     //   alignment: Alignment.centerLeft,
//     //   width: 200,
//     //   height: 40,
//     //   decoration: BoxDecoration(
//     //       color: Colors.grey.withOpacity(0.3),
//     //       borderRadius: BorderRadius.circular(5)
//     //   ),
//     //   child: Text(state.messages.last.content,maxLines:2,style: TextStyle(height: 1.1),overflow: TextOverflow.ellipsis,),
//     // )));
//   }
// }
}

class HideFlowDelegate extends FlowDelegate {
  final Size size;
  final Animation<double> topAnim;
  final ValueNotifier<bool> openSide;

  HideFlowDelegate(
      {required this.size,
      required this.topAnim,
      required this.openSide,
      required Listenable repaint})
      : super(repaint: repaint);

  @override
  void paintChildren(FlowPaintingContext context) {
    assert(context.childCount >= 2);
    final int lastIndex = context.childCount - 1;
    final Size? topSize = context.getChildSize(0);
    final Size? bottomSize = context.getChildSize(lastIndex);

    context.paintChild(2);

    context.paintChild(0,
        transform: Matrix4.translationValues(
            0, -topSize!.height * (topAnim.value), 0));

    context.paintChild(lastIndex,
        transform: Matrix4.translationValues(
            0, size.height - bottomSize!.height * (1 - topAnim.value), 0));

    context.paintChild(1,
        transform: Matrix4.translationValues(
            openSide.value ? size.width * 0.8 + 20 : 10,
            size.height * 0.85,
            0));
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return false;
  }
}

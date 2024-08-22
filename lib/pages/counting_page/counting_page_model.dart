import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'counting_page_widget.dart' show CountingPageWidget;
import 'package:flutter/material.dart';

class CountingPageModel extends FlutterFlowModel<CountingPageWidget> {
  ///  Local state fields for this page.

  int counter = 3;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}

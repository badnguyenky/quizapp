import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'loading_page_model.dart';
export 'loading_page_model.dart';

class LoadingPageWidget extends StatefulWidget {
  const LoadingPageWidget({super.key});

  @override
  State<LoadingPageWidget> createState() => _LoadingPageWidgetState();
}

class _LoadingPageWidgetState extends State<LoadingPageWidget> {
  late LoadingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 1000));
      _model.firstColor = const Color(0xFF65385B);
      _model.secondColor = Colors.white;
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 2000));
      _model.firstColor = const Color(0xCD65385B);
      _model.secondColor = const Color(0xCC394E66);
      setState(() {});

      context.goNamed('HomePage');
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                valueOrDefault<Color>(
                  _model.firstColor,
                  Colors.white,
                ),
                valueOrDefault<Color>(
                  _model.secondColor,
                  const Color(0xFF65385B),
                )
              ],
              stops: const [0.0, 1.0],
              begin: const AlignmentDirectional(0.0, 1.0),
              end: const AlignmentDirectional(0, -1.0),
            ),
          ),
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

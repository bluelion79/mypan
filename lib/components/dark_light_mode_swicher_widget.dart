import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkLightModeSwicherWidget extends StatefulWidget {
  const DarkLightModeSwicherWidget({Key? key}) : super(key: key);

  @override
  _DarkLightModeSwicherWidgetState createState() =>
      _DarkLightModeSwicherWidgetState();
}

class _DarkLightModeSwicherWidgetState extends State<DarkLightModeSwicherWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 350,
      hideBeforeAnimating: false,
      initialState: AnimationState(
        offset: Offset(40, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 350,
      hideBeforeAnimating: false,
      initialState: AnimationState(
        offset: Offset(-40, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if ((Theme.of(context).brightness == Brightness.light))
            InkWell(
              onTap: () async {
                setDarkModeSetting(context, ThemeMode.dark);
                if (animationsMap['containerOnActionTriggerAnimation2'] ==
                    null) {
                  return;
                }
                await (animationsMap['containerOnActionTriggerAnimation2']!
                        .curvedAnimation
                        .parent as AnimationController)
                    .forward(from: 0.0);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFF14181B),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      color: Color(0xFF1A1F24),
                      offset: Offset(0, 0),
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Switch to Dark Mode',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Outfit',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFF1D2429),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional(0, 0),
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.95, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                child: Icon(
                                  Icons.nights_stay,
                                  color: Color(0xFF95A1AC),
                                  size: 20,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.85, 0),
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xFF14181B),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x430B0D0F),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(30),
                                  shape: BoxShape.rectangle,
                                ),
                              ).animated([
                                animationsMap[
                                    'containerOnActionTriggerAnimation1']!
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if ((Theme.of(context).brightness == Brightness.dark))
            InkWell(
              onTap: () async {
                setDarkModeSetting(context, ThemeMode.light);
                if (animationsMap['containerOnActionTriggerAnimation1'] ==
                    null) {
                  return;
                }
                await (animationsMap['containerOnActionTriggerAnimation1']!
                        .curvedAnimation
                        .parent as AnimationController)
                    .forward(from: 0.0);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFF14181B),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      color: Color(0xFF1A1F24),
                      offset: Offset(0, 0),
                    )
                  ],
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Switch to Light Mode',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Outfit',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFF1D2429),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional(0, 0),
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.9, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 2, 0, 0),
                                child: Icon(
                                  Icons.wb_sunny_rounded,
                                  color: Color(0xFF95A1AC),
                                  size: 24,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.9, 0),
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xFF14181B),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x430B0D0F),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(30),
                                  shape: BoxShape.rectangle,
                                ),
                              ).animated([
                                animationsMap[
                                    'containerOnActionTriggerAnimation2']!
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTimeRange? calendarSelectedDay;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: GetPlanSheetCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final calendarGetPlanSheetResponse = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavBarPage(initialPage: 'myTasks'),
                  ),
                );
              },
            ),
            title: Text(
              '달력',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontSize: 22,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowCalendar(
                    color: FlutterFlowTheme.of(context).primaryColor,
                    weekFormat: false,
                    weekStartsMonday: false,
                    initialDate: getCurrentTimestamp,
                    onChange: (DateTimeRange? newSelectedDate) {
                      setState(() => calendarSelectedDay = newSelectedDate);
                    },
                    titleStyle: TextStyle(),
                    dayOfWeekStyle: TextStyle(),
                    dateStyle: TextStyle(),
                    selectedDateStyle: TextStyle(),
                    inactiveDateStyle: TextStyle(),
                  ),
                  FutureBuilder<ApiCallResponse>(
                    future: GetPlanSheetCall.call(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                        );
                      }
                      final listViewGetPlanSheetResponse = snapshot.data!;
                      return Builder(
                        builder: (context) {
                          final plannedTasks = getJsonField(
                            listViewGetPlanSheetResponse.jsonBody,
                            r'''$.values''',
                          ).toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: plannedTasks.length,
                            itemBuilder: (context, plannedTasksIndex) {
                              final plannedTasksItem =
                                  plannedTasks[plannedTasksIndex];
                              return ListTile(
                                leading: Icon(
                                  Icons.check_box_outline_blank_outlined,
                                  color: FlutterFlowTheme.of(context).white,
                                ),
                                title: Text(
                                  getJsonField(
                                    listViewGetPlanSheetResponse.jsonBody,
                                    r'''$[2]''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Outfit',
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                      ),
                                ),
                                subtitle: Text(
                                  getJsonField(
                                    listViewGetPlanSheetResponse.jsonBody,
                                    r'''$[3]''',
                                  ).toString(),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Outfit',
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                      ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFF303030),
                                  size: 20,
                                ),
                                tileColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                dense: false,
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:limpia/ui/common/app_colors.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:limpia/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_view.dart';
import 'dashboard_viewmodel.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return AdaptiveTheme(
        light: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.red,
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.red,
        ),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
              title: 'Adaptive Theme Demo',
              theme: theme,
              darkTheme: darkTheme,
              home: HomePage(),
            ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime _selectedDate;
  late DateTime _selectedTime;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
    _resetSelectedTime();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
  }

  void _resetSelectedTime() {
    _selectedTime = DateTime.now();
  }

  int l = 0;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
        viewModelBuilder: () => DashboardViewModel(),
    builder: (context, viewModel, child) => Scaffold(
      //backgroundColor: const Color(0xFF333A47),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  'Set a date ',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],),
            Container(
              width: 500,
              height: 450,
              decoration: BoxDecoration(
                color: kcPrimaryColor.withOpacity(0.2),
                shape: BoxShape.circle, // Circular shape
              ),
              padding: const EdgeInsets.all(20),
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: CalendarTimeline(
                  showYears: true,
                  initialDate: _selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
                  onDateSelected: (date) =>
                      setState(() => _selectedDate = date),
                  leftMargin: 20,
                  monthColor: kcPrimaryColor,
                  dayColor: kcBlackColor,
                  dayNameColor: const Color(0xFF333A47),
                  activeDayColor: kcBlackColor,
                  shrink: false,
                  activeBackgroundDayColor: kcWhiteColor,
                  selectableDayPredicate: (date) => date.day != 23,
                  locale: 'en',
                ),
              ),
            ),
            //
            // const SizedBox(height: 40),
            // Padding(
            //   padding: const EdgeInsets.only(left: 16),
            //   child: TextButton(
            //     style: ButtonStyle(
            //       backgroundColor: MaterialStateProperty.all(Colors.teal[200]),
            //     ),
            //     child: const Text(
            //       'RESET',
            //       style: TextStyle(color: Color(0xFF333A47)),
            //     ),
            //     onPressed: () => setState(() => _resetSelectedDate()),
            //   ),
            // ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'What is your Preference Time?',
              ),
            ),

            const SizedBox(height: 20),
            // Time Picker Spinner
            Center(
              child: TimePickerSpinner(
                is24HourMode: false,
                normalTextStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                highlightedTextStyle: const TextStyle(
                  fontSize: 22,
                  color: kcPrimaryColor,
                ),
                spacing: 40,
                itemHeight: 50,
                isForce2Digits: true,
                onTimeChange: (time) {
                  setState(() {
                    _selectedTime = time;
                  });
                },
              ),
            ),
            verticalSpaceLarge,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    showBottomSheetCheck(context, viewModel); // Close the bottom sheet
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor:
                    kcWhiteColor, // Adjust to your primary color
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(fontSize: 14, color: kcPrimaryColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

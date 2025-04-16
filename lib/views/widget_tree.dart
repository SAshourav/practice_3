import 'package:flutter/material.dart';
import 'package:practice_3/data/constant.dart';
import 'package:practice_3/data/notifiers.dart';
import 'package:practice_3/views/pages/Setting_page.dart';
import 'package:practice_3/views/pages/home_page.dart';
import 'package:practice_3/views/pages/profile_page.dart';
import 'package:practice_3/views/widgets/navbar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Widget> pages = [
  HomePage(),
  ProfilePage()
];

class WidgetTree  extends StatelessWidget {
  const WidgetTree ({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            //leading: Icon(Icons.add_business),
            title: Text('Nature',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 10,
              ),
            ),
            automaticallyImplyLeading: false,
            centerTitle: false,
            actions: [
              IconButton(onPressed: () async{
                  isDarkNotifier.value = !isDarkNotifier.value;
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setBool(Kconstant.themeModeKey, isDarkNotifier.value);

              },
                  icon: ValueListenableBuilder(valueListenable: isDarkNotifier,
                      builder: (context,isDarkMode,child) {
                        return Icon(
                            isDarkMode ? Icons.light_mode : Icons.dark_mode
                        );
                      }
                  ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SettingPage(title: 'Settings',);
                      },
                    ),
                  );
                },
                icon: Icon(Icons.settings),
              ),

            ],
          ),
          body: ValueListenableBuilder(valueListenable: selectedPageNotifier,
              builder: (context, selectedPage, child){
                return pages.elementAt(selectedPage);
              }
          ),
          bottomNavigationBar: NavbarWidget()
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nightmode/constant_data.dart';
import 'package:nightmode/them_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RxBool isNightTheme = false.obs;
  bool isSwitchOn = false;

  @override
  void initState() {
    super.initState();
    getThemeMode();
  }

  getThemeMode() async {
    int i = await PrefData.getThemeMode();

    if (i == 1) {
      isSwitchOn = true;
    } else {
      isSwitchOn = false;
    }
    setState(() {});
    ConstantData.setThemePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('night mode demo',
            style: TextStyle(color: textColor, fontSize: 20.0)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: textColor),
          onPressed: () {
          },
        ),
        backgroundColor: bgColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 2),
           
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                color: cellColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(1.0),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Icon(
                    Icons.nightlight_round,
                    color: isSwitchOn ? Colors.white : textColor,
                    size: 20.0,
                  ),
                ),
                title: Text(
                  'Night Mode',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 17.0,
                  ),
                ),
                trailing: Switch(
                  value: isSwitchOn,
                  activeColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      isSwitchOn = value;
            
                      if (value) {
                        PrefData.setThemeMode(1);
                      } else {
                        PrefData.setThemeMode(0);
                      }
            
                      getThemeMode();
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

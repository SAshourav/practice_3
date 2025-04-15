import 'package:flutter/material.dart';
import 'package:practice_3/views/widgets/hero_widget.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key, required this.title});

  final String title;

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
  String? menuItem = "Element 1";

  @override
  void dispose() {
    controller.dispose(); // Dispose the controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: (){
          Navigator.pop(context);
        }),
        title: Text(widget.title),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              DropdownButton<String>(
                value: menuItem,
                items: const [
                  DropdownMenuItem(
                    value: "Element 1",
                    child: Text("Element 1"),
                  ),
                  DropdownMenuItem(
                    value: "Element 2",
                    child: Text("Element 2"),
                  ),
                  DropdownMenuItem(
                    value: "Element 3",
                    child: Text("Element 3"),
                  ),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    menuItem = newValue;
                  });
                },
              ),
              const SizedBox(height: 20),

              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter something",
                ),
                onChanged: (value) {
                  setState(() {}); // Update display as user types
                },
              ),
              const SizedBox(height: 20),
              Text("You typed: ${controller.text}"),

              const SizedBox(height: 20),
              Checkbox(
                tristate: true,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),

              CheckboxListTile.adaptive(
                tristate: true,
                title: const Text("Check me?"),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),

              const SizedBox(height: 20),
              Switch(
                value: isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              SwitchListTile.adaptive(
                value: isSwitched,
                title: Text("Turn me on"),
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),

              const SizedBox(height: 20),
              Slider.adaptive(
                value: sliderValue,
                max: 10,
                divisions: 10,
                onChanged: (double value) {
                  setState(() {
                    sliderValue = value;
                    print(sliderValue);
                  });
                },
              ),

              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  print("Image Selected!");
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: HeroWidget(),
                ),
              ),

              const SizedBox(height: 20),
              InkWell(
                splashColor: Colors.cyanAccent,
                onTap: () {
                  print("Image Selected");
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.white12,
                ),
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Snakbar"),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black26,
                  foregroundColor: Colors.white70,
                ),
                child: Text("Open Snakbar!"),
              ),

              Divider(
                color: Colors.teal,
                thickness: 5.0,
              ),
              Container(
                height: 50,
                child: VerticalDivider(
                  color: Colors.teal,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Alert title"),
                          content: Text("Alert Content"),
                          actions: [
                            FilledButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("Closed"))
                          ],
                        );
                      });
                },
                child: Text("Show alert"),
              ),

              FilledButton(
                onPressed: () {},
                child: Text("Click me!"),
              ),

              TextButton(
                onPressed: () {},
                child: Text("Click me!"),
              ),

              const SizedBox(height: 20),

              OutlinedButton(
                onPressed: () {
                  showDialog(context: context,
                      builder: (context){
                    return AboutDialog();
                  });
                },
                child: Text("Show About"),
              ),

              CloseButton(),
              BackButton(),
            ],
          ),
        ),
      ),
    );
  }
}

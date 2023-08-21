import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:sentence_cut/result_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController characterCountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sentence Cut'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white.withOpacity(0.2)
                          : Colors.black.withOpacity(0.2),
                    ),
                  ),
                  child: TextField(
                    controller: textEditingController,
                    maxLines: null,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 5,
                        bottom: 5,
                      ),
                      border: InputBorder.none,
                      hintText: "Long Sentence ... ",
                      hintStyle: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: characterCountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "Character count",
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          if (textEditingController.text.trim().isEmpty) {
                            Fluttertoast.showToast(msg: "Sentence is empty");
                          } else if (characterCountController.text
                              .trim()
                              .isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Character count is empty");
                          } else if (textEditingController.text
                                  .trim()
                                  .isNotEmpty ||
                              characterCountController.text.trim().isNotEmpty) {
                            setState(() {});
                            Get.to(
                              () => ResultPage(
                                longSentence: textEditingController.text.trim(),
                                charCount: int.parse(
                                    characterCountController.text.trim()),
                              ),
                              transition: Transition.rightToLeft,
                              duration: const Duration(milliseconds: 700),
                            );
                          }
                        },
                        child: const Text("Process"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

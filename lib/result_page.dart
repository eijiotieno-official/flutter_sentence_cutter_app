import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:sentence_cut/app_services.dart';

class ResultPage extends StatefulWidget {
  final String longSentence;
  final int charCount;
  const ResultPage(
      {super.key, required this.longSentence, required this.charCount});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuts'),
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: AppServices.splitSentence(
                longSentence: widget.longSentence, charCount: widget.charCount)
            .length,
        itemBuilder: (context, index) {
          String string = AppServices.splitSentence(
              longSentence: widget.longSentence,
              charCount: widget.charCount)[index];
          return Column(
            children: [
              ListTile(
                leading: IconButton(
                  onPressed: () {
                    FlutterClipboard.copy(string);
                  },
                  icon: const Icon(
                    Icons.copy_rounded,
                  ),
                ),
                title: Text(string),
              ),
              Container(
                height: 1,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black.withOpacity(0.1)
                    : Colors.white.withOpacity(0.1),
              ),
            ],
          );
        },
      ),
    );
  }
}

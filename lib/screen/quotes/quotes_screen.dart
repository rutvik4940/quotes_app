import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotes_app/model/model_screen.dart';
import 'package:quotes_app/utils/global.dart';
import 'dart:ui' as ui;

class QutoesScreen extends StatefulWidget {
  const QutoesScreen({super.key});

  @override
  State<QutoesScreen> createState() => _QutoesScreenState();
}

class _QutoesScreenState extends State<QutoesScreen> {
  QuotesModel data = QuotesModel();
  Color bgcolor = Colors.black;
  Color bgfontcolor = Colors.white;
  List<Color> bgcolorList = [Colors.black, ...Colors.primaries];
  List<Color> bgfontcolorList = [Colors.white, ...Colors.primaries];
  GlobalKey repaintKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as QuotesModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Quotes"),
          actions: [
            IconButton(
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: "${data.quotes}"));
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Copy Successfully")));
              },
              icon: const Icon(Icons.copy),
            ),
            IconButton(
              onPressed: () async {

                RenderRepaintBoundary render = repaintKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
                ui.Image image = await render.toImage(pixelRatio: 3);
                ByteData? byteData =await image.toByteData(format: ui.ImageByteFormat.png);
                Directory data = await getApplicationDocumentsDirectory();
                String path="${data.path}/${"rutvik"}.png";
                await File(path).writeAsBytes(byteData!.buffer.asUint8List());
                print("$path");
              },
              icon: const Icon(Icons.save),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RepaintBoundary(
              key: repaintKey,
              child: Container(
                height: MediaQuery.sizeOf(context).width * 0.70,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectableText("${data.quotes}",
                        style: const TextStyle(fontSize: 20)),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Text("- ${data.author}",
                            style: const TextStyle(fontSize: 20))),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const SelectableText("Background Color",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: bgfontcolorList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    setState(() {
                      bgcolorList[index];
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: bgcolorList[index],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text("Font Color",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: bgfontcolorList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: bgfontcolorList[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

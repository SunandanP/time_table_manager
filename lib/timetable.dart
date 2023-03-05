// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:time_table_manager/main.dart';
import 'header_tt.dart';

class TimeTable extends StatelessWidget {
  TimeTable({super.key});
  final GlobalKey<State<StatefulWidget>> _printKey = GlobalKey();

  void _printScreen() {
    Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final doc = pw.Document();

      final image = await WidgetWraper.fromKey(
          key: _printKey, orientation: PdfImageOrientation.topLeft);

      doc.addPage(pw.Page(
          pageFormat: format,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Expanded(
                child: pw.Image(image),
              ),
            );
          }));
      Logger().i("DONE");
      return doc.save();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Departement Wide TimeTable"),
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            child: IconButton(
              tooltip: "Print",
              icon: Icon(Icons.print),
              onPressed: _printScreen,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: IconButton(
              tooltip: "Class View",
              icon: Icon(Icons.view_day),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scaffold(body: TTClass())));
              },
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        child: RepaintBoundary(
          key: _printKey,
          child: TTDept(),
        ),
      ),
    );
  }
}

class TTClass extends StatelessWidget {
  final GlobalKey<State<StatefulWidget>> _printKey = GlobalKey();
  @override
  void _printScreen() {
    Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final doc = pw.Document();

      final image = await WidgetWraper.fromKey(
          key: _printKey, orientation: PdfImageOrientation.topLeft);

      doc.addPage(pw.Page(
          pageFormat: format,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Expanded(
                child: pw.Image(image),
              ),
            );
          }));
      Logger().i("DONE");
      return doc.save();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _printKey,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Class Time Table"),
          actions: [
            Container(
              margin: EdgeInsets.all(10),
              child: IconButton(
                tooltip: "Print",
                icon: Icon(Icons.print),
                onPressed: _printScreen,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: IconButton(
                tooltip: "Department Wide View",
                icon: Icon(Icons.view_day),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                children: [
                  // AllocationCard(flex: 2, text: "Time"),
                  AllocationCard(flex: 8, text: "Lectures")
                ],
              ),
              Row(
                children: [
                  AllocationCard(flex: 2, text: "Time"),
                  AllocationCard(flex: 2, text: "Monday"),
                  AllocationCard(flex: 2, text: "Tuesday"),
                  AllocationCard(flex: 2, text: "Wednesday"),
                  AllocationCard(flex: 2, text: "Thursday"),
                  AllocationCard(flex: 2, text: "Friday"),
                ],
              ),
              Row(
                children: [
                  AllocationCard(flex: 2, text: "8.30 - 9.30"),
                  AllocationCard2(
                      teacher: "SS", classRoom: "315", lecture: "OOP"),
                  AllocationCard(flex: 2, text: "DSA"),
                  AllocationCard(flex: 2, text: "LDCO"),
                  AllocationCard(flex: 2, text: "DM"),
                  AllocationCard(flex: 2, text: "BCN"),
                ],
              ),
              Row(
                children: [
                  AllocationCard(flex: 2, text: "9.30 - 10.30"),
                  AllocationCard2(
                      teacher: "SS", classRoom: "315", lecture: "OOP"),
                  AllocationCard(flex: 2, text: "DSA"),
                  AllocationCard(flex: 2, text: "LDCO"),
                  AllocationCard(flex: 2, text: "DM"),
                  AllocationCard(flex: 2, text: "BCN"),
                ],
              ),
              Row(
                children: [
                  AllocationCard(flex: 1, text: time3[0]),
                  AllocationCard(flex: 5, text: time3[1])
                ],
              ),
              Row(
                children: [
                  AllocationCard(flex: 2, text: "10.45 - 11.45"),
                  AllocationCard2(
                      teacher: "SS", classRoom: "315", lecture: "OOP"),
                  AllocationCard(flex: 2, text: "DSA"),
                  AllocationCard(flex: 2, text: "LDCO"),
                  AllocationCard(flex: 2, text: "DM"),
                  AllocationCard(flex: 2, text: "BCN"),
                ],
              ),
              Row(
                children: [
                  AllocationCard(flex: 2, text: "11.45 - 12.45"),
                  AllocationCard2(
                      teacher: "SS", classRoom: "315", lecture: "OOP"),
                  AllocationCard(flex: 2, text: "DSA"),
                  AllocationCard(flex: 2, text: "LDCO"),
                  AllocationCard(flex: 2, text: "DM"),
                  AllocationCard(flex: 2, text: "BCN"),
                ],
              ),
              Row(
                children: [
                  AllocationCard(flex: 2, text: "12.45 - 1.45"),
                  AllocationCard2(
                      teacher: "SS", classRoom: "315", lecture: "OOP"),
                  AllocationCard(flex: 2, text: "DSA"),
                  AllocationCard(flex: 2, text: "LDCO"),
                  AllocationCard(flex: 2, text: "DM"),
                  AllocationCard(flex: 2, text: "BCN"),
                ],
              ),
              Row(
                children: [
                  AllocationCard(flex: 1, text: time7[0]),
                  AllocationCard(flex: 5, text: time7[1])
                ],
              ),
              Row(
                children: [
                  AllocationCard(flex: 2, text: "2.45 - 3.45"),
                  AllocationCard2(
                      teacher: "SS", classRoom: "315", lecture: "OOP"),
                  AllocationCard(flex: 2, text: "DSA"),
                  AllocationCard(flex: 2, text: "LDCO"),
                  AllocationCard(flex: 2, text: "DM"),
                  AllocationCard(flex: 2, text: "BCN"),
                ],
              ),
              Row(
                children: [
                  AllocationCard(flex: 2, text: "3.45 - 4.45"),
                  AllocationCard2(
                      teacher: "SS", classRoom: "315", lecture: "OOP"),
                  AllocationCard(flex: 2, text: "DSA"),
                  AllocationCard(flex: 2, text: "LDCO"),
                  AllocationCard(flex: 2, text: "DM"),
                  AllocationCard(flex: 2, text: "DM"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TTDept extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              // AllocationCard(flex: 2, text: "Time"),
              AllocationCard(flex: 8, text: "Monday")
            ],
          ),
          Row(
            children: [
              ...headers2.map((e) {
                return AllocationCard(flex: 2, text: e);
              }),
            ],
          ),
          Row(
            children: [
              ...time1.map((e) {
                return AllocationCard(flex: 2, text: e);
              })
            ],
          ),
          Row(
            children: [
              ...time2.map((e) {
                return AllocationCard(flex: 2, text: e);
              })
            ],
          ),
          Row(
            children: [
              AllocationCard(flex: 2, text: time3[0]),
              AllocationCard(flex: 8, text: time3[1])
            ],
          ),
          Row(
            children: [
              ...time4.map((e) {
                return AllocationCard(flex: 2, text: e);
              })
            ],
          ),
          Row(
            children: [
              ...time5.map((e) {
                return AllocationCard(flex: 2, text: e);
              })
            ],
          ),
          Row(
            children: [
              ...time6.map((e) {
                return AllocationCard(flex: 2, text: e);
              })
            ],
          ),
          Row(
            children: [
              AllocationCard(flex: 2, text: time7[0]),
              AllocationCard(flex: 8, text: time7[1])
            ],
          ),
          Row(
            children: [
              ...time8.map((e) {
                return AllocationCard(flex: 2, text: e);
              })
            ],
          ),
          Row(
            children: [
              ...time9.map((e) {
                return AllocationCard(flex: 2, text: e);
              })
            ],
          ),
        ],
      ),
    );
  }
}

class AllocationCard extends StatelessWidget {
  int flex;
  String text;

  AllocationCard({required this.flex, required this.text});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        child: Card(
          elevation: 5,
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 25),
            ),
            heightFactor: 1.5,
          ),
        ),
      ),
    );
  }
}

class AllocationCard2 extends StatelessWidget {
  String teacher;
  String lecture;
  String classRoom;

  AllocationCard2(
      {required this.teacher, required this.lecture, required this.classRoom});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        child: Card(
          elevation: 5,
          child: Center(
            heightFactor: 1.5,
            child: Text(
              "$lecture - $teacher - $classRoom",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}

class AllocationCard1 extends StatelessWidget {
  String teacher;
  String lecture;
  String classRoom;
  String batch;

  AllocationCard1(
      {required this.teacher,
      required this.lecture,
      required this.classRoom,
      required this.batch});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        child: Center(
          heightFactor: 1,
          child: Text(
            "$batch : $lecture - $teacher - $classRoom",
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}

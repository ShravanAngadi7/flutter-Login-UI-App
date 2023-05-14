import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:share/share.dart';

class Item {
  final String title;
  final String description;
  final bool isComplete;
  final String? imageUrl;
  final String? filePath;

  Item({
    required this.title,
    required this.description,
    this.isComplete = false,
    this.imageUrl,
    this.filePath,
  });
}

class PDFGenerator {
  static Future<void> generateAndSharePDF(List<Item> items) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.ListView.builder(
            itemCount: items.length,
            itemBuilder: (pw.Context context, int index) {
              final item = items[index];
              return pw.Container(
                padding: pw.EdgeInsets.all(10),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Title: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text('Description:'),
                    // Add more fields as needed
                  ],
                ),
              );
            },
          );
        },
      ),
    );

    final output = File('resume.pdf');
    await output.writeAsBytes(await pdf.save());

    Share.shareFiles([output.path], text: 'Sharing my resume');
  }
}

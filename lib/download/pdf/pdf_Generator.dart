
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart'as pw;
import 'dart:typed_data';
import 'dart:io';

class pdfGenerator{

  Future<Uint8List>createPdf()async{
    final pdf=pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
      build: (pw.Context context){
       return pw.Center(child: pw.Text("oh wow")) ;
      }
    ));
    return await pdf.save();
  }
  Future<void>savePdf( String filename, Uint8List byteList)async {
    final output = await getTemporaryDirectory();
    var filePath = "${output.path}/$filename.pdf";
    final file = File(filePath);
    await file.writeAsBytes(byteList);
    //await OpenDocument.openDocument(filePath: filePath);
   await OpenFile.open(filePath);

    print('object');
  }
}
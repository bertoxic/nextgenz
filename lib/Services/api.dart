import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

var options = BaseOptions(
  baseUrl: 'http://stgapi.nextgendoctors.in',
  // connectTimeout: 5000,
  // receiveTimeout: 3000,
);
Dio dio = Dio(options);

class Services {
  dynamic post(url, data) async {
    try {
      String completeurl = '${dio.options.baseUrl}/$url';
      log(completeurl);
      var response = await dio.post(completeurl, data: data);

      EasyLoading.dismiss();
      return response.data;
    } on DioError catch (e) {
      log(e.toString());
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  dynamic getRequest(url) async {
    try {
      String completeurl = '${dio.options.baseUrl}/$url';
      print(completeurl);

      var response = await dio.get(completeurl);

      EasyLoading.dismiss();
       log(response.data.toString());
      return response.data;
    } on DioError catch (e) {
      print(e.toString());
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  // getFiles() async {
  //   var fileKey = base64.encode(utf8.encode(remoteLocation + '/'));
  //   try {
  //     dio.get('${dio.options.baseUrl}/file/list/$fileKey').then((res) => {
  //           print(res.data),
  // setState(() {
  //   files.clear();
  //   files.addAll(res.data['Contents']);
  // }),
  // }
  //         });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  dynamic uploadPicture(FilePickerResult result) async {
    String prefix = '6296192c95024d001391f727';
    String category = 'profile_picture';
    String remoteLocation =
        'app_uploads/$prefix/$category/${result.files.first.name}';
    FormData formData = FormData.fromMap({
      "file": await File(result.files.first.path!).readAsBytes(),
      "filename": result.files.first.name
    });
    try {
      String completeurl = '${dio.options.baseUrl}/file';
      log(completeurl);
      var response = await dio.post(completeurl,
          data: formData,
          options: Options(headers: {"content-type": "multipart/form-data"}));
      log(response.data.toString());

      EasyLoading.dismiss();
      return response.data;
    } on DioError catch (e) {
      log(e.toString());
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}

import 'dart:io';
import 'package:path_provider/path_provider.dart';
//
// class use_document {
//   static writeInDocumentJson(String json, String name) async {
//
//     String saveDir = '';
//     final runResult = await Process.run('id', ['-un']);
//     final userRaw = runResult.stdout as String;
//     //返回的字符串最后有一个"\n"要处理掉
//     String userName = userRaw.trim();
//     saveDir = '/Users/$userName/Desktop';
//
//     var file = Directory(saveDir);
//     if (!await file.exists()) {
//       file.create();
//     }
//
//     var roomFile = File("$saveDir/$name.dart");
//     var sink = roomFile.openWrite();
//     var buffer = StringBuffer();
//     try {
//       buffer.clear();
//       buffer.write(json);
//       sink.write(buffer.toString());
//       sink.flush();
//       sink.close();
//     } catch (e) {
//       print(e);
//     }
//   }
// }

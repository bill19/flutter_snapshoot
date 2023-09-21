
class snapshoot{

  ///普通模板数据
  static String demo1({String ? title}){
    String s = 'import \'package\:flutter\/material.dart\';' +'\n'+
    '\n'+
    'class ${title} extends StatefulWidget {'+'\n'+
    '${title}({super.key, required this.title});'+'\n'+
        '\n'+
        'String title;'+'\n'+
    '@override'+'\n'+
    'State<${title}> createState() => _${title}State();'+'\n'+
    '}'+'\n'+
        '\n'+
    'class _${title}State extends State<${title}> {'+'\n'+
    '@override'+'\n'+
    'void initState() {'+'\n'+
    '// TODO: implement initState'+'\n'+
    'super.initState();'+'\n'+
    '}'+'\n'+
    '\n'+
    '@override'+'\n'+
    'Widget build(BuildContext context) {'+'\n'+
    'return Scaffold('+'\n'+
    'appBar: AppBar('+'\n'+
    'title: Text(\'\'),'+'\n'+
    '),'+'\n'+
    'body: Container());'+'\n'+
    '}'+'\n'+
    '}'+'\n';

    return s;
  }
}
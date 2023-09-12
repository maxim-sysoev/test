import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pantompkins_plugin/pantompkins_plugin.dart' as plugin;
import 'package:path_provider/path_provider.dart' as path_provider;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Test(),
    );
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: passFiles,
              child: const Text('pass files'),
            ),
            TextButton(
              onPressed: calculate,
              child: const Text('calculate'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> passFiles() async {
    final path = await path_provider.getApplicationDocumentsDirectory();
    final inputFile = File('${path.path}/input.txt');
    await inputFile.create();
    inputFile.writeAsStringSync(_writeString);
    final outputFile = File('${path.path}/output.txt');
    plugin.init(inputFile.path, outputFile.path);
  }

  void calculate() {
    plugin.calculate();
  }
}

const _writeString = '''0995
0995
0995
0995
0995
0995
0995
0995
1000
0997
0995
0994
0992
0993
0992
0989
0988
0987
0990
0993
0989
0988
0986
0988
0993
0997
0993
0986
0983
0977
0979
0975
0974
0972
0969
0969
0969
0971
0973
0971
0969
0966
0966
0966
0966
0967
0965
0963
0967
0969
0969
0968
0967
0963
0966
0964
0968
0966
0964
0961
0960
0957
0952
0947
0947
0943
0933
0927
0927
0939
0958
0980
1010
1048
1099
1148
1180
1192
1177
1128
1058
0991
0951
0937
0939
0950
0958
0959
0957
0955
0958
0959
0961
0962
0960
0957
0956
0959
0955
0957
''';

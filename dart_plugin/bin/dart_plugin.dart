import 'dart:ffi';
import 'dart:io';

import 'package:dart_plugin/pan_tompkins.dart';
import 'package:ffi/ffi.dart';
import 'package:path/path.dart' as path;

Future<void> main(List<String> arguments) async {
  final dir = Directory.current.path;
  final dyLibPath = path.join(dir, 'panTompkins', 'libpanTompkins.dylib');
  final lib = DynamicLibrary.open(dyLibPath);
  final bindings = PanTompkinsBindings(lib);
  final inputFilePath = path.join(dir, 'files', 'ecg_sinus_copy.csv');
  // final inputFilePath = path.join(dir, 'files', 'input.txt');
  final outputFilePath = path.join(dir, 'files', 'output.txt');
  bindings.init(
    inputFilePath.toNativeUtf8().cast<Char>(),
    outputFilePath.toNativeUtf8().cast<Char>(),
  );
  bindings.panTompkins();
}

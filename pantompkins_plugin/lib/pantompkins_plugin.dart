import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

import 'pantompkins_plugin_bindings_generated.dart';

void init(String inputPath, String outputPath) {
  _bindings.init(
    inputPath.toNativeUtf8().cast<Char>(),
    outputPath.toNativeUtf8().cast<Char>(),
  );
}

void calculate() => _bindings.panTompkins();

const String _libName = 'pantompkins_plugin';

/// The dynamic library in which the symbols for [PantompkinsPluginBindings] can be found.
final DynamicLibrary _dylib = () {
  if (Platform.isMacOS || Platform.isIOS) {
    return DynamicLibrary.open('$_libName.framework/$_libName');
  }
  if (Platform.isAndroid || Platform.isLinux) {
    return DynamicLibrary.open('lib$_libName.so');
  }
  if (Platform.isWindows) {
    return DynamicLibrary.open('$_libName.dll');
  }
  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}();

/// The bindings to the native functions in [_dylib].
final PantompkinsPluginBindings _bindings = PantompkinsPluginBindings(_dylib);

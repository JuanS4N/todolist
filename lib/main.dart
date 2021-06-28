import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/presentation/core/app.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

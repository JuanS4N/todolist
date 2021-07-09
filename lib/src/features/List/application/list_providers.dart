import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'list_notifier.dart';

final listProvider = ChangeNotifierProvider((ref) => ListNotifier());

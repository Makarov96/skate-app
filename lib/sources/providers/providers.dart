import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skate_app/sources/providers/index_notifier.dart';
import 'package:skate_app/sources/providers/offset_notfier.dart';

final indexNotifier = ChangeNotifierProvider<IndexNotifier>(
  (ref) => IndexNotifier(),
);

final offsetNotifier = AutoDisposeChangeNotifierProvider<OffsetNotifier>(
  (ref) => OffsetNotifier(),
);

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../viewmodels/task_viewmodel.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider(create: (_) => TaskViewModel()),
];

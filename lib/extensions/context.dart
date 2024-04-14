import 'package:sportion/library.dart';

extension Contexts on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  ThemeData get theme => Theme.of(this);
}

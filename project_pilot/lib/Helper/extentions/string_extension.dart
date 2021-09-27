import 'package:html/parser.dart';

extension removeHtmlTag on String {

  String removeHtml() {
    final document = parse(this);
    final String parsedString = parse(document.body?.text).documentElement!.text;

    return parsedString;
  }
}
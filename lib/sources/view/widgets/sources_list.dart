
import 'package:flutter/widgets.dart';
import 'package:newsapp/sources/model/data_models/source.dart';

class SourcesList extends StatefulWidget {
  const SourcesList({super.key, required this.sourcesList});
   final List<Source> sourcesList;

  @override
  State<SourcesList> createState() => _SourcesListState();
}

class _SourcesListState extends State<SourcesList> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
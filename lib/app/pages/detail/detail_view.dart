import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  const DetailView({Key? key, required this.transactions}) : super(key: key);
  final List transactions;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
          child: ListView.builder(
        itemBuilder: _buildListItem,
      )),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return ListTile(
      leading: Icon(Icons.abc),
      title: Text('$index'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/screen/screen.dart';
import 'package:mangabox/theme/theme.dart';
import 'package:mangabox/widget/widget.dart';

const _colors = [
  Colors.brown,
  Colors.blue,
  Colors.indigo,
  Colors.deepOrange,
  Colors.deepOrangeAccent,
];

class AuthorTile extends StatelessWidget {
  final Author author;

  const AuthorTile({
    required this.author,
    Key? key,
  }) : super(key: key);

  void _openAuthorScreen({
    required BuildContext context,
  }) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AuthorScreen(author: author),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final name = author.name;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: _colors[author.hashCode % _colors.length],
          borderRadius: BorderRadius.circular(kRadiusSmall),
        ),
        child: Center(
          child: Text(
            name.characters.first,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      title: Text(name),
      trailing: const MbxIconButton(
        icon: Icons.chevron_right,
      ),
      onTap: () => _openAuthorScreen(
        context: context,
      ),
    );
  }
}

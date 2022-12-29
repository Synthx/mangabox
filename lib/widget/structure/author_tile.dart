import 'package:flutter/material.dart';
import 'package:mangabox/data/data.dart';
import 'package:mangabox/theme/theme.dart';

const _colors = [
  Colors.brown,
  Colors.blue,
  Colors.indigo,
  Colors.deepOrange,
  Colors.deepOrangeAccent,
];

class AuthorTile extends StatelessWidget {
  final Author author;
  final VoidCallback? onTap;

  const AuthorTile({
    required this.author,
    this.onTap,
    Key? key,
  }) : super(key: key);

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
      trailing: const Icon(
        Icons.chevron_right,
        size: 32,
      ),
      onTap: onTap,
    );
  }
}

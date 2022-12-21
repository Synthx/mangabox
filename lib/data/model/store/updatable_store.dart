import 'package:mangabox/data/data.dart';

abstract class UpdatableStore {
  Future<void> update(List<Book> books);
}

import '../../layers.dart';

abstract class NewsRepository {
  int? get currentLoadedLength;
  // ICallable
  Future<List<NewsModel>> call();
}

import 'package:flutter_banking_pay_responsive/layers/domain/news.dart';

abstract class NewsRepository {
  int? get currentLoadedLength;
  // ICallable
  Future<List<NewsModel>> call();
}

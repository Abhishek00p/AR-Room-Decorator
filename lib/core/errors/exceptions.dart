class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}

class CacheException implements Exception {
  final String message;
  CacheException(this.message);
}

class StorageException implements Exception {
  final String message;
  StorageException(this.message);
}
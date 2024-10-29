abstract class ImageLoader {
  void loadImage(String imageUrl);
}

class NetworkImageLoader implements ImageLoader {
  @override
  void loadImage(String imageUrl) {
    print('loading image from network: $imageUrl');
  }
}

class CachedImageLoader implements ImageLoader {
  final NetworkImageLoader _realLoader = NetworkImageLoader();
  final Map<String, bool> _cache = {};

  @override
  void loadImage(String imageUrl) {
    if (_cache.containsKey(imageUrl)) {
      print('loading image from cache $imageUrl');
    } else {
      print('Image not in cache download then');
      _realLoader.loadImage(imageUrl);
      _cache[imageUrl] = true;
    }
  }
}

void main() {
  ImageLoader imageLoader = CachedImageLoader();

  imageLoader.loadImage('image1.png');

  imageLoader.loadImage('image1.png');

  imageLoader.loadImage('image2.png');
}

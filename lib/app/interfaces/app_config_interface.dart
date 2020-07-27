abstract class AppConfigInterface {

  Future get(String key);
  Future delete(String key);
  Future put(String key, dynamic value);

}
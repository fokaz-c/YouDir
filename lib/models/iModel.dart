abstract class IModel<T> {
  //from map,  to map
  Map<String, Object> toMap();

  T fromMap(Map<String, Object> map);
}

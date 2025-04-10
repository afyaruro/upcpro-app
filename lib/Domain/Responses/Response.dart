
class ResponseEntity<E> {
  final bool isError;
  late String message;
  late E? entity;
  late List<E>? entities;
  late int? pages;

  ResponseEntity._({
    required this.isError,
    required this.message,
    this.entity,
    this.entities,
    this.pages
  });

  ResponseEntity.error({required String message})
      : this._(
          isError: true,
          message: message,
        );

  ResponseEntity.singleEntity({
    required String message,
    required E entity,
  }) : this._(
          isError: false,
          message: message,
          entity: entity,
        );

  ResponseEntity.list({
    required String message,
    required List<E> entities,
    required int pages
  }) : this._(
          isError: false,
          message: message,
          entities: entities,
          pages: pages
        );
}
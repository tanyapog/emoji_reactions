class Twit {
  final int id;
  final String body;

  Twit({
    required this.id,
    required this.body
  });

  factory Twit.fromMap(Map<String, dynamic> map) => Twit(
    id: map['id'],
    body: map['body']
  );

  Map<String, dynamic> toMap() => {
    'id' : id,
    'body' : body,
  };

  @override
  String toString() => 'Twit{id: $id, body: $body}';
}
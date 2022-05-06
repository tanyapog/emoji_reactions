class Twit {
  final int id;
  final String body;
  final String? reaction;

  Twit({
    required this.id,
    required this.body,
    required this.reaction,
  });

  factory Twit.fromMap(Map<String, dynamic> map) => Twit(
    id: map['id'],
    body: map['body'],
    reaction: map['reaction'],
  );

  Map<String, dynamic> toMap() => {
    'id' : id,
    'body' : body,
    'reaction' : reaction,
  };

  @override
  String toString() => 'Twit{id: $id, body: $body, reaction: $reaction}';
}
class Reaction {
  final int id;
  final int twitId;
  final String emoji;

  Reaction({
    required this.id,
    required this.twitId,
    required this.emoji
  });

  Map<String, dynamic> toMap() => {
    'id' : id,
    'twitId' : twitId,
    'emoji' : emoji,
  };

  @override
  String toString() => 'Twit{id: $id, twitId: $twitId, emoji: $emoji}';
}
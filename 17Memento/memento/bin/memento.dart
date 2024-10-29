class ScoreMemento {
  final int score;

  ScoreMemento(this.score);
}

class Player {
  int _score = 0;

  void earnPoints(int points) {
    _score += points;
    print("score $_score");
  }

  ScoreMemento save() {
    return ScoreMemento(_score);
  }

  void restore(ScoreMemento memento) {
    _score = memento.score;
    print("restored points $_score");
  }
}

class ScoreCaretaker {
  final List<ScoreMemento> _mementos = [];

  void addMemento(ScoreMemento memento) {
    _mementos.add(memento);
  }

  ScoreMemento? getMemento(int index) {
    if (index >= 0 && index < _mementos.length) {
      return _mementos[index];
    }
    return null;
  }
}

void main() {
  final player = Player();
  final caretaker = ScoreCaretaker();

  player.earnPoints(10);
  caretaker.addMemento(player.save());

  player.earnPoints(20);
  caretaker.addMemento(player.save());

  player.earnPoints(15);

  player.restore(caretaker.getMemento(1)!);
  player.restore(caretaker.getMemento(0)!);
}

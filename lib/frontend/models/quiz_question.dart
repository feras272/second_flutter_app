
// class has:
// - quiz questions
// - quiz answers
class QuizQuestion {

  // sinse its final, it enforces to define it in the constructor
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }

}
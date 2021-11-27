class QuestionModel {
  final String title, answer;
  final List<String> answers;
  bool isAnswerCorrect = false;

  QuestionModel(this.title, this.answer, this.answers);
}

import 'ques.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('An endangered species is at risk of extinction.', true),
    Question('Crude oil is a fossil fuel.', true),
    Question('The ocean sometimes stands still.', false),
    Question('All matter has mass and density.', true),
    Question('All chemical reactions can be reversed.', false),
    Question('When horses run, all four feet leave the ground.', true),
    Question('Lightning rarely strikes skyscrapers.', false),
    Question('Tectonic plates move very quickly.', false),
  ];

void getNextQuestion() {
  if (_questionNumber < _questionBank.length - 1) {
    _questionNumber++;
  }
}

String getQuestion() {
  return _questionBank[_questionNumber].question;
}

bool getCorrectAnswer() {
  return _questionBank[_questionNumber].answer;
}

bool isFinished() {
  if (_questionNumber >= _questionBank.length - 1)
    return true;
  else
    return false;
}

void reset() {
  _questionNumber = 0;
}
}
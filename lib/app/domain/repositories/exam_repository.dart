abstract class ExamRepository {
// Retorna uma lista de números aleatórios com
// a quantidade de itens solicitada
  List<int> getRandomNumbers(int quantity);
// Verifica se uma lista de números informada
// está em ordem crescente e retorna o resultado
  bool checkOrder(List<int> numbers);
}

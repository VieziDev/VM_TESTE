// Define um caso de uso para obter números aleatórios
abstract class GetRandomNumbersUseCase {
  // Método que executa a lógica para obter uma lista de números aleatórios
  List<int> execute(int quantity);
}

// Define um caso de uso para verificar a ordem dos números
abstract class CheckOrderUseCase {
  // Método que executa a lógica para verificar se a lista de números está em ordem
  bool execute(List<int> numbers);
}

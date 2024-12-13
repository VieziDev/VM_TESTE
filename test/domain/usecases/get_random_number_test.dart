import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vm_test/app/domain/repositories/exam_repository.dart';
import 'package:vm_test/app/domain/usecases/get_random_numbers_usecase_impl.dart';

class MockExamRepository extends Mock implements ExamRepository {}

void main() {
  late GetRandomNumbersUseCaseImpl getRandomNumbersUseCase;
  late MockExamRepository mockExamRepository;

  setUp(() {
    mockExamRepository = MockExamRepository();
    getRandomNumbersUseCase = GetRandomNumbersUseCaseImpl(mockExamRepository);
  });

  group('execute', () {
    test('Deve retornar uma lista de números aleatórios', () {
      // Arrange
      const quantity = 5;
      const numbers = [1, 4, 6, 5, 3];
      when(() => mockExamRepository.getRandomNumbers(quantity))
          .thenReturn(numbers);

      // Act
      final result = getRandomNumbersUseCase.execute(quantity);

      // Assert
      expect(result, numbers);
      verify(() => mockExamRepository.getRandomNumbers(quantity)).called(1);
    });

    test('Deve retornar um ArgumentError se a quantidade for menor que 1', () {
      // Arrange
      const quantity = 0;

      // Act
      result() => getRandomNumbersUseCase.execute(quantity);

      // Assert
      expect(result, throwsA(isA<ArgumentError>()));
      verifyNever(() => mockExamRepository.getRandomNumbers(quantity));
    });
  });
}

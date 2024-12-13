import 'package:get_it/get_it.dart';
import 'package:vm_test/app/data/repositories/exam_repository_impl.dart';
import 'package:vm_test/app/domain/repositories/exam_repository.dart';
import 'package:vm_test/app/domain/usecases/check_order_usecase_impl.dart';
import 'package:vm_test/app/domain/usecases/get_random_numbers_usecase_impl.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Use Cases
  getIt.registerLazySingleton(() => CheckOrderUseCaseImpl(getIt()));
  getIt.registerLazySingleton(() => GetRandomNumbersUseCaseImpl(getIt()));

  // Repositories
  getIt.registerLazySingleton<ExamRepository>(() => ExamRepositoryImpl());
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spotify/core/Failure/failure.dart';
import 'package:spotify/features/authorization/domain/repositories/autho_repo.dart';
import 'package:spotify/features/authorization/domain/usecases/login.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

void main() {
  late MockAuthRepo repository;
  late CreateUserUsecase useCase;

  setUp(() {
    repository = MockAuthRepo();
    useCase = CreateUserUsecase(repository: repository); // Pass repository to the use case
  });

  test('This test should call the repository.signIn method', () async {
    // Arrange
    const email = 'test@example.com';
    const password = 'password123';
    const token = 'mockedToken'; // Simulated successful response

    // Mocking the repository's signIn method
    when(() => repository.signIn(email: email, password: password))
        .thenAnswer((_) async => Right<Failure, String>(token) as Either<Failure, String>);

    // Act
    final result = await useCase(email, password);

    // Assert
    verify(() => repository.signIn(email: email, password: password)).called(1);
    expect(result, Right(token)); // Ensure it matches the mocked response
  });
}

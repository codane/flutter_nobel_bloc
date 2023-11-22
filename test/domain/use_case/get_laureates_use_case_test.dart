import 'package:flutter_nobel/domain/model/birth_model.dart';
import 'package:flutter_nobel/domain/model/city_model.dart';
import 'package:flutter_nobel/domain/model/country_model.dart';
import 'package:flutter_nobel/domain/model/full_name_model.dart';
import 'package:flutter_nobel/domain/model/laureate_model.dart';
import 'package:flutter_nobel/domain/model/place_model.dart';
import 'package:flutter_nobel/domain/model/wikipedia_model.dart';
import 'package:flutter_nobel/domain/repository/nobel_repository.dart';
import 'package:flutter_nobel/domain/use_case/get_laureates_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNobelRepository extends Mock implements NobelRepository {}

void main() {
  late MockNobelRepository mockNobelRepository;
  late GetLaureatesUseCase getLaureatesUseCase;
  final testLaureateList = [
    const LaureateModel(
      id: '1',
      fullName: FullNameModel(en: ''),
      gender: '',
      birth: BirthModel(
        date: '',
        place: PlaceModel(
          city: CityModel(en: ''),
          country: CountryModel(en: ''),
        ),
      ),
      wikipedia: WikipediaModel(english: ''),
      nobelPrizes: [],
    ),
    const LaureateModel(
      id: '2',
      fullName: FullNameModel(en: ''),
      gender: '',
      birth: BirthModel(
        date: '',
        place: PlaceModel(
          city: CityModel(en: ''),
          country: CountryModel(en: ''),
        ),
      ),
      wikipedia: WikipediaModel(english: ''),
      nobelPrizes: [],
    )
  ];

  const apiOffset = 0;
  const categoryAbbreviation = '';

  setUp(() {
    mockNobelRepository = MockNobelRepository();
    getLaureatesUseCase = GetLaureatesUseCase(repository: mockNobelRepository);
  });

  test('should get list of laureates for a category from the repository',
      () async {
    when(
      () => mockNobelRepository.getLaureatesByCategory(
          apiOffset: apiOffset, categoryAbbreviation: categoryAbbreviation),
    ).thenAnswer((_) async => testLaureateList);

    final response = await getLaureatesUseCase(apiOffset: apiOffset, categoryAbbreviation: categoryAbbreviation);

    verify(() => mockNobelRepository.getLaureatesByCategory(apiOffset: apiOffset, categoryAbbreviation: categoryAbbreviation));

    expect(response, testLaureateList);
    verifyNoMoreInteractions(mockNobelRepository);
  });
  
}

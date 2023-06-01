import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sample/blocs/ship_bloc.dart';
import 'package:sample/models/ship_facts.dart';
import 'package:sample/repositories/ship_repository.dart';

void main() {
  group('ShipBloc', () {
    late MockShipRepository mockShipRepository;
    late ShipBloc shipBloc;

    setUp(() {
      mockShipRepository = MockShipRepository();
      shipBloc = ShipBloc(shipRepository: mockShipRepository);
    });

    test('ShipEventFetchShipFacts adds the fetched ship facts to the state',
        () {
      var mockShipFactsSky = ShipFacts(
        shipName: 'SKY',
        passengerCapacity: '2000',
        crew: '1000',
        inauguralDate: '1999-01-01',
      );

      when(mockShipRepository.fetchShipFacts('SKY'))
          .thenAnswer((_) async => mockShipFactsSky);

      blocTest<ShipBloc, ShipState>(
        'should emit states in the correct order',
        build: () => shipBloc,
        act: (bloc) => bloc.add(const ShipEventFetchShipFacts('SKY')),
        expect: () => [
          const ShipState(
            shipFacts: [],
            buttonStatus: ShipButtonStatus.loading,
          ),
          ShipState(
            shipFacts: [mockShipFactsSky],
            buttonStatus: ShipButtonStatus.loaded,
          ),
        ],
      );
    });
  });
}

class MockShipRepository extends Mock implements ShipRepository {
  @override
  Future<ShipFacts> fetchShipFacts(String shipName) async {
    return ShipFacts(
      shipName: 'SKY',
      passengerCapacity: '2000',
      crew: '1000',
      inauguralDate: '1999-01-01',
    );
  }
}

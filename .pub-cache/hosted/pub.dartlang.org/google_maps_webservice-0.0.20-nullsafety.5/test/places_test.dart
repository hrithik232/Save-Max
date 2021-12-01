import 'dart:async';

import 'package:google_maps_webservice/places.dart';
import 'package:test/test.dart';

Future<void> main() async {
  final apiKey = 'MY_API_KEY';
  var places = GoogleMapsPlaces(apiKey: apiKey);

  tearDownAll(() {
    places.dispose();
  });

  group('Google Maps Places', () {
    group('nearbysearch build url', () {
      final _uri = Uri(
        scheme: 'https',
        host: 'maps.googleapis.com',
        path: 'maps/api/place/nearbysearch/json',
      );

      test('basic', () {
        var url = places.buildNearbySearchUrl(
            location: Location(lat: -33.8670522, lng: 151.1957362),
            radius: 500);

        expect(
          url,
          _uri.replace(queryParameters: {
            'location': '-33.8670522,151.1957362',
            'radius': '500',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with type and keyword', () {
        var url = places.buildNearbySearchUrl(
          location: Location(lat: -33.8670522, lng: 151.1957362),
          radius: 500,
          type: 'restaurant',
          keyword: 'cruise',
        );

        expect(
          url,
          _uri.replace(queryParameters: {
            'location': '-33.8670522,151.1957362',
            'keyword': 'cruise',
            'type': 'restaurant',
            'radius': '500',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with language', () {
        var url = places.buildNearbySearchUrl(
          location: Location(lat: -33.8670522, lng: 151.1957362),
          radius: 500,
          language: 'fr',
        );

        expect(
          url,
          _uri.replace(queryParameters: {
            'location': '-33.8670522,151.1957362',
            'language': 'fr',
            'radius': '500',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with min and maxprice', () {
        var url = places.buildNearbySearchUrl(
          location: Location(lat: -33.8670522, lng: 151.1957362),
          radius: 500,
          minprice: PriceLevel.free,
          maxprice: PriceLevel.veryExpensive,
        );

        expect(
          url,
          _uri.replace(queryParameters: {
            'location': '-33.8670522,151.1957362',
            'minprice': '0',
            'maxprice': '4',
            'radius': '500',
            'key': apiKey,
          }).toString(),
        );
      });

      test('build url with name', () {
        var url = places.buildNearbySearchUrl(
          location: Location(lat: -33.8670522, lng: 151.1957362),
          radius: 500,
          name: 'cruise',
        );

        expect(
          url,
          _uri.replace(queryParameters: {
            'location': '-33.8670522,151.1957362',
            'name': 'cruise',
            'radius': '500',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with rankby', () {
        var url = places.buildNearbySearchUrl(
          location: Location(lat: -33.8670522, lng: 151.1957362),
          rankby: 'distance',
          name: 'cruise',
        );

        expect(
          url,
          _uri.replace(queryParameters: {
            'location': '-33.8670522,151.1957362',
            'name': 'cruise',
            'rankby': 'distance',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with rankby without required params', () {
        try {
          places.buildNearbySearchUrl(
            location: Location(lat: -33.8670522, lng: 151.1957362),
            rankby: 'distance',
            name: 'cruise',
          );
        } catch (e) {
          expect(
            (e as ArgumentError).message,
            equals(
              "If 'rankby=distance' is specified, then one or more of 'keyword', 'name', or 'type' is required.",
            ),
          );
        }
      });

      test('with rankby and radius', () {
        try {
          places.buildNearbySearchUrl(
            location: Location(lat: -33.8670522, lng: 151.1957362),
            radius: 500,
            rankby: 'distance',
          );
        } catch (e) {
          expect(
            (e as ArgumentError).message,
            equals("'rankby' must not be included if 'radius' is specified."),
          );
        }
      });
    });

    group('textsearch build url', () {
      final _uri = Uri(
        scheme: 'https',
        host: 'maps.googleapis.com',
        path: 'maps/api/place/textsearch/json',
      );

      test('basic', () {
        expect(
          places.buildTextSearchUrl(query: '123 Main Street'),
          _uri.replace(queryParameters: {
            'query': '123 Main Street',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with location', () {
        expect(
          places.buildTextSearchUrl(
            query: '123 Main Street',
            location: Location(lat: -33.8670522, lng: 151.1957362),
          ),
          _uri.replace(queryParameters: {
            'query': '123 Main Street',
            'location': '-33.8670522,151.1957362',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with radius', () {
        expect(
          places.buildTextSearchUrl(
            query: '123 Main Street',
            radius: 500,
          ),
          _uri.replace(queryParameters: {
            'query': '123 Main Street',
            'radius': '500',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with language', () {
        expect(
          places.buildTextSearchUrl(
            query: '123 Main Street',
            language: 'fr',
          ),
          _uri.replace(queryParameters: {
            'query': '123 Main Street',
            'language': 'fr',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with minprice and maxprice', () {
        expect(
          places.buildTextSearchUrl(
            query: '123 Main Street',
            minprice: PriceLevel.free,
            maxprice: PriceLevel.veryExpensive,
          ),
          _uri.replace(queryParameters: {
            'query': '123 Main Street',
            'minprice': '0',
            'maxprice': '4',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with opennow', () {
        expect(
          places.buildTextSearchUrl(
            query: '123 Main Street',
            opennow: true,
          ),
          _uri.replace(queryParameters: {
            'query': '123 Main Street',
            'opennow': 'true',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with pagetoken', () {
        expect(
          places.buildTextSearchUrl(
            query: '123 Main Street',
            pagetoken: 'egdsfdsfdsf',
          ),
          _uri.replace(queryParameters: {
            'query': '123 Main Street',
            'pagetoken': 'egdsfdsfdsf',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with type', () {
        expect(
          places.buildTextSearchUrl(
            query: '123 Main Street',
            type: 'hospital',
          ),
          _uri.replace(queryParameters: {
            'query': '123 Main Street',
            'type': 'hospital',
            'key': apiKey,
          }).toString(),
        );
      });
    });

    group('details build url', () {
      final _uri = Uri(
        scheme: 'https',
        host: 'maps.googleapis.com',
        path: 'maps/api/place/details/json',
      );

      test('with place_id', () {
        expect(
          places.buildDetailsUrl(placeId: 'PLACE_ID'),
          _uri.replace(queryParameters: {
            'placeid': 'PLACE_ID',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with reference', () {
        expect(
          places.buildDetailsUrl(reference: 'REF'),
          _uri.replace(queryParameters: {
            'reference': 'REF',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with fields', () {
        expect(
          places.buildDetailsUrl(
            placeId: 'PLACE_ID',
            fields: [
              'address_component',
              'opening_hours',
              'geometry',
            ],
          ),
          _uri.replace(queryParameters: {
            'placeid': 'PLACE_ID',
            'fields': 'address_component,opening_hours,geometry',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with language', () {
        expect(
          places.buildDetailsUrl(
            placeId: 'PLACE_ID',
            language: 'fr',
          ),
          _uri.replace(queryParameters: {
            'placeid': 'PLACE_ID',
            'language': 'fr',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with place_id and reference', () {
        try {
          places.buildDetailsUrl(placeId: 'PLACE_ID', reference: 'REF');
        } catch (e) {
          expect((e as ArgumentError).message,
              equals("You must supply either 'placeid' or 'reference'"));
        }
      });
    });

    group('photo build url', () {
      final _uri = Uri(
        scheme: 'https',
        host: 'maps.googleapis.com',
        path: 'maps/api/place/photo',
      );

      test('missing maxWidth and maxHeight', () {
        try {
          places.buildPhotoUrl(photoReference: 'PHOTO_REFERENCE');
        } catch (e) {
          expect((e as ArgumentError).message,
              equals("You must supply 'maxWidth' or 'maxHeight'"));
        }
      });
      test('with maxheight', () {
        expect(
          places.buildPhotoUrl(
            photoReference: 'PHOTO_REFERENCE',
            maxHeight: 100,
          ),
          _uri.replace(queryParameters: {
            'photoreference': 'PHOTO_REFERENCE',
            'maxheight': '100',
            'key': apiKey,
          }).toString(),
        );
      });
      test('with maxwidth', () {
        expect(
          places.buildPhotoUrl(
            photoReference: 'PHOTO_REFERENCE',
            maxWidth: 100,
          ),
          _uri.replace(queryParameters: {
            'photoreference': 'PHOTO_REFERENCE',
            'maxwidth': '100',
            'key': apiKey,
          }).toString(),
        );
      });
    });

    group('autocomplete build url', () {
      final _uri = Uri(
        scheme: 'https',
        host: 'maps.googleapis.com',
        path: 'maps/api/place/autocomplete/json',
      );

      test('basic', () {
        expect(
          places.buildAutocompleteUrl(input: 'Amoeba Test'),
          _uri.replace(queryParameters: {
            'input': 'Amoeba Test',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with offset', () {
        expect(
          places.buildAutocompleteUrl(
            input: 'Amoeba Test',
            offset: 3,
          ),
          _uri.replace(queryParameters: {
            'input': 'Amoeba Test',
            'offset': '3',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with location', () {
        expect(
          places.buildAutocompleteUrl(
            input: 'Amoeba Test',
            location: Location(lat: -33.8670522, lng: 151.195736),
          ),
          _uri.replace(queryParameters: {
            'input': 'Amoeba Test',
            'location': '-33.8670522,151.195736',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with origin', () {
        expect(
          places.buildAutocompleteUrl(
            input: 'Amoeba Test',
            origin: Location(lat: -33.8670522, lng: 151.1957362),
          ),
          _uri.replace(queryParameters: {
            'input': 'Amoeba Test',
            'origin': '-33.8670522,151.1957362',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with radius', () {
        expect(
          places.buildAutocompleteUrl(
            input: 'Amoeba Test',
            radius: 500,
          ),
          _uri.replace(queryParameters: {
            'input': 'Amoeba Test',
            'radius': '500',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with language', () {
        expect(
          places.buildAutocompleteUrl(
            input: 'Amoeba Test',
            language: 'fr',
          ),
          _uri.replace(queryParameters: {
            'input': 'Amoeba Test',
            'language': 'fr',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with types', () {
        expect(
          places.buildAutocompleteUrl(
            input: 'Amoeba Test',
            types: ['geocode', 'establishment'],
          ),
          _uri.replace(queryParameters: {
            'input': 'Amoeba Test',
            'types': 'geocode|establishment',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with components', () {
        expect(
          places.buildAutocompleteUrl(
            input: 'Amoeba Test',
            components: [
              Component(Component.country, 'fr'),
              Component(Component.locality, 'Paris'),
            ],
          ),
          _uri.replace(queryParameters: {
            'input': 'Amoeba Test',
            'components': 'country:fr|locality:Paris',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with strictbounds', () {
        expect(
          places.buildAutocompleteUrl(
            input: 'Amoeba Test',
            strictbounds: true,
          ),
          _uri.replace(queryParameters: {
            'input': 'Amoeba Test',
            'strictbounds': 'true',
            'key': apiKey,
          }).toString(),
        );
      });
    });

    group('queryautocomplete', () {
      final _uri = Uri(
        scheme: 'https',
        host: 'maps.googleapis.com',
        path: 'maps/api/place/queryautocomplete/json',
      );

      test('basic', () {
        expect(
          places.buildQueryAutocompleteUrl(input: 'Amoeba Test'),
          _uri.replace(queryParameters: {
            'input': 'Amoeba Test',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with offset', () {
        expect(
          places.buildQueryAutocompleteUrl(
            input: 'Amoeba Test',
            offset: 3,
          ),
          _uri.replace(queryParameters: {
            'input': 'Amoeba Test',
            'offset': '3',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with location', () {
        expect(
          places.buildQueryAutocompleteUrl(
            input: 'Amoeba Test',
            location: Location(lat: -33.8670522, lng: 151.1957362),
          ),
          _uri.replace(queryParameters: {
            'input': 'Amoeba Test',
            'location': '-33.8670522,151.1957362',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with radius', () {
        expect(
          places.buildQueryAutocompleteUrl(
            input: 'Amoeba Test',
            radius: 500,
          ),
          _uri.replace(queryParameters: {
            'input': 'Amoeba Test',
            'radius': '500',
            'key': apiKey,
          }).toString(),
        );
      });

      test('with language', () {
        expect(
          places.buildQueryAutocompleteUrl(
            input: 'Amoeba Test',
            language: 'fr',
          ),
          _uri.replace(queryParameters: {
            'input': 'Amoeba Test',
            'language': 'fr',
            'key': apiKey,
          }).toString(),
        );
      });
    });

    test('decode search response', () {
      var response = PlacesSearchResponse.fromJson(_searchResponseExample);

      expect(response.isOkay, isTrue);
      expect(response.results, hasLength(equals(4)));
      expect(response.results.first.geometry?.location.lat, equals(-33.870775));
      expect(response.results.first.geometry?.location.lng, equals(151.199025));
      expect(
          response.results.first.icon,
          equals(
              'http://maps.gstatic.com/mapfiles/place_api/icons/travel_agent-71.png'));
      expect(response.results.first.id,
          equals('21a0b251c9b8392186142c798263e289fe45b4aa'));
      expect(response.results.first.name, equals('Rhythmboat Cruises'));
      expect(response.results.first.openingHours?.openNow, isTrue);
      expect(response.results.first.photos, hasLength(equals(1)));
      expect(response.results.first.photos.first.height, equals(270));
      expect(response.results.first.photos.first.width, equals(519));
      expect(
          response.results.first.photos.first.photoReference,
          equals(
              'CnRnAAAAF-LjFR1ZV93eawe1cU_3QNMCNmaGkowY7CnOf-kcNmPhNnPEG9W979jOuJJ1sGr75rhD5hqKzjD8vbMbSsRnq_Ni3ZIGfY6hKWmsOf3qHKJInkm4h55lzvLAXJVc-Rr4kI9O1tmIblblUpg2oqoq8RIQRMQJhFsTr5s9haxQ07EQHxoUO0ICubVFGYfJiMUPor1GnIWb5i8'));
      expect(response.results.first.placeId,
          equals('ChIJyWEHuEmuEmsRm9hTkapTCrk'));
      expect(response.results.first.scope, equals('GOOGLE'));
      expect(response.results.first.altIds, hasLength(equals(1)));
      expect(response.results.first.altIds.first.placeId,
          equals('D9iJyWEHuEmuEmsRm9hTkapTCrk'));
      expect(response.results.first.altIds.first.scope, equals('APP'));
      expect(
          response.results.first.reference,
          equals(
              'CoQBdQAAAFSiijw5-cAV68xdf2O18pKIZ0seJh03u9h9wk_lEdG-cP1dWvp_QGS4SNCBMk_fB06YRsfMrNkINtPez22p5lRIlj5ty_HmcNwcl6GZXbD2RdXsVfLYlQwnZQcnu7ihkjZp_2gk1-fWXql3GQ8-1BEGwgCxG-eaSnIJIBPuIpihEhAY1WYdxPvOWsPnb2-nGb6QGhTipN0lgaLpQTnkcMeAIEvCsSa0Ww'));
      expect(response.results.first.types,
          equals(['travel_agency', 'restaurant', 'food', 'establishment']));
      expect(response.results.first.vicinity,
          equals('Pyrmont Bay Wharf Darling Dr, Sydney'));
    });

    test('decode autocomplete response', () {
      final response =
          PlacesAutocompleteResponse.fromJson(_autocompleteResponseExample);

      expect(response.isOkay, isTrue);
      expect(response.errorMessage, isNull);

      expect(response.predictions, hasLength(3));

      final p1 = response.predictions.first;

      expect(p1.description, 'Paris, France');
      expect(p1.distanceMeters, 8030004);
      expect(p1.id, '691b237b0322f28988f3ce03e321ff72a12167fd');
      expect(p1.matchedSubstrings, hasLength(1));
      expect(
          p1.matchedSubstrings.first, MatchedSubstring(offset: 0, length: 5));
      expect(p1.placeId, 'ChIJD7fiBh9u5kcRYJSMaMOCCwQ');
      expect(p1.reference,
          'CjQlAAAA_KB6EEceSTfkteSSF6U0pvumHCoLUboRcDlAH05N1pZJLmOQbYmboEi0SwXBSoI2EhAhj249tFDCVh4R-PXZkPK8GhTBmp_6_lWljaf1joVs1SH2ttB_tw');
      expect(p1.terms,
          [Term(offset: 0, value: 'Paris'), Term(offset: 7, value: 'France')]);
      expect(p1.types, ['locality', 'political', 'geocode']);
    });
  });

  group('Place Search Response', () {
    test('decode text search response', () {
      var response = PlacesSearchResponse.fromJson(_textSearchResponseExample);

      expect(response.isOkay, isTrue);
      expect(response.results, hasLength(equals(1)));
      expect(
          response.results.first.geometry?.location.lat, equals(-37.8136276));
      expect(
          response.results.first.geometry?.location.lng, equals(144.9630576));
      expect(
          response.results.first.icon,
          equals(
              'https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/geocode-71.png'));
      expect(response.results.first.id, isNull);
      expect(response.results.first.name, equals('Melbourne'));
      expect(response.results.first.openingHours, isNull);
      expect(response.results.first.photos, hasLength(equals(1)));
      expect(response.results.first.photos.first.height, equals(810));
      expect(response.results.first.photos.first.width, equals(1080));
      expect(
          response.results.first.photos.first.photoReference,
          equals(
              'ATtYBwK5nQr4pKVwk0xnAaIV2hj-I4710I5sdXh7eGGBQWFrOD1N7AJgXy7ZnHwsE0Lbk9yNlj42REQM8ZWKm-7HIDj1mrNXEh6lWoNPc9JVywROmrHVCqnOuER3bmbrGQR7JRsF3n2uBilksqdJoSNuvr8BH4S4KJpyD_CiIUhed1JAvoEo'));
      expect(response.results.first.placeId,
          equals('ChIJ90260rVG1moRkM2MIXVWBAQ'));
      expect(response.results.first.scope, isNull);
      expect(response.results.first.altIds, isEmpty);
      expect(response.results.first.reference,
          equals('ChIJ90260rVG1moRkM2MIXVWBAQ'));
      expect(response.results.first.types,
          equals(['colloquial_area', 'locality', 'political']));
      expect(response.results.first.vicinity, isNull);
    });
  });

  group('Place details response', () {
    test('decode place details with null review language', () {
      final details = PlaceDetails.fromJson(_placeDetailsExample);

      expect(details.id, isNull);
      expect(details.addressComponents, hasLength(6));
      expect(details.adrAddress, startsWith('<span class='));
      expect(details.formattedAddress,
          equals('Filigudi Ct, Frankston South VIC 3199, Australia'));
      expect(details.formattedPhoneNumber, equals('0431 887 848'));
      expect(
          details.icon,
          equals(
              'https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png'));
      expect(details.reviews, hasLength(3));
      expect(details.reviews.map((e) => e.language), anyElement(isNull));
    });
  });
}

final _searchResponseExample = {
  'html_attributions': [],
  'results': [
    {
      'geometry': {
        'location': {'lat': -33.870775, 'lng': 151.199025}
      },
      'icon':
          'http://maps.gstatic.com/mapfiles/place_api/icons/travel_agent-71.png',
      'id': '21a0b251c9b8392186142c798263e289fe45b4aa',
      'name': 'Rhythmboat Cruises',
      'opening_hours': {'open_now': true},
      'photos': [
        {
          'height': 270,
          'html_attributions': [],
          'photo_reference':
              'CnRnAAAAF-LjFR1ZV93eawe1cU_3QNMCNmaGkowY7CnOf-kcNmPhNnPEG9W979jOuJJ1sGr75rhD5hqKzjD8vbMbSsRnq_Ni3ZIGfY6hKWmsOf3qHKJInkm4h55lzvLAXJVc-Rr4kI9O1tmIblblUpg2oqoq8RIQRMQJhFsTr5s9haxQ07EQHxoUO0ICubVFGYfJiMUPor1GnIWb5i8',
          'width': 519
        }
      ],
      'place_id': 'ChIJyWEHuEmuEmsRm9hTkapTCrk',
      'scope': 'GOOGLE',
      'alt_ids': [
        {'place_id': 'D9iJyWEHuEmuEmsRm9hTkapTCrk', 'scope': 'APP'}
      ],
      'reference':
          'CoQBdQAAAFSiijw5-cAV68xdf2O18pKIZ0seJh03u9h9wk_lEdG-cP1dWvp_QGS4SNCBMk_fB06YRsfMrNkINtPez22p5lRIlj5ty_HmcNwcl6GZXbD2RdXsVfLYlQwnZQcnu7ihkjZp_2gk1-fWXql3GQ8-1BEGwgCxG-eaSnIJIBPuIpihEhAY1WYdxPvOWsPnb2-nGb6QGhTipN0lgaLpQTnkcMeAIEvCsSa0Ww',
      'types': ['travel_agency', 'restaurant', 'food', 'establishment'],
      'vicinity': 'Pyrmont Bay Wharf Darling Dr, Sydney'
    },
    {
      'geometry': {
        'location': {'lat': -33.866891, 'lng': 151.200814}
      },
      'icon':
          'http://maps.gstatic.com/mapfiles/place_api/icons/restaurant-71.png',
      'id': '45a27fd8d56c56dc62afc9b49e1d850440d5c403',
      'name': 'Private Charter Sydney Habour Cruise',
      'photos': [
        {
          'height': 426,
          'html_attributions': [],
          'photo_reference':
              'CnRnAAAAL3n0Zu3U6fseyPl8URGKD49aGB2Wka7CKDZfamoGX2ZTLMBYgTUshjr-MXc0_O2BbvlUAZWtQTBHUVZ-5Sxb1-P-VX2Fx0sZF87q-9vUt19VDwQQmAX_mjQe7UWmU5lJGCOXSgxp2fu1b5VR_PF31RIQTKZLfqm8TA1eynnN4M1XShoU8adzJCcOWK0er14h8SqOIDZctvU',
          'width': 640
        }
      ],
      'place_id': 'ChIJqwS6fjiuEmsRJAMiOY9MSms',
      'scope': 'GOOGLE',
      'reference':
          'CpQBhgAAAFN27qR_t5oSDKPUzjQIeQa3lrRpFTm5alW3ZYbMFm8k10ETbISfK9S1nwcJVfrP-bjra7NSPuhaRulxoonSPQklDyB-xGvcJncq6qDXIUQ3hlI-bx4AxYckAOX74LkupHq7bcaREgrSBE-U6GbA1C3U7I-HnweO4IPtztSEcgW09y03v1hgHzL8xSDElmkQtRIQzLbyBfj3e0FhJzABXjM2QBoUE2EnL-DzWrzpgmMEulUBLGrtu2Y',
      'types': ['restaurant', 'food', 'establishment'],
      'vicinity': 'Australia'
    },
    {
      'geometry': {
        'location': {'lat': -33.870943, 'lng': 151.190311}
      },
      'icon':
          'http://maps.gstatic.com/mapfiles/place_api/icons/restaurant-71.png',
      'id': '30bee58f819b6c47bd24151802f25ecf11df8943',
      'name': 'Bucks Party Cruise',
      'opening_hours': {'open_now': true},
      'photos': [
        {
          'height': 600,
          'html_attributions': [],
          'photo_reference':
              'CnRnAAAA48AX5MsHIMiuipON_Lgh97hPiYDFkxx_vnaZQMOcvcQwYN92o33t5RwjRpOue5R47AjfMltntoz71hto40zqo7vFyxhDuuqhAChKGRQ5mdO5jv5CKWlzi182PICiOb37PiBtiFt7lSLe1SedoyrD-xIQD8xqSOaejWejYHCN4Ye2XBoUT3q2IXJQpMkmffJiBNftv8QSwF4',
          'width': 800
        }
      ],
      'place_id': 'ChIJLfySpTOuEmsRsc_JfJtljdc',
      'scope': 'GOOGLE',
      'reference':
          'CoQBdQAAANQSThnTekt-UokiTiX3oUFT6YDfdQJIG0ljlQnkLfWefcKmjxax0xmUpWjmpWdOsScl9zSyBNImmrTO9AE9DnWTdQ2hY7n-OOU4UgCfX7U0TE1Vf7jyODRISbK-u86TBJij0b2i7oUWq2bGr0cQSj8CV97U5q8SJR3AFDYi3ogqEhCMXjNLR1k8fiXTkG2BxGJmGhTqwE8C4grdjvJ0w5UsAVoOH7v8HQ',
      'types': ['restaurant', 'food', 'establishment'],
      'vicinity': '37 Bank St, Pyrmont'
    },
    {
      'geometry': {
        'location': {'lat': -33.867591, 'lng': 151.201196}
      },
      'icon':
          'http://maps.gstatic.com/mapfiles/place_api/icons/travel_agent-71.png',
      'id': 'a97f9fb468bcd26b68a23072a55af82d4b325e0d',
      'name': 'Australian Cruise Group',
      'opening_hours': {'open_now': true},
      'photos': [
        {
          'height': 242,
          'html_attributions': [],
          'photo_reference':
              'CnRnAAAABjeoPQ7NUU3pDitV4Vs0BgP1FLhf_iCgStUZUr4ZuNqQnc5k43jbvjKC2hTGM8SrmdJYyOyxRO3D2yutoJwVC4Vp_dzckkjG35L6LfMm5sjrOr6uyOtr2PNCp1xQylx6vhdcpW8yZjBZCvVsjNajLBIQ-z4ttAMIc8EjEZV7LsoFgRoU6OrqxvKCnkJGb9F16W57iIV4LuM',
          'width': 200
        }
      ],
      'place_id': 'ChIJrTLr-GyuEmsRBfy61i59si0',
      'scope': 'GOOGLE',
      'reference':
          'CoQBeQAAAFvf12y8veSQMdIMmAXQmus1zqkgKQ-O2KEX0Kr47rIRTy6HNsyosVl0CjvEBulIu_cujrSOgICdcxNioFDHtAxXBhqeR-8xXtm52Bp0lVwnO3LzLFY3jeo8WrsyIwNE1kQlGuWA4xklpOknHJuRXSQJVheRlYijOHSgsBQ35mOcEhC5IpbpqCMe82yR136087wZGhSziPEbooYkHLn9e5njOTuBprcfVw',
      'types': ['travel_agency', 'restaurant', 'food', 'establishment'],
      'vicinity': '32 The Promenade, King Street Wharf 5, Sydney'
    }
  ],
  'status': 'OK'
};

final _autocompleteResponseExample = {
  'status': 'OK',
  'predictions': [
    {
      'description': 'Paris, France',
      'distance_meters': 8030004,
      'id': '691b237b0322f28988f3ce03e321ff72a12167fd',
      'matched_substrings': [
        {'length': 5, 'offset': 0}
      ],
      'place_id': 'ChIJD7fiBh9u5kcRYJSMaMOCCwQ',
      'reference':
          'CjQlAAAA_KB6EEceSTfkteSSF6U0pvumHCoLUboRcDlAH05N1pZJLmOQbYmboEi0SwXBSoI2EhAhj249tFDCVh4R-PXZkPK8GhTBmp_6_lWljaf1joVs1SH2ttB_tw',
      'terms': [
        {'offset': 0, 'value': 'Paris'},
        {'offset': 7, 'value': 'France'}
      ],
      'types': ['locality', 'political', 'geocode']
    },
    {
      'description':
          'Paris-Madrid Grocery (Spanish Table Seattle), Western Avenue, Seattle, WA, USA',
      'distance_meters': 12597,
      'id': 'f4231a82cfe0633a6a32e63538e61c18277d01c0',
      'matched_substrings': [
        {'length': 5, 'offset': 0}
      ],
      'place_id': 'ChIJHcYlZ7JqkFQRlpy-6pytmPI',
      'reference': 'ChIJHcYlZ7JqkFQRlpy-6pytmPI',
      'structured_formatting': {
        'main_text': 'Paris-Madrid Grocery (Spanish Table Seattle)',
        'main_text_matched_substrings': [
          {'length': 5, 'offset': 0}
        ],
        'secondary_text': 'Western Avenue, Seattle, WA, USA'
      },
      'terms': [
        {'offset': 0, 'value': 'Paris-Madrid Grocery (Spanish Table Seattle)'},
        {'offset': 46, 'value': 'Western Avenue'},
        {'offset': 62, 'value': 'Seattle'},
        {'offset': 71, 'value': 'WA'},
        {'offset': 75, 'value': 'USA'}
      ],
      'types': [
        'grocery_or_supermarket',
        'food',
        'store',
        'point_of_interest',
        'establishment'
      ]
    },
    {
      'description': 'Paris, TX, USA',
      'distance_meters': 2712292,
      'id': '518e47f3d7f39277eb3bc895cb84419c2b43b5ac',
      'matched_substrings': [
        {'length': 5, 'offset': 0}
      ],
      'place_id': 'ChIJmysnFgZYSoYRSfPTL2YJuck',
      'reference': 'ChIJmysnFgZYSoYRSfPTL2YJuck',
      'structured_formatting': {
        'main_text': 'Paris',
        'main_text_matched_substrings': [
          {'length': 5, 'offset': 0}
        ],
        'secondary_text': 'TX, USA'
      },
      'terms': [
        {'offset': 0, 'value': 'Paris'},
        {'offset': 7, 'value': 'TX'},
        {'offset': 11, 'value': 'USA'}
      ],
      'types': ['locality', 'political', 'geocode']
    }
  ]
};

const _textSearchResponseExample = {
  'html_attributions': [],
  'next_page_token':
      'HLx6WLSSOdkvf0uHaIppbWYqZzx5cSuZa0xMp6nuaCxm7tdUuZa6JT898vAerxj8wRkMIlsYGEjQ9m0d6rQ',
  'results': [
    {
      'formatted_address': 'Melbourne VIC, Australia',
      'geometry': {
        'location': {'lat': -37.8136276, 'lng': 144.9630576},
        'viewport': {
          'northeast': {'lat': -37.5112736581378, 'lng': 145.512528780816},
          'southwest': {'lat': -38.43385934606902, 'lng': 144.5937417793496}
        }
      },
      'icon':
          'https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/geocode-71.png',
      'name': 'Melbourne',
      'photos': [
        {
          'height': 810,
          'html_attributions': [
            '\u003ca href=\"https://maps.google.com/maps/contrib/107196947767897770095\"\u003eUwe Delau\u003c/a\u003e'
          ],
          'photo_reference':
              'ATtYBwK5nQr4pKVwk0xnAaIV2hj-I4710I5sdXh7eGGBQWFrOD1N7AJgXy7ZnHwsE0Lbk9yNlj42REQM8ZWKm-7HIDj1mrNXEh6lWoNPc9JVywROmrHVCqnOuER3bmbrGQR7JRsF3n2uBilksqdJoSNuvr8BH4S4KJpyD_CiIUhed1JAvoEo',
          'width': 1080
        }
      ],
      'place_id': 'ChIJ90260rVG1moRkM2MIXVWBAQ',
      'reference': 'ChIJ90260rVG1moRkM2MIXVWBAQ',
      'types': ['colloquial_area', 'locality', 'political']
    }
  ],
  'status': 'OK'
};

const _placeDetailsExample = {
  'address_components': [
    {
      'long_name': 'Filigudi Court',
      'short_name': 'Filigudi Ct',
      'types': ['route']
    },
    {
      'long_name': 'Frankston South',
      'short_name': 'Frankston South',
      'types': ['locality', 'political']
    },
    {
      'long_name': 'Frankston City',
      'short_name': 'Frankston',
      'types': ['administrative_area_level_2', 'political']
    },
    {
      'long_name': 'Victoria',
      'short_name': 'VIC',
      'types': ['administrative_area_level_1', 'political']
    },
    {
      'long_name': 'Australia',
      'short_name': 'AU',
      'types': ['country', 'political']
    },
    {
      'long_name': '3199',
      'short_name': '3199',
      'types': ['postal_code']
    }
  ],
  'adr_address':
      '<span class=\"street-address\">Filigudi Ct</span>, <span class=\"locality\">Frankston South</span> <span class=\"region\">VIC</span> <span class=\"postal-code\">3199</span>, <span class=\"country-name\">Australia</span>',
  'business_status': 'OPERATIONAL',
  'formatted_address': 'Filigudi Ct, Frankston South VIC 3199, Australia',
  'formatted_phone_number': '0431 887 848',
  'geometry': {
    'location': {'lat': -38.1867284, 'lng': 145.1455111},
    'viewport': {
      'northeast': {'lat': -38.1853919197085, 'lng': 145.1468263302915},
      'southwest': {'lat': -38.1880898802915, 'lng': 145.1441283697085}
    }
  },
  'icon':
      'https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png',
  'international_phone_number': '+61 431 887 848',
  'name': 'Habitat Surf',
  'photos': [
    {
      'height': 4032,
      'html_attributions': [
        '<a href=\"https://maps.google.com/maps/contrib/101246297873069804005\">Habitat Surf</a>'
      ],
      'photo_reference':
          'ATtYBwLH_-MyoefQNFeI_G3WoFTdjI-zTcK6-KhRS2qYdaHvvHPW-80408rIrTOCCV1SAiYNp40x-Ut7hBGrzP6PM0I4c0WrFPGybaF_ftyNOdAD2l7D6LhfXbgqfbv7hMXTZkP-bdEK24i2_SF5Y7tkHErPRzD3Z1EAfz4wKwQ1mmbxLCV1',
      'width': 2268
    },
    {
      'height': 3557,
      'html_attributions': [
        '<a href=\"https://maps.google.com/maps/contrib/101246297873069804005\">Habitat Surf</a>'
      ],
      'photo_reference':
          'ATtYBwJ9LhX8MhRj8lnJnlqmv-6uraUb_5_ozvQxuzRGRyTniZjo0_bzyh-Mi7SXvH9OSyqB8qwIk2EdnBOuHoU6tlsEGs7wCSNUFeWiI20AKGjrYgeu073sTvwVr_Of0Ka7258NKdf1qEdiQx2ZY8P4wcRb9TkyRjaEXZi2-aCGmLEulHke',
      'width': 3024
    },
    {
      'height': 1024,
      'html_attributions': [
        '<a href=\"https://maps.google.com/maps/contrib/101246297873069804005\">Habitat Surf</a>'
      ],
      'photo_reference':
          'ATtYBwIcWzamoiCsqsBSVTYlF4TujnnfK2C8sBSk0fwyrB-tw5D-6KKg7uuRL2l_Ndi-7RnrcYV9otV0l41pu5lEus2tkTyVxkyFWOj_cN-zJiOkyBSleC3II2ozocDsxXiEsWzUhxKiMJjYI1Bsi186kIbzsBMYjLoD64dgBoSfrBQVhG8h',
      'width': 1024
    },
    {
      'height': 2268,
      'html_attributions': [
        '<a href=\"https://maps.google.com/maps/contrib/101246297873069804005\">Habitat Surf</a>'
      ],
      'photo_reference':
          'ATtYBwJiDjV_qKQoxeTMie8lpIatwAGpjpx2oOB_0iQSO5Z87NP5OgPBncLA6ti--yYgXAll17RynG89FlQNSfm7_eua-Qbd7Fyu2-FxIecp60lqIgI9gt-SXSFMRrH_pYxj2SgXVpcIN5ObRFm6-E8V8hARy78dBBBuNAzLKegylJoypikp',
      'width': 4032
    },
    {
      'height': 2268,
      'html_attributions': [
        '<a href=\"https://maps.google.com/maps/contrib/101246297873069804005\">Habitat Surf</a>'
      ],
      'photo_reference':
          'ATtYBwI3Plt0GnRqnTpBil97Ggn7p4Da6-x6RP3My8Mldd0qJFK-gm0khac0VTe4bLIjkbq4dVeqYtnJq9__GQTGjGoO9s1iPI8bjmnwPUXUTRXf_gtU7AGrwPBUfqL5KsmCMq4SUtOWRKVCIZ1IwQclziSg9UCy3ZfJWazI--Be4IYV88PY',
      'width': 4032
    }
  ],
  'place_id': 'ChIJOaVBtTEL1moR5DB1DK8b_6k',
  'plus_code': {
    'compound_code': 'R47W+86 Frankston South VIC, Australia',
    'global_code': '4RH7R47W+86'
  },
  'rating': 5,
  'reference': 'ChIJOaVBtTEL1moR5DB1DK8b_6k',
  'reviews': [
    {
      'author_name': 'Lara Simpkin',
      'author_url':
          'https://www.google.com/maps/contrib/117980375521320943840/reviews',
      'language': 'en',
      'profile_photo_url':
          'https://lh6.googleusercontent.com/-AUyEguuteZ4/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucm0aQ9YcgyecL1MOW2w3irNfj0fBQ/s128-c0x00000000-cc-rp-mo/photo.jpg',
      'rating': 5,
      'relative_time_description': '3 weeks ago',
      'text':
          'I nabbed one of these boards for our living room as a display. It perfectly compliments our modern coastal aesthetic - we always get compliments on it!',
      'time': 1615440498
    },
    {
      'author_name': 'David Coyne',
      'author_url':
          'https://www.google.com/maps/contrib/112991978235168481824/reviews',
      'profile_photo_url':
          'https://lh6.googleusercontent.com/-We_CzC0y0Kg/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuckQJRKvgC10HUkNiNzZ2TJRyu2W3A/s128-c0x00000000-cc-rp-mo/photo.jpg',
      'rating': 5,
      'relative_time_description': '3 weeks ago',
      'text': '',
      'time': 1615428580
    },
    {
      'author_name': 'Dave O',
      'author_url':
          'https://www.google.com/maps/contrib/115299138534899794552/reviews',
      'profile_photo_url':
          'https://lh3.googleusercontent.com/-vMsKOs0joL4/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucndtNljtuj_7VlO7uH9vCXoXFVw5A/s128-c0x00000000-cc-rp-mo-ba2/photo.jpg',
      'rating': 5,
      'relative_time_description': '3 weeks ago',
      'text': '',
      'time': 1615427962
    }
  ],
  'types': ['point_of_interest', 'store', 'establishment'],
  'url': 'https://maps.google.com/?cid=12249539950113272036',
  'user_ratings_total': 3,
  'utc_offset': 600,
  'vicinity': 'Filigudi Court, Frankston South',
  'website': 'http://habitatsurf.com.au/'
};

///
//  Generated code. Do not modify.
//  source: fonts.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const FileSpec$json = const {
  '1': 'FileSpec',
  '2': const [
    const {'1': 'filename', '3': 1, '4': 1, '5': 9, '10': 'filename'},
    const {'1': 'file_size', '3': 2, '4': 1, '5': 3, '10': 'fileSize'},
    const {'1': 'hash', '3': 3, '4': 1, '5': 12, '10': 'hash'},
  ],
};

const IntRange$json = const {
  '1': 'IntRange',
  '2': const [
    const {'1': 'start', '3': 1, '4': 1, '5': 5, '10': 'start'},
    const {'1': 'end', '3': 2, '4': 1, '5': 5, '7': '0', '10': 'end'},
  ],
};

const FloatRange$json = const {
  '1': 'FloatRange',
  '2': const [
    const {'1': 'start', '3': 1, '4': 1, '5': 2, '10': 'start'},
    const {'1': 'end', '3': 2, '4': 1, '5': 2, '7': '0', '10': 'end'},
  ],
};

const Font$json = const {
  '1': 'Font',
  '2': const [
    const {
      '1': 'file',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.fonts.FileSpec',
      '10': 'file'
    },
    const {
      '1': 'weight',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.fonts.IntRange',
      '10': 'weight'
    },
    const {
      '1': 'width',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.fonts.FloatRange',
      '10': 'width'
    },
    const {
      '1': 'italic',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.fonts.FloatRange',
      '10': 'italic'
    },
    const {'1': 'ttc_index', '3': 7, '4': 1, '5': 5, '10': 'ttcIndex'},
  ],
  '9': const [
    const {'1': 5, '2': 6},
    const {'1': 6, '2': 7},
  ],
};

const FontFamily$json = const {
  '1': 'FontFamily',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'version', '3': 2, '4': 1, '5': 5, '10': 'version'},
    const {
      '1': 'fonts',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.fonts.Font',
      '10': 'fonts'
    },
  ],
};

const Directory$json = const {
  '1': 'Directory',
  '2': const [
    const {
      '1': 'family',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.fonts.FontFamily',
      '10': 'family'
    },
    const {'1': 'name_lookup', '3': 2, '4': 3, '5': 5, '10': 'nameLookup'},
    const {'1': 'strings', '3': 3, '4': 3, '5': 9, '10': 'strings'},
    const {'1': 'prefetch', '3': 4, '4': 3, '5': 5, '10': 'prefetch'},
    const {'1': 'version', '3': 5, '4': 1, '5': 5, '10': 'version'},
    const {'1': 'description', '3': 6, '4': 1, '5': 9, '10': 'description'},
  ],
};

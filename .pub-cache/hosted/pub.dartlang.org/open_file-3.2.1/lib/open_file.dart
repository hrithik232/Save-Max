library open_file;

export 'src/common/open_result.dart';
export 'src/plaform/open_file.dart'
    if (dart.library.html) 'src/web/open_file.dart';

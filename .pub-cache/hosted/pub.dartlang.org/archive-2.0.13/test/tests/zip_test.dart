import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'package:archive/archive_io.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

import 'test_utils.dart';

final zipTests = <dynamic>[
  {
    'Name': 'res/zip/test.zip',
    'Comment': 'This is a zipfile comment.',
    'File': [
      {
        'Name': 'test.txt',
        'Content': 'This is a test text file.\n'.codeUnits,
        'Mtime': '09-05-10 12:12:02',
        'Mode': 0644,
      },
      {
        'Name': 'gophercolor16x16.png',
        'File': 'gophercolor16x16.png',
        'Mtime': '09-05-10 15:52:58',
        'Mode': 0644,
      },
    ],
  },
  {
    'Name': 'res/zip/test-trailing-junk.zip',
    'Comment': 'This is a zipfile comment.',
    'File': [
      {
        'Name': 'test.txt',
        'Content': 'This is a test text file.\n'.codeUnits,
        'Mtime': '09-05-10 12:12:02',
        'Mode': 0644,
      },
      {
        'Name': 'gophercolor16x16.png',
        'File': 'gophercolor16x16.png',
        'Mtime': '09-05-10 15:52:58',
        'Mode': 0644,
      },
    ],
  },
  /*{
    'Name':   'res/zip/r.zip',
    'Source': returnRecursiveZip,
    'File': [
      {
        'Name':    'r/r.zip',
        'Content': rZipBytes(),
        'Mtime':   '03-04-10 00:24:16',
        'Mode':    0666,
      },
    ],
  },*/
  {
    'Name': 'res/zip/symlink.zip',
    'File': [
      {
        'Name': 'symlink',
        'Content': '../target'.codeUnits,
        //'Mode':    0777 | os.ModeSymlink,
      },
    ],
  },
  {
    'Name': 'res/zip/readme.zip',
  },
  {
    'Name': 'res/zip/readme.notzip',
    //'Error': ErrFormat,
  },
  {
    'Name': 'res/zip/dd.zip',
    'File': [
      {
        'Name': 'filename',
        'Content': 'This is a test textfile.\n'.codeUnits,
        'Mtime': '02-02-11 13:06:20',
        'Mode': 0666,
      },
    ],
  },
  {
    // created in windows XP file manager.
    'Name': 'res/zip/winxp.zip',
    'File': [
      {'Name': 'hello', 'isFile': true},
      {'Name': 'dir/bar', 'isFile': true},
      {
        'Name': 'dir/empty/',
        'Content': <int>[], // empty list of codeUnits - no content
        'isFile': false
      },
      {'Name': 'readonly', 'isFile': true},
    ]
  },
  /*
  {
    // created by Zip 3.0 under Linux
    'Name': 'res/zip/unix.zip',
    'File': crossPlatform,
  },*/
  {
    'Name': 'res/zip/go-no-datadesc-sig.zip',
    'File': [
      {
        'Name': 'foo.txt',
        'Content': 'foo\n'.codeUnits,
        'Mtime': '03-08-12 16:59:10',
        'Mode': 0644,
      },
      {
        'Name': 'bar.txt',
        'Content': 'bar\n'.codeUnits,
        'Mtime': '03-08-12 16:59:12',
        'Mode': 0644,
      },
    ],
  },
  {
    'Name': 'res/zip/go-with-datadesc-sig.zip',
    'File': [
      {
        'Name': 'foo.txt',
        'Content': 'foo\n'.codeUnits,
        'Mode': 0666,
      },
      {
        'Name': 'bar.txt',
        'Content': 'bar\n'.codeUnits,
        'Mode': 0666,
      },
    ],
  },
  /*{
    'Name':   'Bad-CRC32-in-data-descriptor',
    'Source': returnCorruptCRC32Zip,
    'File': [
      {
        'Name':       'foo.txt',
        'Content':    'foo\n'.codeUnits,
        'Mode':       0666,
        'ContentErr': ErrChecksum,
      },
      {
        'Name':    'bar.txt',
        'Content': 'bar\n'.codeUnits,
        'Mode':    0666,
      },
    ],
  },*/
  // Tests that we verify (and accept valid) crc32s on files
  // with crc32s in their file header (not in data descriptors)
  {
    'Name': 'res/zip/crc32-not-streamed.zip',
    'File': [
      {
        'Name': 'foo.txt',
        'Content': 'foo\n'.codeUnits,
        'Mtime': '03-08-12 16:59:10',
        'Mode': 0644,
      },
      {
        'Name': 'bar.txt',
        'Content': 'bar\n'.codeUnits,
        'Mtime': '03-08-12 16:59:12',
        'Mode': 0644,
      },
    ],
  },
  // Tests that we verify (and reject invalid) crc32s on files
  // with crc32s in their file header (not in data descriptors)
  {
    'Name': 'res/zip/crc32-not-streamed.zip',
    //'Source': returnCorruptNotStreamedZip,
    'File': [
      {
        'Name': 'foo.txt',
        'Content': 'foo\n'.codeUnits,
        'Mtime': '03-08-12 16:59:10',
        'Mode': 0644,
        'VerifyChecksum': true
        //'ContentErr': ErrChecksum,
      },
      {
        'Name': 'bar.txt',
        'Content': 'bar\n'.codeUnits,
        'Mtime': '03-08-12 16:59:12',
        'Mode': 0644,
        'VerifyChecksum': true
      },
    ],
  },
  {
    'Name': 'res/zip/zip64.zip',
    'File': [
      {
        'Name': 'README',
        'Content': 'This small file is in ZIP64 format.\n'.codeUnits,
        'Mtime': '08-10-12 14:33:32',
        'Mode': 0644,
      },
    ],
  },
];

void main() {
  test('zip empty', () async {
    ZipDecoder().decodeBytes(ZipEncoder().encode(Archive()));
  });

  test('zip isFile', () async {
    var file = File(p.join(testDirPath, 'res/zip/android-javadoc.zip'));
    var bytes = file.readAsBytesSync();
    final archive = ZipDecoder().decodeBytes(bytes, verify: true);
    expect(archive.numberOfFiles(), equals(102));
    for (var file in archive.files) {
      //print('@ ${file.name} ${file.isFile} ${!file.name.endsWith('/')}');
      expect(file.isFile, equals(!file.name.endsWith('/')));
    }
  });

  test('file decode utf file', () {
    var bytes = File(p.join(testDirPath, 'res/zip/utf.zip')).readAsBytesSync();
    final archive = ZipDecoder().decodeBytes(bytes, verify: true);
    expect(archive.numberOfFiles(), equals(5));
  });

  test('file encoding zip file', () {
    final origialFileName = 'fileöäüÖÄÜß.txt';
    final bytes = Utf8Codec().encode('test');
    final archiveFile = ArchiveFile(origialFileName, bytes.length, bytes);
    final archive = Archive();
    archive.addFile(archiveFile);

    final encoder = ZipEncoder();
    final decoder = ZipDecoder();

    var encodedBytes = encoder.encode(archive);

    final archiveDecoded = decoder.decodeBytes(encodedBytes);

    final decodedFile = archiveDecoded.files.first;

    expect(decodedFile.name, origialFileName);
  });

  test('zip executable', () async {
    // Only tested on linux so far
    if (Platform.isLinux || Platform.isMacOS) {
      var path = p.join('.dart_tool', 'archive', 'test', 'zip_executable');
      var srcPath = p.join(path, 'src');

      try {
        await Directory(path).deleteSync(recursive: true);
      } catch (_) {}
      final dir = Directory(srcPath);
      await dir.create(recursive: true);

      // Create an executable file and zip it
      final file = File(p.join(srcPath, 'test.bin'));
      await file.writeAsString('bin', flush: true);
      await Process.run('chmod', ['+x', file.path]);

      final subdir = Directory(p.join(dir.path, 'subdir'));
      await subdir.createSync(recursive: true);
      var file2 = File(p.join(subdir.path, 'test2.bin'));
      await file2.writeAsString('bin2', flush: true);
      await Process.run('chmod', ['+x', file2.path]);

      var dstFilePath = p.join(path, 'test.zip');
      ZipFileEncoder().zipDirectory(Directory(srcPath), filename: dstFilePath);

      // Read
      final bytes = await File(dstFilePath).readAsBytes();

      // Decode the Zip file
      final archive = ZipDecoder().decodeBytes(bytes);

      final archiveFile = archive.first;
      expect(archiveFile.mode, file.statSync().mode);
      expect(archiveFile.isFile, true);
    }
  });

  test('encode', () {
    final archive = Archive();
    var bdata = 'hello world';
    var bytes = Uint8List.fromList(bdata.codeUnits);
    final name = 'abc.txt';
    final afile =
        ArchiveFile.noCompress(name, bytes.lengthInBytes, bytes);
    archive.addFile(afile);

    var zip_data = ZipEncoder().encode(archive);

    File(p.join(testDirPath, 'out/uncompressed.zip'))
      ..createSync(recursive: true)
      ..writeAsBytesSync(zip_data);

    var arc = ZipDecoder().decodeBytes(zip_data, verify: true);
    expect(arc.numberOfFiles(), equals(1));
    var arcData = arc.fileData(0);
    expect(arcData.length, equals(bdata.length));
    for (var i = 0; i < arcData.length; ++i) {
      expect(arcData[i], equals(bdata.codeUnits[i]));
    }
  });

  test('password', () {
    var file = File(p.join(testDirPath, 'res/zip/password_zipcrypto.zip'));
    var bytes = file.readAsBytesSync();

    var b = File(p.join(testDirPath, 'res/zip/hello.txt'));
    final b_bytes = b.readAsBytesSync();

    final archive = ZipDecoder().decodeBytes(bytes, verify: true, password: 'test1234');
    expect(archive.numberOfFiles(), equals(1));

    for (var i = 0; i < archive.numberOfFiles(); ++i) {
      final z_bytes = archive.fileData(i);
      if (archive.fileName(i) == 'hello.txt') {
        compare_bytes(z_bytes, b_bytes);
      } else {
        throw TestFailure('Invalid file found');
      }
    }
  });

  test('decode/encode', () {
    var file = File(p.join(testDirPath, 'res/test.zip'));
    var bytes = file.readAsBytesSync();

    final archive = ZipDecoder().decodeBytes(bytes, verify: true);
    expect(archive.numberOfFiles(), equals(2));

    var b = File(p.join(testDirPath, 'res/cat.jpg'));
    final b_bytes = b.readAsBytesSync();
    final a_bytes = a_txt.codeUnits;

    for (var i = 0; i < archive.numberOfFiles(); ++i) {
      final z_bytes = archive.fileData(i);
      if (archive.fileName(i) == 'a.txt') {
        compare_bytes(z_bytes, a_bytes);
      } else if (archive.fileName(i) == 'cat.jpg') {
        compare_bytes(z_bytes, b_bytes);
      } else {
        throw TestFailure('Invalid file found');
      }
    }

    // Encode the archive we just decoded
    final zipped = ZipEncoder().encode(archive);

    final f = File(p.join(testDirPath, 'out/test.zip'));
    f.createSync(recursive: true);
    f.writeAsBytesSync(zipped);

    // Decode the archive we just encoded
    final archive2 = ZipDecoder().decodeBytes(zipped, verify: true);

    expect(archive2.numberOfFiles(), equals(archive.numberOfFiles()));
    for (var i = 0; i < archive2.numberOfFiles(); ++i) {
      expect(archive2.fileName(i), equals(archive.fileName(i)));
      expect(archive2.fileSize(i), equals(archive.fileSize(i)));
    }
  });

  for (final Z in zipTests) {
    final z = Z as Map<String, dynamic>;
    test('unzip ${z['Name']}', () {
      var file = File(p.join(testDirPath, z['Name'] as String));
      var bytes = file.readAsBytesSync();

      final zipDecoder = ZipDecoder();
      final archive =zipDecoder.decodeBytes(bytes, verify: true);
      final zipFiles = zipDecoder.directory.fileHeaders;

      if (z.containsKey('Comment')) {
        expect(zipDecoder.directory.zipFileComment, z['Comment']);
      }

      if (!z.containsKey('File')) {
        return;
      }
      expect(zipFiles.length, equals(z['File'].length));

      for (var i = 0; i < zipFiles.length; ++i) {
        final zipFileHeader = zipFiles[i];
        final zipFile = zipFileHeader.file;

        var hdr = z['File'][i] as Map<String, dynamic>;

        if (hdr.containsKey('Name')) {
          expect(zipFile.filename, equals(hdr['Name']));
        }
        if (hdr.containsKey('Content')) {
          expect(zipFile.content, equals(hdr['Content']));
        }
        if (hdr.containsKey('VerifyChecksum')) {
          expect(zipFile.verifyCrc32(), equals(hdr['VerifyChecksum']));
        }
        if (hdr.containsKey('isFile')) {
          expect(archive.findFile(zipFile.filename).isFile, hdr['isFile']);
        }
      }
    });
  }
}

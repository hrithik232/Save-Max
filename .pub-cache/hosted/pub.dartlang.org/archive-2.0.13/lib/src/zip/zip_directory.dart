import '../util/archive_exception.dart';
//import '../util/crc32.dart';
import '../util/input_stream.dart';
import 'zip_file_header.dart';

class ZipDirectory {
  // End of Central Directory Record
  static const int SIGNATURE = 0x06054b50;
  static const int ZIP64_EOCD_LOCATOR_SIGNATURE = 0x07064b50;
  static const int ZIP64_EOCD_LOCATOR_SIZE = 20;
  static const int ZIP64_EOCD_SIGNATURE = 0x06064b50;
  static const int ZIP64_EOCD_SIZE = 56;

  int filePosition = -1;
  int numberOfThisDisk = 0; // 2 bytes
  int diskWithTheStartOfTheCentralDirectory = 0; // 2 bytes
  int totalCentralDirectoryEntriesOnThisDisk = 0; // 2 bytes
  int totalCentralDirectoryEntries = 0; // 2 bytes
  int centralDirectorySize; // 4 bytes
  int centralDirectoryOffset; // 2 bytes
  String zipFileComment = ''; // 2 bytes, n bytes
  // Central Directory
  List<ZipFileHeader> fileHeaders = [];

  ZipDirectory();

  ZipDirectory.read(InputStream input, {String password}) {
    filePosition = _findSignature(input);
    input.offset = filePosition;
    final signature = input.readUint32(); // ignore: unused_local_variable
    numberOfThisDisk = input.readUint16();
    diskWithTheStartOfTheCentralDirectory = input.readUint16();
    totalCentralDirectoryEntriesOnThisDisk = input.readUint16();
    totalCentralDirectoryEntries = input.readUint16();
    centralDirectorySize = input.readUint32();
    centralDirectoryOffset = input.readUint32();

    final len = input.readUint16();
    if (len > 0) {
      zipFileComment = input.readString(size: len);
    }

    _readZip64Data(input);

    final dirContent =
        input.subset(centralDirectoryOffset, centralDirectorySize);

    while (!dirContent.isEOS) {
      final fileSig = dirContent.readUint32();
      if (fileSig != ZipFileHeader.SIGNATURE) {
        break;
      }
      fileHeaders.add(ZipFileHeader(dirContent, input, password));
    }
  }

  void _readZip64Data(InputStream input) {
    final ip = input.offset;
    // Check for zip64 data.

    // Zip64 end of central directory locator
    // signature                       4 bytes  (0x07064b50)
    // number of the disk with the
    // start of the zip64 end of
    // central directory               4 bytes
    // relative offset of the zip64
    // end of central directory record 8 bytes
    // total number of disks           4 bytes

    final locPos = filePosition - ZIP64_EOCD_LOCATOR_SIZE;
    if (locPos < 0) {
      return;
    }
    final zip64 = input.subset(locPos, ZIP64_EOCD_LOCATOR_SIZE);

    var sig = zip64.readUint32();
    // If this ins't the signature we're looking for, nothing more to do.
    if (sig != ZIP64_EOCD_LOCATOR_SIGNATURE) {
      input.offset = ip;
      return;
    }

    final startZip64Disk = zip64.readUint32(); // ignore: unused_local_variable
    final zip64DirOffset = zip64.readUint64();
    final numZip64Disks = zip64.readUint32(); // ignore: unused_local_variable

    input.offset = zip64DirOffset;

    // Zip64 end of central directory record
    // signature                       4 bytes  (0x06064b50)
    // size of zip64 end of central
    // directory record                8 bytes
    // version made by                 2 bytes
    // version needed to extract       2 bytes
    // number of this disk             4 bytes
    // number of the disk with the
    // start of the central directory  4 bytes
    // total number of entries in the
    // central directory on this disk  8 bytes
    // total number of entries in the
    // central directory               8 bytes
    // size of the central directory   8 bytes
    // offset of start of central
    // directory with respect to
    // the starting disk number        8 bytes
    // zip64 extensible data sector    (variable size)
    sig = input.readUint32();
    if (sig != ZIP64_EOCD_SIGNATURE) {
      input.offset = ip;
      return;
    }

    final zip64EOCDSize = input.readUint64(); // ignore: unused_local_variable
    final zip64Version = input.readUint16(); // ignore: unused_local_variable
    final zip64VersionNeeded = input.readUint16(); // ignore: unused_local_variable
    final zip64DiskNumber = input.readUint32();
    final zip64StartDisk = input.readUint32();
    final zip64NumEntriesOnDisk = input.readUint64();
    final zip64NumEntries = input.readUint64();
    final dirSize = input.readUint64();
    final dirOffset = input.readUint64();

    numberOfThisDisk = zip64DiskNumber;
    diskWithTheStartOfTheCentralDirectory = zip64StartDisk;
    totalCentralDirectoryEntriesOnThisDisk = zip64NumEntriesOnDisk;
    totalCentralDirectoryEntries = zip64NumEntries;
    centralDirectorySize = dirSize;
    centralDirectoryOffset = dirOffset;

    input.offset = ip;
  }

  int _findSignature(InputStream input) {
    final pos = input.offset;
    final length = input.length;

    // The directory and archive contents are written to the end of the zip
    // file.  We need to search from the end to find these structures,
    // starting with the 'End of central directory' record (EOCD).
    for (var ip = length - 4; ip >= 0; --ip) {
      input.offset = ip;
      final sig = input.readUint32();
      if (sig == SIGNATURE) {
        input.offset = pos;
        return ip;
      }
    }

    throw ArchiveException('Could not find End of Central Directory Record');
  }
}

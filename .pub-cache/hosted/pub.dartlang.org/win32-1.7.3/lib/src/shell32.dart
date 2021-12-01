// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Maps FFI prototypes onto the corresponding Win32 API function calls

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'com/combase.dart';
import 'structs.dart';

final _shell32 = DynamicLibrary.open('shell32.dll');

/// Retrieves the name of and handle to the executable (.exe) file
/// associated with a specific document file.
///
/// ```c
/// HINSTANCE FindExecutableW(
///   LPCWSTR lpFile,
///   LPCWSTR lpDirectory,
///   LPWSTR  lpResult
/// );
/// ```
/// {@category shell32}
final FindExecutable = _shell32.lookupFunction<
    IntPtr Function(Pointer<Utf16> lpFile, Pointer<Utf16> lpDirectory,
        Pointer<Utf16> lpResult),
    int Function(Pointer<Utf16> lpFile, Pointer<Utf16> lpDirectory,
        Pointer<Utf16> lpResult)>('FindExecutableW');

/// Displays a ShellAbout dialog box.
///
/// ```c
/// INT ShellAboutW(
///   HWND    hWnd,
///   LPCWSTR szApp,
///   LPCWSTR szOtherStuff,
///   HICON   hIcon
/// );
/// ```
/// {@category shell32}
final ShellAbout = _shell32.lookupFunction<
    Int32 Function(IntPtr hWnd, Pointer<Utf16> szApp,
        Pointer<Utf16> szOtherStuff, IntPtr hIcon),
    int Function(int hWnd, Pointer<Utf16> szApp, Pointer<Utf16> szOtherStuff,
        int hIcon)>('ShellAboutW');

/// Performs an operation on a specified file.
///
/// ```c
/// BOOL ShellExecuteExW(
///   SHELLEXECUTEINFOW *pExecInfo
/// );
/// ```
/// {@category shell32}
final ShellExecuteEx = _shell32.lookupFunction<
    Int32 Function(Pointer<SHELLEXECUTEINFO> pExecuteInfo),
    int Function(Pointer<SHELLEXECUTEINFO> pExecuteInfo)>('ShellExecuteExW');

/// Performs an operation on a specified file.
///
/// ```c
/// HINSTANCE ShellExecuteW(
///   HWND    hwnd,
///   LPCWSTR lpOperation,
///   LPCWSTR lpFile,
///   LPCWSTR lpParameters,
///   LPCWSTR lpDirectory,
///   INT     nShowCmd
/// );
/// ```
/// {@category shell32}
final ShellExecute = _shell32.lookupFunction<
    IntPtr Function(
        IntPtr hwnd,
        Pointer<Utf16> lpOperation,
        Pointer<Utf16> lpFile,
        Pointer<Utf16> lpParameters,
        Pointer<Utf16> lpDirectory,
        Int32 nShowCmd),
    int Function(
        int hwnd,
        Pointer<Utf16> lpOperation,
        Pointer<Utf16> lpFile,
        Pointer<Utf16> lpParameters,
        Pointer<Utf16> lpDirectory,
        int nShowCmd)>('ShellExecuteW');

/// Empties the Recycle Bin on the specified drive.
///
/// ```c
/// SHSTDAPI SHEmptyRecycleBinW(
///   HWND    hwnd,
///   LPCWSTR pszRootPath,
///   DWORD   dwFlags
/// );
/// ```
/// {@category shell32}
final SHEmptyRecycleBin = _shell32.lookupFunction<
    Int32 Function(IntPtr hwnd, Pointer<Utf16> pszRootPath, Uint32 dwFlags),
    int Function(int hwnd, Pointer<Utf16> pszRootPath,
        int dwFlags)>('SHEmptyRecycleBinW');

/// Retrieves disk space information for a disk volume.
///
/// ```c
/// BOOL SHGetDiskFreeSpaceExW(
///   LPCWSTR        pszDirectoryName,
///   ULARGE_INTEGER *pulFreeBytesAvailableToCaller,
///   ULARGE_INTEGER *pulTotalNumberOfBytes,
///   ULARGE_INTEGER *pulTotalNumberOfFreeBytes
/// );
/// ```
/// {@category shell32}
final SHGetDiskFreeSpaceEx = _shell32.lookupFunction<
    Int32 Function(
        Pointer<Utf16> pszDirectoryName,
        Pointer<Uint64> pulFreeBytesAvailableToCaller,
        Pointer<Uint64> pulTotalNumberOfBytes,
        Pointer<Uint64> pulTotalNumberOfFreeBytes),
    int Function(
        Pointer<Utf16> pszDirectoryName,
        Pointer<Uint64> pulFreeBytesAvailableToCaller,
        Pointer<Uint64> pulTotalNumberOfBytes,
        Pointer<Uint64> pulTotalNumberOfFreeBytes)>('SHGetDiskFreeSpaceExW');

/// Returns the type of media that is in the given drive.
///
/// ```c
/// HRESULT SHGetDriveMedia(
///   PCWSTR pszDrive,
///   DWORD  *pdwMediaContent
/// );
/// ```
/// {@category shell32}
final SHGetDriveMedia = _shell32.lookupFunction<
    Int32 Function(Pointer<Utf16> pszDrive, Pointer<Uint32> pdwMediaContent),
    int Function(Pointer<Utf16> pszDrive,
        Pointer<Uint32> pdwMediaContent)>('SHGetDriveMedia');

/// Gets the path of a folder identified by a CSIDL value.
///
/// ```c
/// SHFOLDERAPI SHGetFolderPathW(
///   HWND   hwnd,
///   int    csidl,
///   HANDLE hToken,
///   DWORD  dwFlags,
///   LPWSTR pszPath
/// );
/// ```
/// {@category shell32}
final SHGetFolderPath = _shell32.lookupFunction<
    Int32 Function(IntPtr hwnd, Int32 csidl, IntPtr hToken, Uint32 dwFlags,
        Pointer<Utf16> pszPath),
    int Function(int hwnd, int csidl, int hToken, int dwFlags,
        Pointer<Utf16> pszPath)>('SHGetFolderPathW');

/// Retrieves the full path of a known folder identified by the folder's
/// KNOWNFOLDERID.
///
/// ```c
/// HRESULT SHGetKnownFolderPath(
///   REFKNOWNFOLDERID rfid,
///   DWORD            dwFlags,
///   HANDLE           hToken,
///   PWSTR            *ppszPath
/// );
/// ```
/// {@category shell32}
final SHGetKnownFolderPath = _shell32.lookupFunction<
    Int32 Function(Pointer<GUID> rfid, Uint32 dwFlags, IntPtr hToken,
        Pointer<IntPtr> ppszPath),
    int Function(Pointer<GUID> rfid, int dwFlags, int hToken,
        Pointer<IntPtr> ppszPath)>('SHGetKnownFolderPath');

/// Retrieves the size of the Recycle Bin and the number of items in it,
/// for a specified drive.
///
/// ```c
/// SHSTDAPI SHQueryRecycleBinW(
///   LPCWSTR         pszRootPath,
///   LPSHQUERYRBINFO pSHQueryRBInfo
/// );
/// ```
/// {@category shell32}
final SHQueryRecycleBin = _shell32.lookupFunction<
    Int32 Function(
        Pointer<Utf16> pszRootPath, Pointer<SHQUERYRBINFO> pSHQueryRBInfo),
    int Function(Pointer<Utf16> pszRootPath,
        Pointer<SHQUERYRBINFO> pSHQueryRBInfo)>('SHQueryRecycleBinW');

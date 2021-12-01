// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Maps FFI prototypes onto the corresponding Win32 API function calls

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'callbacks.dart';
import 'combase.dart';
import 'structs.dart';
import 'structs.g.dart';

final _winspool = DynamicLibrary.open('winspool.drv');

/// The CloseSpoolFileHandle function closes a handle to a spool file
/// associated with the print job currently submitted by the application.
///
/// ```c
/// BOOL CloseSpoolFileHandle(
///   _In_ HANDLE hPrinter,
///   _In_ HANDLE hSpoolFile
/// );
/// ```
/// {@category winspool}
int CloseSpoolFileHandle(int hPrinter, int hSpoolFile) =>
    _CloseSpoolFileHandle(hPrinter, hSpoolFile);

late final _CloseSpoolFileHandle = _winspool.lookupFunction<
    Int32 Function(IntPtr hPrinter, IntPtr hSpoolFile),
    int Function(int hPrinter, int hSpoolFile)>('CloseSpoolFileHandle');

/// The CommitSpoolData function notifies the print spooler that a
/// specified amount of data has been written to a specified spool file and
/// is ready to be rendered.
///
/// ```c
/// HANDLE CommitSpoolData(
///   _In_ HANDLE hPrinter,
///   _In_ HANDLE hSpoolFile,
///        DWORD  cbCommit
/// );
/// ```
/// {@category winspool}
int CommitSpoolData(int hPrinter, int hSpoolFile, int cbCommit) =>
    _CommitSpoolData(hPrinter, hSpoolFile, cbCommit);

late final _CommitSpoolData = _winspool.lookupFunction<
    IntPtr Function(IntPtr hPrinter, IntPtr hSpoolFile, Uint32 cbCommit),
    int Function(
        int hPrinter, int hSpoolFile, int cbCommit)>('CommitSpoolData');

/// The ConfigurePort function displays the port-configuration dialog box
/// for a port on the specified server.
///
/// ```c
/// BOOL ConfigurePortW(
///   _In_ LPTSTR pName,
///   _In_ HWND   hWnd,
///   _In_ LPTSTR pPortName
/// );
/// ```
/// {@category winspool}
int ConfigurePort(Pointer<Utf16> pName, int hWnd, Pointer<Utf16> pPortName) =>
    _ConfigurePort(pName, hWnd, pPortName);

late final _ConfigurePort = _winspool.lookupFunction<
    Int32 Function(Pointer<Utf16> pName, IntPtr hWnd, Pointer<Utf16> pPortName),
    int Function(Pointer<Utf16> pName, int hWnd,
        Pointer<Utf16> pPortName)>('ConfigurePortW');

/// The ConnectToPrinterDlg function displays a dialog box that lets users
/// browse and connect to printers on a network. If the user selects a
/// printer, the function attempts to create a connection to it; if a
/// suitable driver is not installed on the server, the user is given the
/// option of creating a printer locally.
///
/// ```c
/// HANDLE ConnectToPrinterDlg(
///   _In_ HWND  hwnd,
///   _In_ DWORD Flags
/// );
/// ```
/// {@category winspool}
int ConnectToPrinterDlg(int hwnd, int Flags) =>
    _ConnectToPrinterDlg(hwnd, Flags);

late final _ConnectToPrinterDlg = _winspool.lookupFunction<
    IntPtr Function(IntPtr hwnd, Uint32 Flags),
    int Function(int hwnd, int Flags)>('ConnectToPrinterDlg');

/// The DeleteForm function removes a form name from the list of supported
/// forms.
///
/// ```c
/// BOOL DeleteFormW(
///   _In_ HANDLE hPrinter,
///   _In_ LPTSTR pFormName
/// );
/// ```
/// {@category winspool}
int DeleteForm(int hPrinter, Pointer<Utf16> pFormName) =>
    _DeleteForm(hPrinter, pFormName);

late final _DeleteForm = _winspool.lookupFunction<
    Int32 Function(IntPtr hPrinter, Pointer<Utf16> pFormName),
    int Function(int hPrinter, Pointer<Utf16> pFormName)>('DeleteFormW');

/// The DeletePrinterConnection function deletes a connection to a printer
/// that was established by a call to AddPrinterConnection or
/// ConnectToPrinterDlg.
///
/// ```c
/// BOOL DeletePrinterConnectionW(
///   _In_ LPTSTR pName
/// );
/// ```
/// {@category winspool}
int DeletePrinterConnection(Pointer<Utf16> pName) =>
    _DeletePrinterConnection(pName);

late final _DeletePrinterConnection = _winspool.lookupFunction<
    Int32 Function(Pointer<Utf16> pName),
    int Function(Pointer<Utf16> pName)>('DeletePrinterConnectionW');

/// The DeletePrinterData function deletes specified configuration data for
/// a printer. A printer's configuration data consists of a set of named
/// and typed values. The DeletePrinterData function deletes one of these
/// values, specified by its value name.
///
/// ```c
/// DWORD DeletePrinterDataW(
///   _In_ HANDLE hPrinter,
///   _In_ LPTSTR pValueName
/// );
/// ```
/// {@category winspool}
int DeletePrinterData(int hPrinter, Pointer<Utf16> pValueName) =>
    _DeletePrinterData(hPrinter, pValueName);

late final _DeletePrinterData = _winspool.lookupFunction<
    Uint32 Function(IntPtr hPrinter, Pointer<Utf16> pValueName),
    int Function(
        int hPrinter, Pointer<Utf16> pValueName)>('DeletePrinterDataW');

/// The DeletePrinterDataEx function deletes a specified value from the
/// configuration data for a printer. A printer's configuration data
/// consists of a set of named and typed values stored in a hierarchy of
/// registry keys. The function deletes a specified value under a specified
/// key.
///
/// ```c
/// DWORD DeletePrinterDataExW(
///   _In_ HANDLE  hPrinter,
///   _In_ LPCTSTR pKeyName,
///   _In_ LPCTSTR pValueName
/// );
/// ```
/// {@category winspool}
int DeletePrinterDataEx(
        int hPrinter, Pointer<Utf16> pKeyName, Pointer<Utf16> pValueName) =>
    _DeletePrinterDataEx(hPrinter, pKeyName, pValueName);

late final _DeletePrinterDataEx = _winspool.lookupFunction<
    Uint32 Function(
        IntPtr hPrinter, Pointer<Utf16> pKeyName, Pointer<Utf16> pValueName),
    int Function(int hPrinter, Pointer<Utf16> pKeyName,
        Pointer<Utf16> pValueName)>('DeletePrinterDataExW');

/// The DeletePrinterKey function deletes a specified key and all its
/// subkeys for a specified printer.
///
/// ```c
/// DWORD DeletePrinterKeyW(
///   _In_ HANDLE  hPrinter,
///   _In_ LPCTSTR pKeyName
/// );
/// ```
/// {@category winspool}
int DeletePrinterKey(int hPrinter, Pointer<Utf16> pKeyName) =>
    _DeletePrinterKey(hPrinter, pKeyName);

late final _DeletePrinterKey = _winspool.lookupFunction<
    Uint32 Function(IntPtr hPrinter, Pointer<Utf16> pKeyName),
    int Function(int hPrinter, Pointer<Utf16> pKeyName)>('DeletePrinterKeyW');

/// The DocumentProperties function retrieves or modifies printer
/// initialization information or displays a printer-configuration property
/// sheet for the specified printer.
///
/// ```c
/// LONG DocumentPropertiesW(
///   _In_  HWND     hWnd,
///   _In_  HANDLE   hPrinter,
///   _In_  LPTSTR   pDeviceName,
///   _Out_ PDEVMODE pDevModeOutput,
///   _In_  PDEVMODE pDevModeInput,
///   _In_  DWORD    fMode
/// );
/// ```
/// {@category winspool}
int DocumentProperties(
        int hWnd,
        int hPrinter,
        Pointer<Utf16> pDeviceName,
        Pointer<DEVMODE> pDevModeOutput,
        Pointer<DEVMODE> pDevModeInput,
        int fMode) =>
    _DocumentProperties(
        hWnd, hPrinter, pDeviceName, pDevModeOutput, pDevModeInput, fMode);

late final _DocumentProperties = _winspool.lookupFunction<
    Int32 Function(
        IntPtr hWnd,
        IntPtr hPrinter,
        Pointer<Utf16> pDeviceName,
        Pointer<DEVMODE> pDevModeOutput,
        Pointer<DEVMODE> pDevModeInput,
        Uint32 fMode),
    int Function(
        int hWnd,
        int hPrinter,
        Pointer<Utf16> pDeviceName,
        Pointer<DEVMODE> pDevModeOutput,
        Pointer<DEVMODE> pDevModeInput,
        int fMode)>('DocumentPropertiesW');

/// The EnumForms function enumerates the forms supported by the specified
/// printer.
///
/// ```c
/// BOOL EnumFormsW(
///   _In_  HANDLE  hPrinter,
///   _In_  DWORD   Level,
///   _Out_ LPBYTE  pForm,
///   _In_  DWORD   cbBuf,
///   _Out_ LPDWORD pcbNeeded,
///   _Out_ LPDWORD pcReturned
/// );
/// ```
/// {@category winspool}
int EnumForms(int hPrinter, int Level, Pointer<Uint8> pForm, int cbBuf,
        Pointer<Uint32> pcbNeeded, Pointer<Uint32> pcReturned) =>
    _EnumForms(hPrinter, Level, pForm, cbBuf, pcbNeeded, pcReturned);

late final _EnumForms = _winspool.lookupFunction<
    Int32 Function(IntPtr hPrinter, Uint32 Level, Pointer<Uint8> pForm,
        Uint32 cbBuf, Pointer<Uint32> pcbNeeded, Pointer<Uint32> pcReturned),
    int Function(int hPrinter, int Level, Pointer<Uint8> pForm, int cbBuf,
        Pointer<Uint32> pcbNeeded, Pointer<Uint32> pcReturned)>('EnumFormsW');

/// The EnumJobs function retrieves information about a specified set of
/// print jobs for a specified printer.
///
/// ```c
/// BOOL EnumJobsW(
///   _In_  HANDLE  hPrinter,
///   _In_  DWORD   FirstJob,
///   _In_  DWORD   NoJobs,
///   _In_  DWORD   Level,
///   _Out_ LPBYTE  pJob,
///   _In_  DWORD   cbBuf,
///   _Out_ LPDWORD pcbNeeded,
///   _Out_ LPDWORD pcReturned
/// );
/// ```
/// {@category winspool}
int EnumJobs(
        int hPrinter,
        int FirstJob,
        int NoJobs,
        int Level,
        Pointer<Uint8> pJob,
        int cbBuf,
        Pointer<Uint32> pcbNeeded,
        Pointer<Uint32> pcReturned) =>
    _EnumJobs(
        hPrinter, FirstJob, NoJobs, Level, pJob, cbBuf, pcbNeeded, pcReturned);

late final _EnumJobs = _winspool.lookupFunction<
    Int32 Function(
        IntPtr hPrinter,
        Uint32 FirstJob,
        Uint32 NoJobs,
        Uint32 Level,
        Pointer<Uint8> pJob,
        Uint32 cbBuf,
        Pointer<Uint32> pcbNeeded,
        Pointer<Uint32> pcReturned),
    int Function(
        int hPrinter,
        int FirstJob,
        int NoJobs,
        int Level,
        Pointer<Uint8> pJob,
        int cbBuf,
        Pointer<Uint32> pcbNeeded,
        Pointer<Uint32> pcReturned)>('EnumJobsW');

/// The EnumPrinterData function enumerates configuration data for a
/// specified printer.
///
/// ```c
/// DWORD EnumPrinterDataW(
///   _In_  HANDLE  hPrinter,
///   _In_  DWORD   dwIndex,
///   _Out_ LPTSTR  pValueName,
///   _In_  DWORD   cbValueName,
///   _Out_ LPDWORD pcbValueName,
///   _Out_ LPDWORD pType,
///   _Out_ LPBYTE  pData,
///   _In_  DWORD   cbData,
///   _Out_ LPDWORD pcbData
/// );
/// ```
/// {@category winspool}
int EnumPrinterData(
        int hPrinter,
        int dwIndex,
        Pointer<Utf16> pValueName,
        int cbValueName,
        Pointer<Uint32> pcbValueName,
        Pointer<Uint32> pType,
        Pointer<Uint8> pData,
        int cbData,
        Pointer<Uint32> pcbData) =>
    _EnumPrinterData(hPrinter, dwIndex, pValueName, cbValueName, pcbValueName,
        pType, pData, cbData, pcbData);

late final _EnumPrinterData = _winspool.lookupFunction<
    Uint32 Function(
        IntPtr hPrinter,
        Uint32 dwIndex,
        Pointer<Utf16> pValueName,
        Uint32 cbValueName,
        Pointer<Uint32> pcbValueName,
        Pointer<Uint32> pType,
        Pointer<Uint8> pData,
        Uint32 cbData,
        Pointer<Uint32> pcbData),
    int Function(
        int hPrinter,
        int dwIndex,
        Pointer<Utf16> pValueName,
        int cbValueName,
        Pointer<Uint32> pcbValueName,
        Pointer<Uint32> pType,
        Pointer<Uint8> pData,
        int cbData,
        Pointer<Uint32> pcbData)>('EnumPrinterDataW');

/// The EnumPrinterDataEx function enumerates all value names and data for
/// a specified printer and key.
///
/// ```c
/// DWORD EnumPrinterDataExW(
///   _In_  HANDLE  hPrinter,
///   _In_  LPCTSTR pKeyName,
///   _Out_ LPBYTE  pEnumValues,
///   _In_  DWORD   cbEnumValues,
///   _Out_ LPDWORD pcbEnumValues,
///   _Out_ LPDWORD pnEnumValues
/// );
/// ```
/// {@category winspool}
int EnumPrinterDataEx(
        int hPrinter,
        Pointer<Utf16> pKeyName,
        Pointer<Uint8> pEnumValues,
        int cbEnumValues,
        Pointer<Uint32> pcbEnumValues,
        Pointer<Uint32> pnEnumValues) =>
    _EnumPrinterDataEx(hPrinter, pKeyName, pEnumValues, cbEnumValues,
        pcbEnumValues, pnEnumValues);

late final _EnumPrinterDataEx = _winspool.lookupFunction<
    Uint32 Function(
        IntPtr hPrinter,
        Pointer<Utf16> pKeyName,
        Pointer<Uint8> pEnumValues,
        Uint32 cbEnumValues,
        Pointer<Uint32> pcbEnumValues,
        Pointer<Uint32> pnEnumValues),
    int Function(
        int hPrinter,
        Pointer<Utf16> pKeyName,
        Pointer<Uint8> pEnumValues,
        int cbEnumValues,
        Pointer<Uint32> pcbEnumValues,
        Pointer<Uint32> pnEnumValues)>('EnumPrinterDataExW');

/// The EnumPrinterKey function enumerates the subkeys of a specified key
/// for a specified printer.
///
/// ```c
/// DWORD EnumPrinterKeyW(
///   _In_  HANDLE  hPrinter,
///   _In_  LPCTSTR pKeyName,
///   _Out_ LPTSTR  pSubkey,
///   _In_  DWORD   cbSubkey,
///   _Out_ LPDWORD pcbSubkey
/// );
/// ```
/// {@category winspool}
int EnumPrinterKey(int hPrinter, Pointer<Utf16> pKeyName,
        Pointer<Utf16> pSubkey, int cbSubkey, Pointer<Uint32> pcbSubkey) =>
    _EnumPrinterKey(hPrinter, pKeyName, pSubkey, cbSubkey, pcbSubkey);

late final _EnumPrinterKey = _winspool.lookupFunction<
    Uint32 Function(IntPtr hPrinter, Pointer<Utf16> pKeyName,
        Pointer<Utf16> pSubkey, Uint32 cbSubkey, Pointer<Uint32> pcbSubkey),
    int Function(int hPrinter, Pointer<Utf16> pKeyName, Pointer<Utf16> pSubkey,
        int cbSubkey, Pointer<Uint32> pcbSubkey)>('EnumPrinterKeyW');

/// The EnumPrinters function enumerates available printers, print servers,
/// domains, or print providers.
///
/// ```c
/// BOOL EnumPrintersW(
///    _In_  DWORD   Flags,
///    _In_  LPTSTR  Name,
///    _In_  DWORD   Level,
///    _Out_ LPBYTE  pPrinterEnum,
///    _In_  DWORD   cbBuf,
///    _Out_ LPDWORD pcbNeeded,
///    _Out_ LPDWORD pcReturned
/// );
/// ```
/// {@category winspool}
int EnumPrinters(
        int Flags,
        Pointer<Utf16> Name,
        int Level,
        Pointer<Uint8> pPrinterEnum,
        int cbBuf,
        Pointer<Uint32> pcbNeeded,
        Pointer<Uint32> pcReturned) =>
    _EnumPrinters(
        Flags, Name, Level, pPrinterEnum, cbBuf, pcbNeeded, pcReturned);

late final _EnumPrinters = _winspool.lookupFunction<
    Int32 Function(
        Uint32 Flags,
        Pointer<Utf16> Name,
        Uint32 Level,
        Pointer<Uint8> pPrinterEnum,
        Uint32 cbBuf,
        Pointer<Uint32> pcbNeeded,
        Pointer<Uint32> pcReturned),
    int Function(
        int Flags,
        Pointer<Utf16> Name,
        int Level,
        Pointer<Uint8> pPrinterEnum,
        int cbBuf,
        Pointer<Uint32> pcbNeeded,
        Pointer<Uint32> pcReturned)>('EnumPrintersW');

/// The FindFirstPrinterChangeNotification function creates a change
/// notification object and returns a handle to the object. You can then
/// use this handle in a call to one of the wait functions to monitor
/// changes to the printer or print server.
///
/// ```c
/// HANDLE FindFirstPrinterChangeNotification(
///   _In_     HANDLE hPrinter,
///            DWORD  fdwFilter,
///            DWORD  fdwOptions,
///   _In_opt_ LPVOID pPrinterNotifyOptions
/// );
/// ```
/// {@category winspool}
int FindFirstPrinterChangeNotification(int hPrinter, int fdwFilter,
        int fdwOptions, Pointer pPrinterNotifyOptions) =>
    _FindFirstPrinterChangeNotification(
        hPrinter, fdwFilter, fdwOptions, pPrinterNotifyOptions);

late final _FindFirstPrinterChangeNotification = _winspool.lookupFunction<
    IntPtr Function(IntPtr hPrinter, Uint32 fdwFilter, Uint32 fdwOptions,
        Pointer pPrinterNotifyOptions),
    int Function(int hPrinter, int fdwFilter, int fdwOptions,
        Pointer pPrinterNotifyOptions)>('FindFirstPrinterChangeNotification');

/// The FindNextPrinterChangeNotification function retrieves information
/// about the most recent change notification for a change notification
/// object associated with a printer or print server. Call this function
/// when a wait operation on the change notification object is satisfied.
///
/// ```c
/// BOOL FindNextPrinterChangeNotification(
///   _In_      HANDLE hChange,
///   _Out_opt_ PDWORD pdwChange,
///   _In_opt_  LPVOID pPrinterNotifyOptions,
///   _Out_opt_ LPVOID *ppPrinterNotifyInfo
/// );
/// ```
/// {@category winspool}
int FindNextPrinterChangeNotification(int hChange, Pointer<Uint32> pdwChange,
        Pointer pvReserved, Pointer<Pointer> ppPrinterNotifyInfo) =>
    _FindNextPrinterChangeNotification(
        hChange, pdwChange, pvReserved, ppPrinterNotifyInfo);

late final _FindNextPrinterChangeNotification = _winspool.lookupFunction<
        Int32 Function(IntPtr hChange, Pointer<Uint32> pdwChange,
            Pointer pvReserved, Pointer<Pointer> ppPrinterNotifyInfo),
        int Function(int hChange, Pointer<Uint32> pdwChange, Pointer pvReserved,
            Pointer<Pointer> ppPrinterNotifyInfo)>(
    'FindNextPrinterChangeNotification');

/// The FlushPrinter function sends a buffer to the printer in order to
/// clear it from a transient state.
///
/// ```c
/// BOOL FlushPrinter(
///   _In_  HANDLE  hPrinter,
///   _In_  LPVOID  pBuf,
///   _In_  DWORD   cbBuf,
///   _Out_ LPDWORD pcWritten,
///   _In_  DWORD   cSleep
/// );
/// ```
/// {@category winspool}
int FlushPrinter(int hPrinter, Pointer pBuf, int cbBuf,
        Pointer<Uint32> pcWritten, int cSleep) =>
    _FlushPrinter(hPrinter, pBuf, cbBuf, pcWritten, cSleep);

late final _FlushPrinter = _winspool.lookupFunction<
    Int32 Function(IntPtr hPrinter, Pointer pBuf, Uint32 cbBuf,
        Pointer<Uint32> pcWritten, Uint32 cSleep),
    int Function(int hPrinter, Pointer pBuf, int cbBuf,
        Pointer<Uint32> pcWritten, int cSleep)>('FlushPrinter');

/// The FreePrinterNotifyInfo function frees a system-allocated buffer
/// created by the FindNextPrinterChangeNotification function.
///
/// ```c
/// BOOL FreePrinterNotifyInfo(
///   _In_ PPRINTER_NOTIFY_INFO pPrinterNotifyInfo
/// );
/// ```
/// {@category winspool}
int FreePrinterNotifyInfo(Pointer<PRINTER_NOTIFY_INFO> pPrinterNotifyInfo) =>
    _FreePrinterNotifyInfo(pPrinterNotifyInfo);

late final _FreePrinterNotifyInfo = _winspool.lookupFunction<
        Int32 Function(Pointer<PRINTER_NOTIFY_INFO> pPrinterNotifyInfo),
        int Function(Pointer<PRINTER_NOTIFY_INFO> pPrinterNotifyInfo)>(
    'FreePrinterNotifyInfo');

/// The GetDefaultPrinter function retrieves the printer name of the
/// default printer for the current user on the local computer.
///
/// ```c
/// BOOL GetDefaultPrinterW(
///   _In_    LPTSTR  pszBuffer,
///   _Inout_ LPDWORD pcchBuffer
/// );
/// ```
/// {@category winspool}
int GetDefaultPrinter(Pointer<Utf16> pszBuffer, Pointer<Uint32> pcchBuffer) =>
    _GetDefaultPrinter(pszBuffer, pcchBuffer);

late final _GetDefaultPrinter = _winspool.lookupFunction<
    Int32 Function(Pointer<Utf16> pszBuffer, Pointer<Uint32> pcchBuffer),
    int Function(Pointer<Utf16> pszBuffer,
        Pointer<Uint32> pcchBuffer)>('GetDefaultPrinterW');

/// The GetJob function retrieves information about a specified print job.
///
/// ```c
/// BOOL GetJobW(
///   _In_  HANDLE  hPrinter,
///   _In_  DWORD   JobId,
///   _In_  DWORD   Level,
///   _Out_ LPBYTE  pJob,
///   _In_  DWORD   cbBuf,
///   _Out_ LPDWORD pcbNeeded
/// );
/// ```
/// {@category winspool}
int GetJob(int hPrinter, int JobId, int Level, Pointer<Uint8> pJob, int cbBuf,
        Pointer<Uint32> pcbNeeded) =>
    _GetJob(hPrinter, JobId, Level, pJob, cbBuf, pcbNeeded);

late final _GetJob = _winspool.lookupFunction<
    Int32 Function(IntPtr hPrinter, Uint32 JobId, Uint32 Level,
        Pointer<Uint8> pJob, Uint32 cbBuf, Pointer<Uint32> pcbNeeded),
    int Function(int hPrinter, int JobId, int Level, Pointer<Uint8> pJob,
        int cbBuf, Pointer<Uint32> pcbNeeded)>('GetJobW');

/// The GetPrinter function retrieves information about a specified
/// printer.
///
/// ```c
/// BOOL GetPrinterW(
///   _In_  HANDLE  hPrinter,
///   _In_  DWORD   Level,
///   _Out_ LPBYTE  pPrinter,
///   _In_  DWORD   cbBuf,
///   _Out_ LPDWORD pcbNeeded
/// );
/// ```
/// {@category winspool}
int GetPrinter(int hPrinter, int Level, Pointer<Uint8> pPrinter, int cbBuf,
        Pointer<Uint32> pcbNeeded) =>
    _GetPrinter(hPrinter, Level, pPrinter, cbBuf, pcbNeeded);

late final _GetPrinter = _winspool.lookupFunction<
    Int32 Function(IntPtr hPrinter, Uint32 Level, Pointer<Uint8> pPrinter,
        Uint32 cbBuf, Pointer<Uint32> pcbNeeded),
    int Function(int hPrinter, int Level, Pointer<Uint8> pPrinter, int cbBuf,
        Pointer<Uint32> pcbNeeded)>('GetPrinterW');

/// The GetPrinterData function retrieves configuration data for the
/// specified printer or print server.
///
/// ```c
/// DWORD GetPrinterDataW(
///   _In_  HANDLE  hPrinter,
///   _In_  LPTSTR  pValueName,
///   _Out_ LPDWORD pType,
///   _Out_ LPBYTE  pData,
///   _In_  DWORD   nSize,
///   _Out_ LPDWORD pcbNeeded
/// );
/// ```
/// {@category winspool}
int GetPrinterData(
        int hPrinter,
        Pointer<Utf16> pValueName,
        Pointer<Uint32> pType,
        Pointer<Uint8> pData,
        int nSize,
        Pointer<Uint32> pcbNeeded) =>
    _GetPrinterData(hPrinter, pValueName, pType, pData, nSize, pcbNeeded);

late final _GetPrinterData = _winspool.lookupFunction<
    Uint32 Function(
        IntPtr hPrinter,
        Pointer<Utf16> pValueName,
        Pointer<Uint32> pType,
        Pointer<Uint8> pData,
        Uint32 nSize,
        Pointer<Uint32> pcbNeeded),
    int Function(
        int hPrinter,
        Pointer<Utf16> pValueName,
        Pointer<Uint32> pType,
        Pointer<Uint8> pData,
        int nSize,
        Pointer<Uint32> pcbNeeded)>('GetPrinterDataW');

/// The GetPrinterDataEx function retrieves configuration data for the
/// specified printer or print server. GetPrinterDataEx can retrieve values
/// that the SetPrinterData function stored. In addition, GetPrinterDataEx
/// can retrieve values that the SetPrinterDataEx function stored under a
/// specified key.
///
/// ```c
/// DWORD GetPrinterDataExW(
///   _In_  HANDLE  hPrinter,
///   _In_  LPCTSTR pKeyName,
///   _In_  LPCTSTR pValueName,
///   _Out_ LPDWORD pType,
///   _Out_ LPBYTE  pData,
///   _In_  DWORD   nSize,
///   _Out_ LPDWORD pcbNeeded
/// );
/// ```
/// {@category winspool}
int GetPrinterDataEx(
        int hPrinter,
        Pointer<Utf16> pKeyName,
        Pointer<Utf16> pValueName,
        Pointer<Uint32> pType,
        Pointer<Uint8> pData,
        int nSize,
        Pointer<Uint32> pcbNeeded) =>
    _GetPrinterDataEx(
        hPrinter, pKeyName, pValueName, pType, pData, nSize, pcbNeeded);

late final _GetPrinterDataEx = _winspool.lookupFunction<
    Uint32 Function(
        IntPtr hPrinter,
        Pointer<Utf16> pKeyName,
        Pointer<Utf16> pValueName,
        Pointer<Uint32> pType,
        Pointer<Uint8> pData,
        Uint32 nSize,
        Pointer<Uint32> pcbNeeded),
    int Function(
        int hPrinter,
        Pointer<Utf16> pKeyName,
        Pointer<Utf16> pValueName,
        Pointer<Uint32> pType,
        Pointer<Uint8> pData,
        int nSize,
        Pointer<Uint32> pcbNeeded)>('GetPrinterDataExW');

/// The GetPrintExecutionData retrieves the current print context.
///
/// ```c
/// BOOL WINAPI GetPrintExecutionData(
///   _Out_ PRINT_EXECUTION_DATA *pData
/// );
/// ```
/// {@category winspool}
int GetPrintExecutionData(Pointer<PRINT_EXECUTION_DATA> pData) =>
    _GetPrintExecutionData(pData);

late final _GetPrintExecutionData = _winspool.lookupFunction<
    Int32 Function(Pointer<PRINT_EXECUTION_DATA> pData),
    int Function(Pointer<PRINT_EXECUTION_DATA> pData)>('GetPrintExecutionData');

/// The IsValidDevmode function verifies that the contents of a DEVMODE
/// structure are valid.
///
/// ```c
/// BOOL IsValidDevmodeW(
/// _In_ PDEVMODE pDevmode,
///        size_t   DevmodeSize
/// );
/// ```
/// {@category winspool}
int IsValidDevmode(Pointer<DEVMODE> pDevmode, int DevmodeSize) =>
    _IsValidDevmode(pDevmode, DevmodeSize);

late final _IsValidDevmode = _winspool.lookupFunction<
    Int32 Function(Pointer<DEVMODE> pDevmode, IntPtr DevmodeSize),
    int Function(
        Pointer<DEVMODE> pDevmode, int DevmodeSize)>('IsValidDevmodeW');

/// The OpenPrinter function retrieves a handle to the specified printer or
/// print server or other types of handles in the print subsystem.
///
/// ```c
/// BOOL OpenPrinterW(
///   _In_  LPTSTR             pPrinterName,
///   _Out_ LPHANDLE           phPrinter,
///   _In_  LPPRINTER_DEFAULTS pDefault
/// );
/// ```
/// {@category winspool}
int OpenPrinter(Pointer<Utf16> pPrinterName, Pointer<IntPtr> phPrinter,
        Pointer<PRINTER_DEFAULTS> pDefault) =>
    _OpenPrinter(pPrinterName, phPrinter, pDefault);

late final _OpenPrinter = _winspool.lookupFunction<
    Int32 Function(Pointer<Utf16> pPrinterName, Pointer<IntPtr> phPrinter,
        Pointer<PRINTER_DEFAULTS> pDefault),
    int Function(Pointer<Utf16> pPrinterName, Pointer<IntPtr> phPrinter,
        Pointer<PRINTER_DEFAULTS> pDefault)>('OpenPrinterW');

/// The PrinterProperties function displays a printer-properties property
/// sheet for the specified printer.
///
/// ```c
/// BOOL PrinterProperties(
///   _In_ HWND   hWnd,
///   _In_ HANDLE hPrinter
/// );
/// ```
/// {@category winspool}
int PrinterProperties(int hWnd, int hPrinter) =>
    _PrinterProperties(hWnd, hPrinter);

late final _PrinterProperties = _winspool.lookupFunction<
    Int32 Function(IntPtr hWnd, IntPtr hPrinter),
    int Function(int hWnd, int hPrinter)>('PrinterProperties');

/// The ResetPrinter function specifies the data type and device mode
/// values to be used for printing documents submitted by the
/// StartDocPrinter function. These values can be overridden by using the
/// SetJob function after document printing has started.
///
/// ```c
/// BOOL ResetPrinterW(
///   _In_ HANDLE             hPrinter,
///   _In_ LPPRINTER_DEFAULTS pDefault
/// );
/// ```
/// {@category winspool}
int ResetPrinter(int hPrinter, Pointer<PRINTER_DEFAULTS> pDefault) =>
    _ResetPrinter(hPrinter, pDefault);

late final _ResetPrinter = _winspool.lookupFunction<
    Int32 Function(IntPtr hPrinter, Pointer<PRINTER_DEFAULTS> pDefault),
    int Function(
        int hPrinter, Pointer<PRINTER_DEFAULTS> pDefault)>('ResetPrinterW');

/// The SetDefaultPrinter function sets the printer name of the default
/// printer for the current user on the local computer.
///
/// ```c
/// BOOL SetDefaultPrinterW(
///   _In_ LPCTSTR pszPrinter
/// );
/// ```
/// {@category winspool}
int SetDefaultPrinter(Pointer<Utf16> pszPrinter) =>
    _SetDefaultPrinter(pszPrinter);

late final _SetDefaultPrinter = _winspool.lookupFunction<
    Int32 Function(Pointer<Utf16> pszPrinter),
    int Function(Pointer<Utf16> pszPrinter)>('SetDefaultPrinterW');

/// The SetForm function sets the form information for the specified
/// printer.
///
/// ```c
/// BOOL SetFormW(
///   _In_ HANDLE hPrinter,
///   _In_ LPTSTR pFormName,
///   _In_ DWORD  Level,
///   _In_ LPTSTR pForm
/// );
/// ```
/// {@category winspool}
int SetForm(int hPrinter, Pointer<Utf16> pFormName, int Level,
        Pointer<Uint8> pForm) =>
    _SetForm(hPrinter, pFormName, Level, pForm);

late final _SetForm = _winspool.lookupFunction<
    Int32 Function(IntPtr hPrinter, Pointer<Utf16> pFormName, Uint32 Level,
        Pointer<Uint8> pForm),
    int Function(int hPrinter, Pointer<Utf16> pFormName, int Level,
        Pointer<Uint8> pForm)>('SetFormW');

/// The SetJob function pauses, resumes, cancels, or restarts a print job
/// on a specified printer. You can also use the SetJob function to set
/// print job parameters, such as the print job priority and the document
/// name.
///
/// ```c
/// BOOL SetJobW(
///   _In_ HANDLE hPrinter,
///   _In_ DWORD  JobId,
///   _In_ DWORD  Level,
///   _In_ LPBYTE pJob,
///   _In_ DWORD  Command
/// );
/// ```
/// {@category winspool}
int SetJob(
        int hPrinter, int JobId, int Level, Pointer<Uint8> pJob, int Command) =>
    _SetJob(hPrinter, JobId, Level, pJob, Command);

late final _SetJob = _winspool.lookupFunction<
    Int32 Function(IntPtr hPrinter, Uint32 JobId, Uint32 Level,
        Pointer<Uint8> pJob, Uint32 Command),
    int Function(int hPrinter, int JobId, int Level, Pointer<Uint8> pJob,
        int Command)>('SetJobW');

/// The SetPort function sets the status associated with a printer port.
///
/// ```c
/// BOOL SetPortW(
///   _In_ LPTSTR pName,
///   _In_ LPTSTR pPortName,
///   _In_ DWORD  dwLevel,
///   _In_ LPBYTE pPortInfo
/// );
/// ```
/// {@category winspool}
int SetPort(Pointer<Utf16> pName, Pointer<Utf16> pPortName, int dwLevel,
        Pointer<Uint8> pPortInfo) =>
    _SetPort(pName, pPortName, dwLevel, pPortInfo);

late final _SetPort = _winspool.lookupFunction<
    Int32 Function(Pointer<Utf16> pName, Pointer<Utf16> pPortName,
        Uint32 dwLevel, Pointer<Uint8> pPortInfo),
    int Function(Pointer<Utf16> pName, Pointer<Utf16> pPortName, int dwLevel,
        Pointer<Uint8> pPortInfo)>('SetPortW');

/// The SetPrinter function sets the data for a specified printer or sets
/// the state of the specified printer by pausing printing, resuming
/// printing, or clearing all print jobs.
///
/// ```c
/// BOOL SetPrinterW(
///   _In_ HANDLE hPrinter,
///   _In_ DWORD  Level,
///   _In_ LPBYTE pPrinter,
///   _In_ DWORD  Command
/// );
/// ```
/// {@category winspool}
int SetPrinter(int hPrinter, int Level, Pointer<Uint8> pPrinter, int Command) =>
    _SetPrinter(hPrinter, Level, pPrinter, Command);

late final _SetPrinter = _winspool.lookupFunction<
    Int32 Function(
        IntPtr hPrinter, Uint32 Level, Pointer<Uint8> pPrinter, Uint32 Command),
    int Function(int hPrinter, int Level, Pointer<Uint8> pPrinter,
        int Command)>('SetPrinterW');

/// The SetPrinterData function sets the configuration data for a printer
/// or print server.
///
/// ```c
/// DWORD SetPrinterDataW(
///   _In_ HANDLE hPrinter,
///   _In_ LPTSTR pValueName,
///   _In_ DWORD  Type,
///   _In_ LPBYTE pData,
///   _In_ DWORD  cbData
/// );
/// ```
/// {@category winspool}
int SetPrinterData(int hPrinter, Pointer<Utf16> pValueName, int Type,
        Pointer<Uint8> pData, int cbData) =>
    _SetPrinterData(hPrinter, pValueName, Type, pData, cbData);

late final _SetPrinterData = _winspool.lookupFunction<
    Uint32 Function(IntPtr hPrinter, Pointer<Utf16> pValueName, Uint32 Type,
        Pointer<Uint8> pData, Uint32 cbData),
    int Function(int hPrinter, Pointer<Utf16> pValueName, int Type,
        Pointer<Uint8> pData, int cbData)>('SetPrinterDataW');

/// The SetPrinterDataEx function sets the configuration data for a printer
/// or print server. The function stores the configuration data under the
/// printer's registry key.
///
/// ```c
/// DWORD SetPrinterDataExW(
///   _In_ HANDLE  hPrinter,
///   _In_ LPCTSTR pKeyName,
///   _In_ LPCTSTR pValueName,
///   _In_ DWORD   Type,
///   _In_ LPBYTE  pData,
///   _In_ DWORD   cbData
/// );
/// ```
/// {@category winspool}
int SetPrinterDataEx(
        int hPrinter,
        Pointer<Utf16> pKeyName,
        Pointer<Utf16> pValueName,
        int Type,
        Pointer<Uint8> pData,
        int cbData) =>
    _SetPrinterDataEx(hPrinter, pKeyName, pValueName, Type, pData, cbData);

late final _SetPrinterDataEx = _winspool.lookupFunction<
    Uint32 Function(
        IntPtr hPrinter,
        Pointer<Utf16> pKeyName,
        Pointer<Utf16> pValueName,
        Uint32 Type,
        Pointer<Uint8> pData,
        Uint32 cbData),
    int Function(
        int hPrinter,
        Pointer<Utf16> pKeyName,
        Pointer<Utf16> pValueName,
        int Type,
        Pointer<Uint8> pData,
        int cbData)>('SetPrinterDataExW');

/// The StartDocPrinter function notifies the print spooler that a document
/// is to be spooled for printing.
///
/// ```c
/// DWORD StartDocPrinterW(
///   _In_ HANDLE hPrinter,
///   _In_ DWORD  Level,
///   _In_ LPBYTE pDocInfo
/// );
/// ```
/// {@category winspool}
int StartDocPrinter(int hPrinter, int Level, Pointer<DOC_INFO_1> pDocInfo) =>
    _StartDocPrinter(hPrinter, Level, pDocInfo);

late final _StartDocPrinter = _winspool.lookupFunction<
    Uint32 Function(
        IntPtr hPrinter, Uint32 Level, Pointer<DOC_INFO_1> pDocInfo),
    int Function(int hPrinter, int Level,
        Pointer<DOC_INFO_1> pDocInfo)>('StartDocPrinterW');

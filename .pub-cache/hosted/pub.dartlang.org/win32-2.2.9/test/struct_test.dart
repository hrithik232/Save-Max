// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Tests that Win32 structs are the right size.

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

@TestOn('windows')

import 'dart:ffi';

import 'package:test/test.dart';
import 'package:win32/win32.dart';
import 'package:win32/winsock2.dart';

void main() {
  final is64bitOS = sizeOf<IntPtr>() == 8;
  test('Struct APPX_PACKAGE_SETTINGS is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<APPX_PACKAGE_SETTINGS>(), equals(16));
    } else {
      expect(sizeOf<APPX_PACKAGE_SETTINGS>(), equals(8));
    }
  });
  test('Struct BLUETOOTH_ADDRESS is the right size', () {
    expect(sizeOf<BLUETOOTH_ADDRESS>(), equals(8));
  });
  test('Struct BLUETOOTH_AUTHENTICATION_CALLBACK_PARAMS is the right size', () {
    expect(sizeOf<BLUETOOTH_AUTHENTICATION_CALLBACK_PARAMS>(), equals(576));
  });
  test('Struct BLUETOOTH_PIN_INFO is the right size', () {
    expect(sizeOf<BLUETOOTH_PIN_INFO>(), equals(17));
  });
  test('Struct CHAR_INFO is the right size', () {
    expect(sizeOf<CHAR_INFO>(), equals(4));
  });
  test('Struct COMMPROP is the right size', () {
    expect(sizeOf<COMMPROP>(), equals(64));
  });
  test('Struct COR_FIELD_OFFSET is the right size', () {
    expect(sizeOf<COR_FIELD_OFFSET>(), equals(8));
  });
  test('Struct DEVMODE is the right size', () {
    expect(sizeOf<DEVMODE>(), equals(220));
  });
  test('Struct GUID is the right size', () {
    expect(sizeOf<GUID>(), equals(16));
  });
  test('Struct INPUT is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<INPUT>(), equals(40));
    } else {
      expect(sizeOf<INPUT>(), equals(28));
    }
  });
  test('Struct MMTIME is the right size', () {
    expect(sizeOf<MMTIME>(), equals(12));
  });
  test('Struct NOTIFYICONDATA is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<NOTIFYICONDATA>(), equals(976));
    } else {
      expect(sizeOf<NOTIFYICONDATA>(), equals(956));
    }
  });
  test('Struct OVERLAPPED is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<OVERLAPPED>(), equals(32));
    } else {
      expect(sizeOf<OVERLAPPED>(), equals(20));
    }
  });
  test('Struct PRINTER_NOTIFY_INFO_DATA is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<PRINTER_NOTIFY_INFO_DATA>(), equals(32));
    } else {
      expect(sizeOf<PRINTER_NOTIFY_INFO_DATA>(), equals(20));
    }
  });
  test('Struct PROCESS_HEAP_ENTRY is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<PROCESS_HEAP_ENTRY>(), equals(40));
    } else {
      expect(sizeOf<PROCESS_HEAP_ENTRY>(), equals(28));
    }
  });
  test('Struct PROPSPEC is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<PROPSPEC>(), equals(16));
    } else {
      expect(sizeOf<PROPSPEC>(), equals(8));
    }
  });
  test('Struct PROPVARIANT is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<PROPVARIANT>(), equals(24));
    } else {
      expect(sizeOf<PROPVARIANT>(), equals(16));
    }
  });
  test('Struct SHELLEXECUTEINFO is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<SHELLEXECUTEINFO>(), equals(112));
    } else {
      expect(sizeOf<SHELLEXECUTEINFO>(), equals(60));
    }
  });
  test('Struct STARTUPINFOEX is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<STARTUPINFOEX>(), equals(112));
    } else {
      expect(sizeOf<STARTUPINFOEX>(), equals(72));
    }
  });
  test('Struct SYSTEM_INFO is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<SYSTEM_INFO>(), equals(48));
    } else {
      expect(sizeOf<SYSTEM_INFO>(), equals(36));
    }
  });
  test('Struct TASKDIALOGCONFIG is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<TASKDIALOGCONFIG>(), equals(160));
    } else {
      expect(sizeOf<TASKDIALOGCONFIG>(), equals(96));
    }
  });
  test('Struct TYPEDESC is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<TYPEDESC>(), equals(16));
    } else {
      expect(sizeOf<TYPEDESC>(), equals(8));
    }
  });
  test('Struct VARIANT is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<VARIANT>(), equals(24));
    } else {
      expect(sizeOf<VARIANT>(), equals(16));
    }
  });
  test('Struct ACCEL is the right size', () {
    expect(sizeOf<ACCEL>(), equals(6));
  });
  test('Struct ACL is the right size', () {
    expect(sizeOf<ACL>(), equals(8));
  });
  test('Struct ACTCTX is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<ACTCTX>(), equals(56));
    } else {
      expect(sizeOf<ACTCTX>(), equals(32));
    }
  });
  test('Struct ADDJOB_INFO_1 is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<ADDJOB_INFO_1>(), equals(16));
    } else {
      expect(sizeOf<ADDJOB_INFO_1>(), equals(8));
    }
  });
  test('Struct addrinfo is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<addrinfo>(), equals(48));
    } else {
      expect(sizeOf<addrinfo>(), equals(32));
    }
  });
  test('Struct BIND_OPTS is the right size', () {
    expect(sizeOf<BIND_OPTS>(), equals(16));
  });
  test('Struct BITMAP is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<BITMAP>(), equals(32));
    } else {
      expect(sizeOf<BITMAP>(), equals(24));
    }
  });
  test('Struct BITMAPFILEHEADER is the right size', () {
    expect(sizeOf<BITMAPFILEHEADER>(), equals(14));
  });
  test('Struct BITMAPINFO is the right size', () {
    expect(sizeOf<BITMAPINFO>(), equals(44));
  });
  test('Struct BITMAPINFOHEADER is the right size', () {
    expect(sizeOf<BITMAPINFOHEADER>(), equals(40));
  });
  test('Struct BLENDFUNCTION is the right size', () {
    expect(sizeOf<BLENDFUNCTION>(), equals(4));
  });
  test('Struct BLUETOOTH_DEVICE_INFO is the right size', () {
    expect(sizeOf<BLUETOOTH_DEVICE_INFO>(), equals(560));
  });
  test('Struct BLUETOOTH_DEVICE_SEARCH_PARAMS is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<BLUETOOTH_DEVICE_SEARCH_PARAMS>(), equals(40));
    } else {
      expect(sizeOf<BLUETOOTH_DEVICE_SEARCH_PARAMS>(), equals(32));
    }
  });
  test('Struct BLUETOOTH_FIND_RADIO_PARAMS is the right size', () {
    expect(sizeOf<BLUETOOTH_FIND_RADIO_PARAMS>(), equals(4));
  });
  test('Struct BLUETOOTH_OOB_DATA_INFO is the right size', () {
    expect(sizeOf<BLUETOOTH_OOB_DATA_INFO>(), equals(32));
  });
  test('Struct BLUETOOTH_RADIO_INFO is the right size', () {
    expect(sizeOf<BLUETOOTH_RADIO_INFO>(), equals(520));
  });
  test('Struct BSMINFO is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<BSMINFO>(), equals(32));
    } else {
      expect(sizeOf<BSMINFO>(), equals(20));
    }
  });
  test('Struct BY_HANDLE_FILE_INFORMATION is the right size', () {
    expect(sizeOf<BY_HANDLE_FILE_INFORMATION>(), equals(52));
  });
  test('Struct CHANGEFILTERSTRUCT is the right size', () {
    expect(sizeOf<CHANGEFILTERSTRUCT>(), equals(8));
  });
  test('Struct CHOOSECOLOR is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<CHOOSECOLOR>(), equals(72));
    } else {
      expect(sizeOf<CHOOSECOLOR>(), equals(36));
    }
  });
  test('Struct CHOOSEFONT is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<CHOOSEFONT>(), equals(104));
    } else {
      expect(sizeOf<CHOOSEFONT>(), equals(60));
    }
  });
  test('Struct COLORADJUSTMENT is the right size', () {
    expect(sizeOf<COLORADJUSTMENT>(), equals(24));
  });
  test('Struct COMDLG_FILTERSPEC is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<COMDLG_FILTERSPEC>(), equals(16));
    } else {
      expect(sizeOf<COMDLG_FILTERSPEC>(), equals(8));
    }
  });
  test('Struct COMMCONFIG is the right size', () {
    expect(sizeOf<COMMCONFIG>(), equals(52));
  });
  test('Struct COMMTIMEOUTS is the right size', () {
    expect(sizeOf<COMMTIMEOUTS>(), equals(20));
  });
  test('Struct COMSTAT is the right size', () {
    expect(sizeOf<COMSTAT>(), equals(12));
  });
  test('Struct CONSOLE_CURSOR_INFO is the right size', () {
    expect(sizeOf<CONSOLE_CURSOR_INFO>(), equals(8));
  });
  test('Struct CONSOLE_SCREEN_BUFFER_INFO is the right size', () {
    expect(sizeOf<CONSOLE_SCREEN_BUFFER_INFO>(), equals(22));
  });
  test('Struct CONSOLE_SELECTION_INFO is the right size', () {
    expect(sizeOf<CONSOLE_SELECTION_INFO>(), equals(16));
  });
  test('Struct COORD is the right size', () {
    expect(sizeOf<COORD>(), equals(4));
  });
  test('Struct CREATESTRUCT is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<CREATESTRUCT>(), equals(80));
    } else {
      expect(sizeOf<CREATESTRUCT>(), equals(48));
    }
  });
  test('Struct CREDENTIAL is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<CREDENTIAL>(), equals(80));
    } else {
      expect(sizeOf<CREDENTIAL>(), equals(52));
    }
  });
  test('Struct CREDENTIAL_ATTRIBUTE is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<CREDENTIAL_ATTRIBUTE>(), equals(24));
    } else {
      expect(sizeOf<CREDENTIAL_ATTRIBUTE>(), equals(16));
    }
  });
  test('Struct CURSORINFO is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<CURSORINFO>(), equals(24));
    } else {
      expect(sizeOf<CURSORINFO>(), equals(20));
    }
  });
  test('Struct DCB is the right size', () {
    expect(sizeOf<DCB>(), equals(28));
  });
  test('Struct DESIGNVECTOR is the right size', () {
    expect(sizeOf<DESIGNVECTOR>(), equals(72));
  });
  test('Struct DIBSECTION is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<DIBSECTION>(), equals(104));
    } else {
      expect(sizeOf<DIBSECTION>(), equals(84));
    }
  });
  test('Struct DISK_GEOMETRY is the right size', () {
    expect(sizeOf<DISK_GEOMETRY>(), equals(24));
  });
  test('Struct DISK_GEOMETRY_EX is the right size', () {
    expect(sizeOf<DISK_GEOMETRY_EX>(), equals(40));
  });
  test('Struct DISPPARAMS is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<DISPPARAMS>(), equals(24));
    } else {
      expect(sizeOf<DISPPARAMS>(), equals(16));
    }
  });
  test('Struct DLGITEMTEMPLATE is the right size', () {
    expect(sizeOf<DLGITEMTEMPLATE>(), equals(18));
  });
  test('Struct DLGTEMPLATE is the right size', () {
    expect(sizeOf<DLGTEMPLATE>(), equals(18));
  });
  test('Struct DLLVERSIONINFO is the right size', () {
    expect(sizeOf<DLLVERSIONINFO>(), equals(20));
  });
  test('Struct DOC_INFO_1 is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<DOC_INFO_1>(), equals(24));
    } else {
      expect(sizeOf<DOC_INFO_1>(), equals(12));
    }
  });
  test('Struct DOT11_AUTH_CIPHER_PAIR is the right size', () {
    expect(sizeOf<DOT11_AUTH_CIPHER_PAIR>(), equals(8));
  });
  test('Struct DOT11_BSSID_LIST is the right size', () {
    expect(sizeOf<DOT11_BSSID_LIST>(), equals(20));
  });
  test('Struct DOT11_NETWORK is the right size', () {
    expect(sizeOf<DOT11_NETWORK>(), equals(40));
  });
  test('Struct DOT11_NETWORK_LIST is the right size', () {
    expect(sizeOf<DOT11_NETWORK_LIST>(), equals(48));
  });
  test('Struct DOT11_SSID is the right size', () {
    expect(sizeOf<DOT11_SSID>(), equals(36));
  });
  test('Struct DRAWTEXTPARAMS is the right size', () {
    expect(sizeOf<DRAWTEXTPARAMS>(), equals(20));
  });
  test('Struct DTBGOPTS is the right size', () {
    expect(sizeOf<DTBGOPTS>(), equals(24));
  });
  test('Struct DTTOPTS is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<DTTOPTS>(), equals(72));
    } else {
      expect(sizeOf<DTTOPTS>(), equals(64));
    }
  });
  test('Struct DWM_BLURBEHIND is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<DWM_BLURBEHIND>(), equals(20));
    } else {
      expect(sizeOf<DWM_BLURBEHIND>(), equals(16));
    }
  });
  test('Struct EAP_METHOD_TYPE is the right size', () {
    expect(sizeOf<EAP_METHOD_TYPE>(), equals(16));
  });
  test('Struct EAP_TYPE is the right size', () {
    expect(sizeOf<EAP_TYPE>(), equals(12));
  });
  test('Struct ENUMLOGFONTEX is the right size', () {
    expect(sizeOf<ENUMLOGFONTEX>(), equals(348));
  });
  test('Struct EXCEPINFO is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<EXCEPINFO>(), equals(64));
    } else {
      expect(sizeOf<EXCEPINFO>(), equals(32));
    }
  });
  test('Struct fd_set is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<fd_set>(), equals(520));
    } else {
      expect(sizeOf<fd_set>(), equals(260));
    }
  });
  test('Struct FILETIME is the right size', () {
    expect(sizeOf<FILETIME>(), equals(8));
  });
  test('Struct FINDREPLACE is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<FINDREPLACE>(), equals(80));
    } else {
      expect(sizeOf<FINDREPLACE>(), equals(40));
    }
  });
  test('Struct FUNCDESC is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<FUNCDESC>(), equals(88));
    } else {
      expect(sizeOf<FUNCDESC>(), equals(52));
    }
  });
  test('Struct GESTURECONFIG is the right size', () {
    expect(sizeOf<GESTURECONFIG>(), equals(12));
  });
  test('Struct GESTUREINFO is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<GESTUREINFO>(), equals(56));
    } else {
      expect(sizeOf<GESTUREINFO>(), equals(48));
    }
  });
  test('Struct GESTURENOTIFYSTRUCT is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<GESTURENOTIFYSTRUCT>(), equals(24));
    } else {
      expect(sizeOf<GESTURENOTIFYSTRUCT>(), equals(20));
    }
  });
  test('Struct GUITHREADINFO is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<GUITHREADINFO>(), equals(72));
    } else {
      expect(sizeOf<GUITHREADINFO>(), equals(48));
    }
  });
  test('Struct hostent is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<hostent>(), equals(32));
    } else {
      expect(sizeOf<hostent>(), equals(16));
    }
  });
  test('Struct ICONINFO is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<ICONINFO>(), equals(32));
    } else {
      expect(sizeOf<ICONINFO>(), equals(20));
    }
  });
  test('Struct ICONINFOEX is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<ICONINFOEX>(), equals(1080));
    } else {
      expect(sizeOf<ICONINFOEX>(), equals(1068));
    }
  });
  test('Struct IDLDESC is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<IDLDESC>(), equals(16));
    } else {
      expect(sizeOf<IDLDESC>(), equals(8));
    }
  });
  test('Struct INITCOMMONCONTROLSEX is the right size', () {
    expect(sizeOf<INITCOMMONCONTROLSEX>(), equals(8));
  });
  test('Struct ITEMIDLIST is the right size', () {
    expect(sizeOf<ITEMIDLIST>(), equals(3));
  });
  test('Struct JOB_INFO_1 is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<JOB_INFO_1>(), equals(96));
    } else {
      expect(sizeOf<JOB_INFO_1>(), equals(64));
    }
  });
  test('Struct KNOWNFOLDER_DEFINITION is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<KNOWNFOLDER_DEFINITION>(), equals(112));
    } else {
      expect(sizeOf<KNOWNFOLDER_DEFINITION>(), equals(76));
    }
  });
  test('Struct L2_NOTIFICATION_DATA is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<L2_NOTIFICATION_DATA>(), equals(40));
    } else {
      expect(sizeOf<L2_NOTIFICATION_DATA>(), equals(32));
    }
  });
  test('Struct LASTINPUTINFO is the right size', () {
    expect(sizeOf<LASTINPUTINFO>(), equals(8));
  });
  test('Struct LOGBRUSH is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<LOGBRUSH>(), equals(16));
    } else {
      expect(sizeOf<LOGBRUSH>(), equals(12));
    }
  });
  test('Struct LOGFONT is the right size', () {
    expect(sizeOf<LOGFONT>(), equals(92));
  });
  test('Struct LOGPALETTE is the right size', () {
    expect(sizeOf<LOGPALETTE>(), equals(8));
  });
  test('Struct LUID is the right size', () {
    expect(sizeOf<LUID>(), equals(8));
  });
  test('Struct MARGINS is the right size', () {
    expect(sizeOf<MARGINS>(), equals(16));
  });
  test('Struct MCI_OPEN_PARMS is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<MCI_OPEN_PARMS>(), equals(36));
    } else {
      expect(sizeOf<MCI_OPEN_PARMS>(), equals(20));
    }
  });
  test('Struct MCI_PLAY_PARMS is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<MCI_PLAY_PARMS>(), equals(16));
    } else {
      expect(sizeOf<MCI_PLAY_PARMS>(), equals(12));
    }
  });
  test('Struct MCI_SEEK_PARMS is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<MCI_SEEK_PARMS>(), equals(12));
    } else {
      expect(sizeOf<MCI_SEEK_PARMS>(), equals(8));
    }
  });
  test('Struct MCI_STATUS_PARMS is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<MCI_STATUS_PARMS>(), equals(24));
    } else {
      expect(sizeOf<MCI_STATUS_PARMS>(), equals(16));
    }
  });
  test('Struct MENUINFO is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<MENUINFO>(), equals(40));
    } else {
      expect(sizeOf<MENUINFO>(), equals(28));
    }
  });
  test('Struct MENUITEMINFO is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<MENUITEMINFO>(), equals(80));
    } else {
      expect(sizeOf<MENUITEMINFO>(), equals(48));
    }
  });
  test('Struct MENUITEMTEMPLATE is the right size', () {
    expect(sizeOf<MENUITEMTEMPLATE>(), equals(6));
  });
  test('Struct MENUITEMTEMPLATEHEADER is the right size', () {
    expect(sizeOf<MENUITEMTEMPLATEHEADER>(), equals(4));
  });
  test('Struct METAFILEPICT is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<METAFILEPICT>(), equals(24));
    } else {
      expect(sizeOf<METAFILEPICT>(), equals(16));
    }
  });
  test('Struct MIDIEVENT is the right size', () {
    expect(sizeOf<MIDIEVENT>(), equals(16));
  });
  test('Struct MIDIHDR is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<MIDIHDR>(), equals(112));
    } else {
      expect(sizeOf<MIDIHDR>(), equals(64));
    }
  });
  test('Struct MIDIINCAPS is the right size', () {
    expect(sizeOf<MIDIINCAPS>(), equals(76));
  });
  test('Struct MIDIOUTCAPS is the right size', () {
    expect(sizeOf<MIDIOUTCAPS>(), equals(84));
  });
  test('Struct MIDIPROPTEMPO is the right size', () {
    expect(sizeOf<MIDIPROPTEMPO>(), equals(8));
  });
  test('Struct MIDIPROPTIMEDIV is the right size', () {
    expect(sizeOf<MIDIPROPTIMEDIV>(), equals(8));
  });
  test('Struct MIDISTRMBUFFVER is the right size', () {
    expect(sizeOf<MIDISTRMBUFFVER>(), equals(12));
  });
  test('Struct MINMAXINFO is the right size', () {
    expect(sizeOf<MINMAXINFO>(), equals(40));
  });
  test('Struct MODEMDEVCAPS is the right size', () {
    expect(sizeOf<MODEMDEVCAPS>(), equals(80));
  });
  test('Struct MODEMSETTINGS is the right size', () {
    expect(sizeOf<MODEMSETTINGS>(), equals(48));
  });
  test('Struct MODLOAD_DATA is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<MODLOAD_DATA>(), equals(24));
    } else {
      expect(sizeOf<MODLOAD_DATA>(), equals(20));
    }
  });
  test('Struct MONITORINFO is the right size', () {
    expect(sizeOf<MONITORINFO>(), equals(40));
  });
  test('Struct MOUSEMOVEPOINT is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<MOUSEMOVEPOINT>(), equals(24));
    } else {
      expect(sizeOf<MOUSEMOVEPOINT>(), equals(16));
    }
  });
  test('Struct MSG is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<MSG>(), equals(48));
    } else {
      expect(sizeOf<MSG>(), equals(28));
    }
  });
  test('Struct NDIS_OBJECT_HEADER is the right size', () {
    expect(sizeOf<NDIS_OBJECT_HEADER>(), equals(4));
  });
  test('Struct NEWTEXTMETRIC is the right size', () {
    expect(sizeOf<NEWTEXTMETRIC>(), equals(76));
  });
  test('Struct NLM_SIMULATED_PROFILE_INFO is the right size', () {
    expect(sizeOf<NLM_SIMULATED_PROFILE_INFO>(), equals(524));
  });
  test('Struct NONCLIENTMETRICS is the right size', () {
    expect(sizeOf<NONCLIENTMETRICS>(), equals(504));
  });
  test('Struct OPENCARD_SEARCH_CRITERIA is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<OPENCARD_SEARCH_CRITERIA>(), equals(96));
    } else {
      expect(sizeOf<OPENCARD_SEARCH_CRITERIA>(), equals(52));
    }
  });
  test('Struct OPENCARDNAME is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<OPENCARDNAME>(), equals(176));
    } else {
      expect(sizeOf<OPENCARDNAME>(), equals(92));
    }
  });
  test('Struct OPENCARDNAME_EX is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<OPENCARDNAME_EX>(), equals(128));
    } else {
      expect(sizeOf<OPENCARDNAME_EX>(), equals(72));
    }
  });
  test('Struct OPENFILENAME is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<OPENFILENAME>(), equals(152));
    } else {
      expect(sizeOf<OPENFILENAME>(), equals(88));
    }
  });
  test('Struct OSVERSIONINFO is the right size', () {
    expect(sizeOf<OSVERSIONINFO>(), equals(276));
  });
  test('Struct OSVERSIONINFOEXW is the right size', () {
    expect(sizeOf<OSVERSIONINFOEXW>(), equals(284));
  });
  test('Struct OVERLAPPED_ENTRY is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<OVERLAPPED_ENTRY>(), equals(32));
    } else {
      expect(sizeOf<OVERLAPPED_ENTRY>(), equals(16));
    }
  });
  test('Struct PAINTSTRUCT is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<PAINTSTRUCT>(), equals(72));
    } else {
      expect(sizeOf<PAINTSTRUCT>(), equals(64));
    }
  });
  test('Struct PALETTEENTRY is the right size', () {
    expect(sizeOf<PALETTEENTRY>(), equals(4));
  });
  test('Struct PARAMDESC is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<PARAMDESC>(), equals(16));
    } else {
      expect(sizeOf<PARAMDESC>(), equals(8));
    }
  });
  test('Struct PARAMDESCEX is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<PARAMDESCEX>(), equals(32));
    } else {
      expect(sizeOf<PARAMDESCEX>(), equals(24));
    }
  });
  test('Struct PHYSICAL_MONITOR is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<PHYSICAL_MONITOR>(), equals(264));
    } else {
      expect(sizeOf<PHYSICAL_MONITOR>(), equals(260));
    }
  });
  test('Struct POINT is the right size', () {
    expect(sizeOf<POINT>(), equals(8));
  });
  test('Struct POINTS is the right size', () {
    expect(sizeOf<POINTS>(), equals(4));
  });
  test('Struct POLYTEXT is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<POLYTEXT>(), equals(56));
    } else {
      expect(sizeOf<POLYTEXT>(), equals(40));
    }
  });
  test('Struct PORT_INFO_1 is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<PORT_INFO_1>(), equals(8));
    } else {
      expect(sizeOf<PORT_INFO_1>(), equals(4));
    }
  });
  test('Struct PORT_INFO_2 is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<PORT_INFO_2>(), equals(32));
    } else {
      expect(sizeOf<PORT_INFO_2>(), equals(20));
    }
  });
  test('Struct POWERBROADCAST_SETTING is the right size', () {
    expect(sizeOf<POWERBROADCAST_SETTING>(), equals(24));
  });
  test('Struct PRINT_EXECUTION_DATA is the right size', () {
    expect(sizeOf<PRINT_EXECUTION_DATA>(), equals(8));
  });
  test('Struct PRINTER_DEFAULTS is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<PRINTER_DEFAULTS>(), equals(24));
    } else {
      expect(sizeOf<PRINTER_DEFAULTS>(), equals(12));
    }
  });
  test('Struct PRINTER_INFO_1 is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<PRINTER_INFO_1>(), equals(32));
    } else {
      expect(sizeOf<PRINTER_INFO_1>(), equals(16));
    }
  });
  test('Struct PRINTER_INFO_2 is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<PRINTER_INFO_2>(), equals(136));
    } else {
      expect(sizeOf<PRINTER_INFO_2>(), equals(84));
    }
  });
  test('Struct PRINTER_INFO_3 is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<PRINTER_INFO_3>(), equals(8));
    } else {
      expect(sizeOf<PRINTER_INFO_3>(), equals(4));
    }
  });
  test('Struct PRINTER_INFO_4 is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<PRINTER_INFO_4>(), equals(24));
    } else {
      expect(sizeOf<PRINTER_INFO_4>(), equals(12));
    }
  });
  test('Struct PRINTER_INFO_5 is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<PRINTER_INFO_5>(), equals(32));
    } else {
      expect(sizeOf<PRINTER_INFO_5>(), equals(20));
    }
  });
  test('Struct PRINTER_INFO_6 is the right size', () {
    expect(sizeOf<PRINTER_INFO_6>(), equals(4));
  });
  test('Struct PRINTER_NOTIFY_INFO is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<PRINTER_NOTIFY_INFO>(), equals(48));
    } else {
      expect(sizeOf<PRINTER_NOTIFY_INFO>(), equals(32));
    }
  });
  test('Struct PRINTER_OPTIONS is the right size', () {
    expect(sizeOf<PRINTER_OPTIONS>(), equals(8));
  });
  test('Struct PROCESS_INFORMATION is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<PROCESS_INFORMATION>(), equals(24));
    } else {
      expect(sizeOf<PROCESS_INFORMATION>(), equals(16));
    }
  });
  test('Struct PROPERTYKEY is the right size', () {
    expect(sizeOf<PROPERTYKEY>(), equals(20));
  });
  test('Struct protoent is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<protoent>(), equals(24));
    } else {
      expect(sizeOf<protoent>(), equals(12));
    }
  });
  test('Struct RECT is the right size', () {
    expect(sizeOf<RECT>(), equals(16));
  });
  test('Struct RGBQUAD is the right size', () {
    expect(sizeOf<RGBQUAD>(), equals(4));
  });
  test('Struct SAFEARRAY is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<SAFEARRAY>(), equals(32));
    } else {
      expect(sizeOf<SAFEARRAY>(), equals(24));
    }
  });
  test('Struct SAFEARRAYBOUND is the right size', () {
    expect(sizeOf<SAFEARRAYBOUND>(), equals(8));
  });
  test('Struct SCARD_ATRMASK is the right size', () {
    expect(sizeOf<SCARD_ATRMASK>(), equals(76));
  });
  test('Struct SCARD_IO_REQUEST is the right size', () {
    expect(sizeOf<SCARD_IO_REQUEST>(), equals(8));
  });
  test('Struct SCARD_READERSTATE is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<SCARD_READERSTATE>(), equals(64));
    } else {
      expect(sizeOf<SCARD_READERSTATE>(), equals(56));
    }
  });
  test('Struct SCROLLBARINFO is the right size', () {
    expect(sizeOf<SCROLLBARINFO>(), equals(60));
  });
  test('Struct SCROLLINFO is the right size', () {
    expect(sizeOf<SCROLLINFO>(), equals(28));
  });
  test('Struct SECURITY_ATTRIBUTES is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<SECURITY_ATTRIBUTES>(), equals(24));
    } else {
      expect(sizeOf<SECURITY_ATTRIBUTES>(), equals(12));
    }
  });
  test('Struct SECURITY_DESCRIPTOR is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<SECURITY_DESCRIPTOR>(), equals(40));
    } else {
      expect(sizeOf<SECURITY_DESCRIPTOR>(), equals(20));
    }
  });
  test('Struct servent is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<servent>(), equals(32));
    } else {
      expect(sizeOf<servent>(), equals(16));
    }
  });
  test('Struct SHELL_ITEM_RESOURCE is the right size', () {
    expect(sizeOf<SHELL_ITEM_RESOURCE>(), equals(536));
  });
  test('Struct SHITEMID is the right size', () {
    expect(sizeOf<SHITEMID>(), equals(3));
  });
  test('Struct SHQUERYRBINFO is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<SHQUERYRBINFO>(), equals(24));
    } else {
      expect(sizeOf<SHQUERYRBINFO>(), equals(20));
    }
  });
  test('Struct SIZE is the right size', () {
    expect(sizeOf<SIZE>(), equals(8));
  });
  test('Struct SMALL_RECT is the right size', () {
    expect(sizeOf<SMALL_RECT>(), equals(8));
  });
  test('Struct SOCKADDR is the right size', () {
    expect(sizeOf<SOCKADDR>(), equals(16));
  });
  test('Struct SOLE_AUTHENTICATION_SERVICE is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<SOLE_AUTHENTICATION_SERVICE>(), equals(24));
    } else {
      expect(sizeOf<SOLE_AUTHENTICATION_SERVICE>(), equals(16));
    }
  });
  test('Struct STARTUPINFO is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<STARTUPINFO>(), equals(104));
    } else {
      expect(sizeOf<STARTUPINFO>(), equals(68));
    }
  });
  test('Struct STATPROPSETSTG is the right size', () {
    expect(sizeOf<STATPROPSETSTG>(), equals(64));
  });
  test('Struct STATPROPSTG is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<STATPROPSTG>(), equals(16));
    } else {
      expect(sizeOf<STATPROPSTG>(), equals(12));
    }
  });
  test('Struct STATSTG is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<STATSTG>(), equals(80));
    } else {
      expect(sizeOf<STATSTG>(), equals(72));
    }
  });
  test('Struct STYLESTRUCT is the right size', () {
    expect(sizeOf<STYLESTRUCT>(), equals(8));
  });
  test('Struct SYMBOL_INFO is the right size', () {
    expect(sizeOf<SYMBOL_INFO>(), equals(88));
  });
  test('Struct SYSTEM_BATTERY_STATE is the right size', () {
    expect(sizeOf<SYSTEM_BATTERY_STATE>(), equals(32));
  });
  test('Struct SYSTEM_POWER_STATUS is the right size', () {
    expect(sizeOf<SYSTEM_POWER_STATUS>(), equals(12));
  });
  test('Struct SYSTEMTIME is the right size', () {
    expect(sizeOf<SYSTEMTIME>(), equals(16));
  });
  test('Struct TASKDIALOG_BUTTON is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<TASKDIALOG_BUTTON>(), equals(12));
    } else {
      expect(sizeOf<TASKDIALOG_BUTTON>(), equals(8));
    }
  });
  test('Struct TEXTMETRIC is the right size', () {
    expect(sizeOf<TEXTMETRIC>(), equals(60));
  });
  test('Struct timeval is the right size', () {
    expect(sizeOf<timeval>(), equals(8));
  });
  test('Struct TITLEBARINFO is the right size', () {
    expect(sizeOf<TITLEBARINFO>(), equals(44));
  });
  test('Struct TITLEBARINFOEX is the right size', () {
    expect(sizeOf<TITLEBARINFOEX>(), equals(140));
  });
  test('Struct TOKEN_APPCONTAINER_INFORMATION is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<TOKEN_APPCONTAINER_INFORMATION>(), equals(8));
    } else {
      expect(sizeOf<TOKEN_APPCONTAINER_INFORMATION>(), equals(4));
    }
  });
  test('Struct TOUCHINPUT is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<TOUCHINPUT>(), equals(48));
    } else {
      expect(sizeOf<TOUCHINPUT>(), equals(40));
    }
  });
  test('Struct TPMPARAMS is the right size', () {
    expect(sizeOf<TPMPARAMS>(), equals(20));
  });
  test('Struct TYPEATTR is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<TYPEATTR>(), equals(96));
    } else {
      expect(sizeOf<TYPEATTR>(), equals(76));
    }
  });
  test('Struct UNSIGNED_RATIO is the right size', () {
    expect(sizeOf<UNSIGNED_RATIO>(), equals(8));
  });
  test('Struct UPDATELAYEREDWINDOWINFO is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<UPDATELAYEREDWINDOWINFO>(), equals(80));
    } else {
      expect(sizeOf<UPDATELAYEREDWINDOWINFO>(), equals(40));
    }
  });
  test('Struct VALENT is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<VALENT>(), equals(32));
    } else {
      expect(sizeOf<VALENT>(), equals(16));
    }
  });
  test('Struct VS_FIXEDFILEINFO is the right size', () {
    expect(sizeOf<VS_FIXEDFILEINFO>(), equals(52));
  });
  test('Struct WAVEFORMATEX is the right size', () {
    expect(sizeOf<WAVEFORMATEX>(), equals(18));
  });
  test('Struct WAVEHDR is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<WAVEHDR>(), equals(48));
    } else {
      expect(sizeOf<WAVEHDR>(), equals(32));
    }
  });
  test('Struct WAVEOUTCAPS is the right size', () {
    expect(sizeOf<WAVEOUTCAPS>(), equals(84));
  });
  test('Struct WIN32_FIND_DATA is the right size', () {
    expect(sizeOf<WIN32_FIND_DATA>(), equals(592));
  });
  test('Struct WINDOWINFO is the right size', () {
    expect(sizeOf<WINDOWINFO>(), equals(60));
  });
  test('Struct WINDOWPLACEMENT is the right size', () {
    expect(sizeOf<WINDOWPLACEMENT>(), equals(44));
  });
  test('Struct WLAN_ASSOCIATION_ATTRIBUTES is the right size', () {
    expect(sizeOf<WLAN_ASSOCIATION_ATTRIBUTES>(), equals(68));
  });
  test('Struct WLAN_AUTH_CIPHER_PAIR_LIST is the right size', () {
    expect(sizeOf<WLAN_AUTH_CIPHER_PAIR_LIST>(), equals(12));
  });
  test('Struct WLAN_AVAILABLE_NETWORK is the right size', () {
    expect(sizeOf<WLAN_AVAILABLE_NETWORK>(), equals(628));
  });
  test('Struct WLAN_AVAILABLE_NETWORK_LIST is the right size', () {
    expect(sizeOf<WLAN_AVAILABLE_NETWORK_LIST>(), equals(636));
  });
  test('Struct WLAN_BSS_ENTRY is the right size', () {
    expect(sizeOf<WLAN_BSS_ENTRY>(), equals(360));
  });
  test('Struct WLAN_BSS_LIST is the right size', () {
    expect(sizeOf<WLAN_BSS_LIST>(), equals(368));
  });
  test('Struct WLAN_CONNECTION_ATTRIBUTES is the right size', () {
    expect(sizeOf<WLAN_CONNECTION_ATTRIBUTES>(), equals(604));
  });
  test('Struct WLAN_CONNECTION_NOTIFICATION_DATA is the right size', () {
    expect(sizeOf<WLAN_CONNECTION_NOTIFICATION_DATA>(), equals(572));
  });
  test('Struct WLAN_CONNECTION_PARAMETERS is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<WLAN_CONNECTION_PARAMETERS>(), equals(40));
    } else {
      expect(sizeOf<WLAN_CONNECTION_PARAMETERS>(), equals(24));
    }
  });
  test('Struct WLAN_COUNTRY_OR_REGION_STRING_LIST is the right size', () {
    expect(sizeOf<WLAN_COUNTRY_OR_REGION_STRING_LIST>(), equals(8));
  });
  test('Struct WLAN_DEVICE_SERVICE_GUID_LIST is the right size', () {
    expect(sizeOf<WLAN_DEVICE_SERVICE_GUID_LIST>(), equals(24));
  });
  test('Struct WLAN_DEVICE_SERVICE_NOTIFICATION_DATA is the right size', () {
    expect(sizeOf<WLAN_DEVICE_SERVICE_NOTIFICATION_DATA>(), equals(28));
  });
  test('Struct WLAN_HOSTED_NETWORK_CONNECTION_SETTINGS is the right size', () {
    expect(sizeOf<WLAN_HOSTED_NETWORK_CONNECTION_SETTINGS>(), equals(40));
  });
  test('Struct WLAN_HOSTED_NETWORK_DATA_PEER_STATE_CHANGE is the right size',
      () {
    expect(sizeOf<WLAN_HOSTED_NETWORK_DATA_PEER_STATE_CHANGE>(), equals(28));
  });
  test('Struct WLAN_HOSTED_NETWORK_PEER_STATE is the right size', () {
    expect(sizeOf<WLAN_HOSTED_NETWORK_PEER_STATE>(), equals(12));
  });
  test('Struct WLAN_HOSTED_NETWORK_RADIO_STATE is the right size', () {
    expect(sizeOf<WLAN_HOSTED_NETWORK_RADIO_STATE>(), equals(8));
  });
  test('Struct WLAN_HOSTED_NETWORK_SECURITY_SETTINGS is the right size', () {
    expect(sizeOf<WLAN_HOSTED_NETWORK_SECURITY_SETTINGS>(), equals(8));
  });
  test('Struct WLAN_HOSTED_NETWORK_STATE_CHANGE is the right size', () {
    expect(sizeOf<WLAN_HOSTED_NETWORK_STATE_CHANGE>(), equals(12));
  });
  test('Struct WLAN_HOSTED_NETWORK_STATUS is the right size', () {
    expect(sizeOf<WLAN_HOSTED_NETWORK_STATUS>(), equals(52));
  });
  test('Struct WLAN_INTERFACE_CAPABILITY is the right size', () {
    expect(sizeOf<WLAN_INTERFACE_CAPABILITY>(), equals(276));
  });
  test('Struct WLAN_INTERFACE_INFO is the right size', () {
    expect(sizeOf<WLAN_INTERFACE_INFO>(), equals(532));
  });
  test('Struct WLAN_INTERFACE_INFO_LIST is the right size', () {
    expect(sizeOf<WLAN_INTERFACE_INFO_LIST>(), equals(540));
  });
  test('Struct WLAN_MAC_FRAME_STATISTICS is the right size', () {
    expect(sizeOf<WLAN_MAC_FRAME_STATISTICS>(), equals(96));
  });
  test('Struct WLAN_MSM_NOTIFICATION_DATA is the right size', () {
    expect(sizeOf<WLAN_MSM_NOTIFICATION_DATA>(), equals(580));
  });
  test('Struct WLAN_PHY_FRAME_STATISTICS is the right size', () {
    expect(sizeOf<WLAN_PHY_FRAME_STATISTICS>(), equals(144));
  });
  test('Struct WLAN_PHY_RADIO_STATE is the right size', () {
    expect(sizeOf<WLAN_PHY_RADIO_STATE>(), equals(12));
  });
  test('Struct WLAN_PROFILE_INFO is the right size', () {
    expect(sizeOf<WLAN_PROFILE_INFO>(), equals(516));
  });
  test('Struct WLAN_PROFILE_INFO_LIST is the right size', () {
    expect(sizeOf<WLAN_PROFILE_INFO_LIST>(), equals(524));
  });
  test('Struct WLAN_RADIO_STATE is the right size', () {
    expect(sizeOf<WLAN_RADIO_STATE>(), equals(772));
  });
  test('Struct WLAN_RATE_SET is the right size', () {
    expect(sizeOf<WLAN_RATE_SET>(), equals(256));
  });
  test('Struct WLAN_RAW_DATA is the right size', () {
    expect(sizeOf<WLAN_RAW_DATA>(), equals(8));
  });
  test('Struct WLAN_RAW_DATA_LIST is the right size', () {
    expect(sizeOf<WLAN_RAW_DATA_LIST>(), equals(16));
  });
  test('Struct WLAN_SECURITY_ATTRIBUTES is the right size', () {
    expect(sizeOf<WLAN_SECURITY_ATTRIBUTES>(), equals(16));
  });
  test('Struct WLAN_STATISTICS is the right size', () {
    expect(sizeOf<WLAN_STATISTICS>(), equals(368));
  });
  test('Struct WNDCLASS is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<WNDCLASS>(), equals(72));
    } else {
      expect(sizeOf<WNDCLASS>(), equals(40));
    }
  });
  test('Struct WNDCLASSEX is the right size', () {
    if (is64bitOS) {
      expect(sizeOf<WNDCLASSEX>(), equals(80));
    } else {
      expect(sizeOf<WNDCLASSEX>(), equals(48));
    }
  });
  test('Struct WTA_OPTIONS is the right size', () {
    expect(sizeOf<WTA_OPTIONS>(), equals(8));
  });
  test('Struct XFORM is the right size', () {
    expect(sizeOf<XFORM>(), equals(24));
  });
}

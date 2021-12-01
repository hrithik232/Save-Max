import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

class Dispatcher {
  final String progID;
  final IDispatch disp;

  late final Pointer<GUID> IID_NULL;

  Dispatcher(this.progID, this.disp) {
    IID_NULL = calloc<GUID>();
  }

  factory Dispatcher.fromProgID(String progID) {
    final ptrProgID = progID.toNativeUtf16();
    final clsid = calloc<GUID>();
    final pIID_IDispatch = calloc<GUID>()..ref.setGUID(IID_IDispatch);
    final ppv = calloc<COMObject>();

    try {
      var hr = CLSIDFromProgID(ptrProgID, clsid);
      if (FAILED(hr)) {
        throw WindowsException(hr);
      }

      hr = CoCreateInstance(
          clsid, nullptr, CLSCTX_INPROC_SERVER, pIID_IDispatch, ppv.cast());
      if (FAILED(hr)) {
        throw WindowsException(hr);
      }

      final iDispatch = IDispatch(ppv);

      return Dispatcher(progID, iDispatch);
    } finally {
      free(ptrProgID);
      free(clsid);
      free(pIID_IDispatch);
    }
  }

  int getDispId(String member) {
    final ptNameFunc = member.toNativeUtf16();
    final ptName = calloc<Pointer<Utf16>>()..value = ptNameFunc;
    final dispid = calloc<Int32>();

    try {
      final hr = disp.GetIDsOfNames(
          IID_NULL, ptName.cast(), 1, LOCALE_USER_DEFAULT, dispid);
      if (FAILED(hr)) {
        throw WindowsException(hr);
      } else {
        return dispid.value;
      }
    } finally {
      free(ptNameFunc);
      free(ptName);
      free(dispid);
    }
  }

  int get typeInfoCount {
    final count = calloc<Uint32>();

    try {
      final hr = disp.GetTypeInfoCount(count);
      if (SUCCEEDED(hr)) {
        return count.value;
      } else {
        throw WindowsException(hr);
      }
    } finally {
      free(count);
    }
  }

  void invokeMethod(int dispid, {Pointer<DISPPARAMS>? params}) {
    Pointer<DISPPARAMS> args;
    if (params == null) {
      args = calloc<DISPPARAMS>();
    } else {
      args = params;
    }

    try {
      final hr = disp.Invoke(dispid, IID_NULL, LOCALE_SYSTEM_DEFAULT,
          DISPATCH_METHOD, args, nullptr, nullptr, nullptr);
      if (FAILED(hr)) {
        throw WindowsException(hr);
      } else {
        return;
      }
    } finally {
      if (params == null) {
        free(args);
      }
    }
  }

  void dispose() {
    free(disp.ptr);
    free(IID_NULL);
  }
}

void main() {
  final hr = OleInitialize(nullptr);

  if (FAILED(hr)) {
    print('Failed at OleInitialize.');
    throw WindowsException(hr);
  }

  final dispatcher = Dispatcher.fromProgID('Shell.Application');
  final dispid = dispatcher.getDispId('MinimizeAll');

  dispatcher.invokeMethod(dispid);

  dispatcher.dispose();
  OleUninitialize();
}

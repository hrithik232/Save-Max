## 1.7.4+1

- Fix broken links as a result of renaming default branch from master -> main

## 1.7.4

- Add SysAllocString, SysFreeString, SysStringByteLen, SysStringLen,
  SHCreateItemFromParsingName
- Rename VARIANT_POINTER to VARIANT

## 1.7.3

- Expand Win32 API documentation.
- New APIs:
  - User32: ClipCursor, CopyIcon, DestroyIcon, DrawIcon, GetCursor,
    GetCursorPos, GetSystemMenu, SetMenuInfo, SetMenuItemInfo, ShowCursor

## 1.7.2

- Add Win32 API documentation and a couple of minor APIs.

## 1.7.1

- Add version information APIs and example.

## 1.7.0

- Changed how the C-style APIs are generated. This should result in far better
  code smarts in your editor, as well as major improvements to the
  auto-generated documentation.
- Added many new APIs, including GetCurrentProcess and GetModuleFileName

## 1.6.10

- New APIs
  - Shell: LockWorkstation, SHEmptyRecycleBin, SHGetDiskFreeSpaceEx,
    SHGetDriveMedia, SHQueryRecycleBin, InitCommonControlsEx, DrawStatusText
  - Add high-precision timing APIs: QueryPerformanceFrequency,
    QueryPerformanceCounter
  - User32: SetParent, CreateWindow macro, MonitorFromPoint, SetWindowsLongPtr
  - Kernel: Add SystemParametersInfo and related constants
  - Kernel: Add EnumProcessModulesEx (thanks @Hexer10)
- Samples
  - Add example of using app manifests to declare support for UAC permissions
    and Windows 10 opt-in behavior
- Windows Runtime metadata
  - Greatly expand WinMD utility to generate APIs directly from Windows Metadata
  - Autogenerate all Windows Runtime classes except ICalendar and
    IFileOpenPicker from metadata
- Code tidy up
  - Add more tests
  - Go through all the code with a stricter linter
  - Update README with screenshots and examples
  - Update Flutter Windows examples to the v4 template

## 1.6.9

- Add credential management APIs (thanks @hpoul)
- Add battery and power management APIs
- Overhaul HRESULTs and add more tests

## 1.6.8

- Add font enumeration example
- Experiment with hosting documentation on GitHub

## 1.6.7

- Add basic registry checks
- Add initial Bluetooth discovery support
- Add a system information sample
- Guard tests so that they work on Windows 7
- Add some shell APIs and more tests

## 1.6.6

- Add more process management APIs
- Add high level monitor configuration API

## 1.6.5

- Add a broader array of console APIs
- Add a wallpaper example

## 1.6.4

- Lots of documentation and linter cleanup

## 1.6.3

- Add TaskDialog and dynamic library loading APIs
- Add dynamic load and Windows Runtime metadata samples
- Fix an annoying bug with `WindowsDeleteString` usage
- Add more tests and restructure code
- More library-level documentation
- Add script for generating classes

## 1.6.2

- Clean up some of the generated documentation

## 1.6.1

- Lots of minor refactoring and tidy up
- Some early WinMD parsing
- Add many more unit tests

## 1.6.0

- Add WinRT examples, including Windows.Globalization.Calendar and
  Windows.Storage.Pickers.FileOpenPicker
- Add various process management and kernel APIs: CloseHandle, EnumProcesses,
  EnumProcessModules, GetModuleBaseName, GetModuleFileNameExt, OpenProcess,
  ReadProcessMemory and WriteProcessMemory.
- Add modules.dart sample
- Lots of refactoring and tidy up work.

## 1.5.1

- Add GetTempPath()

## 1.5.0

- Use automated Dart tool to generate all COM classes
- Add IFileDialogCustomize, IShellItem2, IShellItemArray, IShellItemFilter
- Fill out all the class methods
- Fix some embarrassing bugs

## 1.4.2

- Fix a few bugs
- Add support for desktop background management with IDesktopWallpaper

## 1.4.1

- Expand COM support to include IShellItemArray and various WMI classes

## 1.4.0

- Add COM support
- Add implementations for IOpenFileDialog, IFileDialog, IModalWindow,
 IShellItem, IUnknown
- Add common item dialog example

## 1.3.2

- Add Snake GDI example
- Add PeekMessage, MoveTo, VirtualAlloc/Free, StretchDibBits, Beep
- Tidy up code and test

## 1.3.1

- Add RegisterWindowMessage
- Fix bugs in ACCEL and FINDREPLACE structs
- Fix various bugs in Notepad example

## 1.3.0

- Add notepad example
- Add 20+ new APIs for common dialogs, message sending, accelerators,
  menus, fonts and GDI object manipulation
- Fix APIs to be 32-bit safe
- Fix some minor bugs

## 1.2.6

- Add window enumeration (FindWindowEx, EnumWindows, IsWindowVisible,
  GetWindowText, GetWindowTextLength) and example

## 1.2.5

- Added Flutter example
- Added common dialog example

## 1.2.4

- Added volume management APIs

## 1.2.3

- Add scrolling APIs and example
- Add 'new' known folder API
- Add some basic unit tests

## 1.2.2

- Add known folder plus GUID classes

## 1.2.1

- Added SendInput, Sleep and ShellExecute

## 1.2.0

- Implemented a good sample of GDI calls
- Added support for timers
- Added virtual keyboard constants
- Added a GDI paint sample
- Added a more comprehensive sample game (Tetris)

## 1.1.1

- Add class styles
- Match recommended package structure per pub.dev

## 1.1.0

- Added MessageBox and console APIs

## 1.0.0

- Initial version

// Copyright 2017 Google Inc. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import '../../common/request.dart';
import '../../common/webdriver_handler.dart';
import 'utils.dart';

class W3cAlertHandler implements AlertHandler {
  @override
  WebDriverRequest buildGetTextRequest() =>
      WebDriverRequest.getRequest('alert/text');

  @override
  String parseGetTextResponse(WebDriverResponse response) =>
      parseW3cResponse(response) as String;

  @override
  WebDriverRequest buildAcceptRequest() =>
      WebDriverRequest.postRequest('alert/accept');

  @override
  void parseAcceptResponse(WebDriverResponse response) {
    parseW3cResponse(response);
  }

  @override
  WebDriverRequest buildDismissRequest() =>
      WebDriverRequest.postRequest('alert/dismiss');

  @override
  void parseDismissResponse(WebDriverResponse response) {
    parseW3cResponse(response);
  }

  // This does NOT match the W3C spec, which specifies 'value' not 'text'.
  // But this is what geckodriver uses.
  @override
  WebDriverRequest buildSendTextRequest(String keysToSend) =>
      WebDriverRequest.postRequest('alert/text', {'text': keysToSend});

  @override
  void parseSendTextResponse(WebDriverResponse response) {
    parseW3cResponse(response);
  }
}

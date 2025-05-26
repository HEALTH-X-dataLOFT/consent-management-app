/// Copyright 2025 HEALTH-X dataLOFT
///
/// Licensed under the European Union Public Licence, Version 1.2 (the
/// "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
///     https://eupl.eu/1.2/en/
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
package org.healthx.awaplugin;

import androidx.annotation.StringDef;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class AppConstants {
    public static final String CHANNEL = "org.awa_plugin/idScan";
    public static final String ERROR = "ERROR";
    public static final String ERROR_MESSAGE_IN_PROGRESS = "A scan is already in progress";
    public static final String ERROR_MESSAGE_ID = "Failed to set id";
    public static final String ERROR_AUTH = "Auth Error";
    public static final String ERROR_MESSAGE_PERSONAL_DATA = "Failed to set personal data";
    public static final String TOKEN_URL = "https://test.de";
    public static final String TAG = "AWAPlugin";

    @StringDef({
            Method.START_ID_SCAN,
            Method.SEND_PIN,
            Method.SEND_KVNR,
            Method.SET_ID,
            Method.SET_URL,
            Method.SET_PERSONAL_DATA,
            Method.SEND_ONBOARDER_URL,
    })
    @Retention(RetentionPolicy.SOURCE)
    public @interface Method {
        String START_ID_SCAN = "startIdScan";
        String SEND_PIN = "sendPin";
        String SEND_KVNR = "sendKvnr";
        String SEND_ONBOARDER_URL = "sendOnboarderUrl";
        String SET_ID = "setId";
        String SET_URL = "setUrl";
        String SET_PERSONAL_DATA = "setPersonalData";
    }
}

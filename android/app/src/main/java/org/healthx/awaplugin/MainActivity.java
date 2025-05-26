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

import android.app.ActivityManager;
import android.os.Bundle;
import android.os.RemoteException;
import android.util.Log;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.embedding.android.FlutterFragmentActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import org.healthx.awaplugin.awa.*;

import java.util.Objects;
import android.content.Intent;
import android.provider.Settings;

///local_auth package requires the use of a FragmentActivity instead of an Activity
public class MainActivity extends FlutterFragmentActivity {

    private static final String CHANNEL_BIOMETRIC = "biometric/settings";
    private static final String CHANNEL = "org.plugin_example/idScan";
    private static final String METHOD_START_ID_SCAN = "startIdScan";
    private static final String METHOD_SET_ID = "setId";
    private static final String METHOD_SET_URL = "setUrl";
    private static final String METHOD_SET_PERSONAL_DATA = "setPersonalData";
    private static final String ERROR = "ERROR";
    private static final String ERROR_MESSAGE_IN_PROGRESS = "A scan is already in progress";
    private static final String ERROR_MESSAGE_ID = "Failed to set id";
    private static final String ERROR_AUTH = "Auth Error";
    private static final String ERROR_PERSONAL_DATA = "Error while saving personal data";
    private static final String ERROR_MESSAGE_PERSONAL_DATA = "Failed to set personal data";
    private static final String ENTER_PIN = "Enter PIN";
    private static final String METHOD_OPEN_BIOMETRIC_SETTINGS = "openBiometricSettings";

    private static final String TOKEN_URL = "https://test.governikus-eid.de/AusweisAuskunft/WebServiceRequesterServlet";

    private static final String TAG = "MainActivity";
    public static String CurrentId = null;
    public static String testURL = null;
    public static String CurrentPersonalData = "Empty";
    public static String kvnr = null;
    public static String onboarderUrl = null;
    public AusweisAppConnector Connector;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), AppConstants.CHANNEL)
                .setMethodCallHandler(this::handleMethodCall);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL_BIOMETRIC)
                .setMethodCallHandler(this::handleBiometricCall);
    }
    private void handleBiometricCall(MethodCall call, MethodChannel.Result result) {
        if (call.method.equals(METHOD_OPEN_BIOMETRIC_SETTINGS)) {
            openBiometricSettings();
            result.success("Opened Biometric Settings");
        } else {
            result.notImplemented();
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        if (AusweisAppConnector.isAA2Process((ActivityManager) getSystemService(ACTIVITY_SERVICE))) {
            Log.i(AppConstants.TAG, "connector creation failed");
            return;
        }

        Connector = new AusweisAppConnector(
                this,
                getApplicationContext(),
                AppConstants.TOKEN_URL
        );
    }

    /**
     * Handles method calls from Flutter.
     */
    private void handleMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        Log.d(AppConstants.TAG, "Handle Methodcall " + call.method);

        try {
            String method = getMethodByName(call.method);
            if (method == null) {
                Log.d(AppConstants.TAG, "Unknown method " + call.method);
                result.notImplemented();
                return;
            }

            switch (method) {
                case AppConstants.Method.START_ID_SCAN:
                    startIdScan(result);
                    break;
                case AppConstants.Method.SET_ID:
                    setId(result);
                    break;
                case AppConstants.Method.SET_URL:
                    setURL(result);
                    break;
                case AppConstants.Method.SET_PERSONAL_DATA:
                    setPersonalData(result);
                    break;
                case AppConstants.Method.SEND_PIN:
                    String pin = (String) call.arguments;
                    setPin(pin, result);
                    break;
                case AppConstants.Method.SEND_KVNR:
                    String kvnr = (String) call.arguments;
                    setKvnr(kvnr);
                    break;
                case AppConstants.Method.SEND_ONBOARDER_URL:
                    String onboarderUrl = (String) call.arguments;
                    setOnboarderUrl(onboarderUrl);
                    break;
                default:
                    Log.d(AppConstants.TAG, "Case " + call.method);
                    result.notImplemented();
                    break;
            }
        } catch (IllegalArgumentException e) {
            Log.d(AppConstants.TAG, "Unknown method " + call.method);
            result.notImplemented();
        }
    }

    @Nullable
    private String getMethodByName(String methodName) {
        switch (methodName) {
            case AppConstants.Method.START_ID_SCAN:
            case AppConstants.Method.SEND_PIN:
            case AppConstants.Method.SEND_KVNR:
            case AppConstants.Method.SET_ID:
            case AppConstants.Method.SET_URL:
            case AppConstants.Method.SET_PERSONAL_DATA:
            case AppConstants.Method.SEND_ONBOARDER_URL:
                return methodName;
            default:
                return null;
        }
    }

    /**
     * Sets the current ID.
     */
    private void setId(MethodChannel.Result result) {
        result.success(CurrentId != null ? CurrentId : AppConstants.ERROR_MESSAGE_ID);
    }

    /**
     * Sets the current URL.
     */
    private void setURL(MethodChannel.Result result) {
        result.success(testURL != null ? testURL : AppConstants.ERROR_MESSAGE_ID);
    }

    /**
     * Sets the current personal data.
     */
    private void setPersonalData(MethodChannel.Result result) {
        result.success(CurrentPersonalData != null ? CurrentPersonalData : AppConstants.ERROR_MESSAGE_PERSONAL_DATA);
    }

    /**
     * Sets the PIN.
     */
    private void setPin(String pin, MethodChannel.Result result) {
        try {
            Connector.setPIN(pin);
            Log.d(AppConstants.TAG, "PIN successfully set in Java");
            result.success("PIN received in Java");
        } catch (SDKNotInitializedException | SDKSendException | RemoteException e) {
            Log.e(AppConstants.TAG, "Can't send PIN", e);
            result.error(AppConstants.ERROR, "Can't send PIN", e.getMessage());
        }
    }

    /**
     * Sets the KVNR.
     */
    private void setKvnr(String kvnr) {
        MainActivity.kvnr = kvnr;
    }

    /**
     * Sets the Onboarder Url.
     */
    private void setOnboarderUrl(String onboarderUrl) {
        MainActivity.onboarderUrl = onboarderUrl;
    }

    /**
     * Starts the ID scan process.
     */
    private void startIdScan(MethodChannel.Result result) {
        Log.e(AppConstants.TAG, "Start id Scan");
        Connector.setMessagingCallback(new MessagingCallback() {
            @Override
            public void writeMessage(String string) {
                handleWriteMessage(string);
            }

            @Override
            public void authSuccessful(OnboarderResponse resp) {
                handleAuthSuccessful(resp);
            }

            @Override
            public void error(String msg) {
                handleError(msg, result);
            }
        });
        try {
            Connector.runAuth();
        } catch (RemoteException | SDKNotInitializedException | SDKSendException | SDKUnexpectedResponseException e) {
            handleError(e.getMessage(), result);
            Log.e(AppConstants.TAG, "Error during authentication", e);
        }
    }

    /**
     * Handles messages from the connector.
     */
    private void handleWriteMessage(String message) {
        if (message.equals("Enter PIN")) {
            runOnUiThread(() -> new MethodChannel(
                    Objects.requireNonNull(getFlutterEngine()).getDartExecutor().getBinaryMessenger(),
                    AppConstants.CHANNEL
            ).invokeMethod("onPinRequested", null));
        }

        runOnUiThread(() -> new MethodChannel(
                Objects.requireNonNull(getFlutterEngine()).getDartExecutor().getBinaryMessenger(),
                AppConstants.CHANNEL
        ).invokeMethod("onWriteMessage", message));
    }

    /**
     * Handles successful authentication.
     */
    private void handleAuthSuccessful(OnboarderResponse resp) {
        runOnUiThread(() -> {
            String authResult = String.format("username: %s password: %s", resp.username, resp.password);
            new MethodChannel(Objects.requireNonNull(getFlutterEngine()).getDartExecutor().getBinaryMessenger(), AppConstants.CHANNEL)
                    .invokeMethod("onAuthSuccessful", authResult);
        });
    }

    /**
     * Handles errors from the connector.
     */
    private void handleError(String msg, MethodChannel.Result result) {
        runOnUiThread(() -> {
            result.error(AppConstants.ERROR_AUTH, msg, null);
            String authResult = "Authentication Failed";
            new MethodChannel(Objects.requireNonNull(getFlutterEngine()).getDartExecutor().getBinaryMessenger(), AppConstants.CHANNEL)
                    .invokeMethod("onAuthError", authResult);
        });
    }

    private void openBiometricSettings() {
        Intent intent = new Intent(android.provider.Settings.ACTION_SECURITY_SETTINGS);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        startActivity(intent);
    }

    @Override
    protected void onResume() {
        super.onResume();
        if (Connector != null) {
            Connector.onResume();
        }
    }

    @Override
    protected void onPause() {
        super.onPause();
        if (Connector != null) {
            Connector.onPause();
        }
    }
}

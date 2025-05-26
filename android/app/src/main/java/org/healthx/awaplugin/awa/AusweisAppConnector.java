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
package org.healthx.awaplugin.awa;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.nfc.NfcAdapter;
import android.nfc.Tag;
import android.os.Build;
import android.os.RemoteException;
import android.util.Log;
import com.governikus.ausweisapp2.IAusweisApp2Sdk;

public class AusweisAppConnector {
    private String TAG = "AusweisAppConnector";
    private static final String AA2_PROCESS = "ausweisapp2_service";
    private ServiceConnection serviceConnection;
    private AusweisAppCallback callback;
    private String tcTokenURL;
    public AAConnection connection;
    private ForegroundDispatcher fgd;


    public AusweisAppConnector(Activity activity, Context context, String tcTokenURL) {
        callback = new AusweisAppCallback(
                new AuthCallbacks(
                        new MessagingCallback() {
                            @Override
                            public void writeMessage(String string) {
                                Log.i("MSGCALLBACK", string);
                            }

                            @Override
                            public void authSuccessful(OnboarderResponse resp) {
                                Log.i("MSGCALLBACK", "Got response");
                            }

                            @Override
                            public void error(String string) {
                                Log.i("MSGCALLBACK", string);
                            }
                        }, new CommandCallback() {
                    @Override
                    public void sendCommand(AusweisAppCommand cmd) throws SDKNotInitializedException, SDKSendException, RemoteException {
                        sendAACommand(cmd);
                    }
                }));
        connection = new AAConnection(callback);
        fgd = new ForegroundDispatcher(activity, this);

        Log.i(TAG, "Initialising AusweisApp sdk");
        String pkg = context.getPackageName();
        String name = "com.governikus.ausweisapp2.START_SERVICE";
        Intent serviceIntent = new Intent(name);
        serviceIntent.setPackage(pkg);
        context.bindService(serviceIntent, connection, Context.BIND_AUTO_CREATE);
        this.tcTokenURL = tcTokenURL;
    }

    public static boolean isAA2Process(ActivityManager manager) {
        if (Build.VERSION.SDK_INT >= 28) {
            return Application.getProcessName().endsWith(AA2_PROCESS);
        }

        final int pid = android.os.Process.myPid();
        for (ActivityManager.RunningAppProcessInfo appProcess : manager.getRunningAppProcesses()) {
            if (appProcess.pid == pid) {
                return appProcess.processName.endsWith(AA2_PROCESS);
            }
        }
        return false;
    }

    public void setMessagingCallback(MessagingCallback mcb) {
        callback.setMcb(mcb);
    }

    public void getInfo() throws RemoteException, SDKNotInitializedException, SDKSendException {
        Log.i(TAG, "Getting info from SDK");
        this.sendAACommand(new AusweisAppCommand("GET_INFO"));
    }

    public void runAuth()
            throws RemoteException, SDKNotInitializedException, SDKSendException, SDKUnexpectedResponseException {
        AusweisAppCommand cmd = new AusweisAppCommand("RUN_AUTH");
        Log.i(TAG, "Starting auth");
        cmd.tcTokenURL = tcTokenURL;
        this.sendAACommand(cmd);
    }

    public void setPIN(String pin) throws SDKNotInitializedException, SDKSendException, RemoteException {
        AusweisAppCommand cmd = new AusweisAppCommand("SET_PIN");
        cmd.value = pin;
        sendAACommand(cmd);
    }

    private void sendAACommand(AusweisAppCommand cmd) throws SDKNotInitializedException, SDKSendException, RemoteException {
        IAusweisApp2Sdk sdk = connection.getSdk();
        Log.d(TAG, "Sending the SDK the following JSON " + cmd.toJSON());
        if (!sdk.send(callback.sessionID, cmd.toJSON())) {
            Log.e(TAG, "Can't get info from SDK");
            throw new SDKSendException();
        }
    }


    public void handleIntent(Intent intent) throws SDKNotInitializedException, RemoteException {
        final Tag tag = intent.getParcelableExtra(NfcAdapter.EXTRA_TAG);
        if (tag == null) {
            return;
        }

        updateNFCTag(tag);
    }
    public void updateNFCTag(Tag tag) throws SDKNotInitializedException, RemoteException {
        IAusweisApp2Sdk sdk = connection.getSdk();
        sdk.updateNfcTag(callback.sessionID, tag);
        Log.i(TAG, "NFC tag updated");
    }

    public void onResume() {
        fgd.enable();
    }

    public void onPause() {
        fgd.disable();
    }
}

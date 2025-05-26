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

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import com.governikus.ausweisapp2.IAusweisApp2Sdk;

public class AAConnection implements ServiceConnection {
    private static final String TAG = "AAConnection";

    private IAusweisApp2Sdk sdk;
    private AusweisAppCallback callback;

    public AAConnection(AusweisAppCallback callback) {
        this.callback = callback;
    }

    @Override
    public void onServiceConnected(ComponentName name, IBinder service) {
        Log.i(TAG, "Initialising SDK");
        try {
            sdk = IAusweisApp2Sdk.Stub.asInterface(service);
        } catch (ClassCastException e) {
            Log.e(TAG, "Couldn't connect to SDK", e);
        }

        try {
            if(!sdk.connectSdk(callback)) {
                Log.e(TAG, "Could not connect SDK to callback");
            }
        } catch (RemoteException e) {
            Log.e(TAG, "Could not connect SDK to callback, remote error", e);
        }
        Log.i(TAG, "SDK intiialised" + sdk);
    }

    @Override
    public void onServiceDisconnected(ComponentName name) {
        sdk = null;
    }

    public IAusweisApp2Sdk getSdk() throws SDKNotInitializedException {
        if (sdk == null) {
            throw new SDKNotInitializedException();
        }
        return sdk;
    }
}

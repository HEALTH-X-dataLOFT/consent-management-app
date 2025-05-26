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

import android.annotation.SuppressLint;
import android.os.RemoteException;
import android.util.Log;
import java.io.IOException;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import org.healthx.awaplugin.MainActivity;

public class AuthCallbacks implements AusweisAppProtocolCallbacks {
    private static final String TAG = "AUTHCALLBACKS";
    private MessagingCallback mcb;
    private CommandCallback ccb;
    private OkHttpClient client = new OkHttpClient();


    public AuthCallbacks(MessagingCallback mcb, CommandCallback ccb) {
        this.mcb = mcb;
        this.ccb = ccb;
    }

    public void setMcb(MessagingCallback mcb) {
        this.mcb = mcb;
    }

    @Override
    public void accessRights(AusweisAppMessage msg) {
        Log.i(TAG, "ACCESS_RIGHTS msg received");
        try {
            this.ccb.sendCommand(new AusweisAppCommand("ACCEPT"));
        } catch (SDKNotInitializedException | SDKSendException | RemoteException e) {
            Log.e(TAG, "Received error while sending ACCEPT", e);
        }
    }

    @Override
    public void apiLevel(AusweisAppMessage msg) {
        Log.i(TAG, "API_LEVEL msg received");
    }

    @SuppressLint("DefaultLocale")
    @Override
    public void auth(AusweisAppMessage msg) {
        Log.i(TAG, "AUTH msg received " + msg.url);
        if (msg.result == null) {
            return;
        }
        if (msg.result.major.contains("#ok"))  {
            String url = MainActivity.onboarderUrl;
            OnboarderRequest obr = new OnboarderRequest(MainActivity.kvnr, msg.url);
            String idResponse = null;
            RequestBody body = RequestBody.create(obr.toJSON(), MediaType.get("application/json"));
            Request request = new Request.Builder().url(url).post(body).build();
            try (Response response = client.newCall(request).execute()) {
                if (response.code() != 200) {
                    mcb.error(String.format("Couldn't get eID data from server, status code %d", response.code()));
                    return;
                }
                if (response.body() == null) {
                    mcb.error("Response body is null");
                    return;
                }
                idResponse = response.body().string();
            } catch (IOException e) {
                Log.e(TAG, "IO exception", e);
                mcb.error("Got an IO exception");
            }
            OnboarderResponse obresp  = OnboarderResponse.fromJSON(idResponse);
            mcb.authSuccessful(obresp);
            return;
        }

        mcb.error("Invalid result: " + msg.result.major);
    }

    @Override
    public void badState(AusweisAppMessage msg) {
        Log.i(TAG, "BAD_STATE msg received");
        mcb.error(String.format("Error type: %s, message: %s", msg.msg, msg.error));
    }

    @Override
    public void certificate(AusweisAppMessage msg) {
        Log.i(TAG, "CERTIFICATE msg received");
    }

    @Override
    public void changePin(AusweisAppMessage msg) {
        Log.i(TAG, "CHANGE_PIN msg received");
    }

    @Override
    public void enterCan(AusweisAppMessage msg) {
        Log.i(TAG, "ENTER_CAN msg received");

    }

    @Override
    public void enterPin(AusweisAppMessage msg) {
        Log.i(TAG, "ENTER_PIN msg received");
        mcb.writeMessage("Enter PIN");
    }

    @Override
    public void enterNewPin(AusweisAppMessage msg) {
        Log.i(TAG, "ENTER_NEW_PIN msg received");

    }

    @Override
    public void enterPuk(AusweisAppMessage msg) {
        Log.i(TAG, "ENTER_PUK msg received");

    }

    @Override
    public void info(AusweisAppMessage msg) {
        Log.i(TAG, "INFO msg received");

    }

    @Override
    public void insertCard(AusweisAppMessage msg) {
        Log.i(TAG, "INSERT_CARD msg received");
        mcb.writeMessage("Please insert card");
    }

    @Override
    public void internalError(AusweisAppMessage msg) {
        Log.i(TAG, "INTERNAL_ERROR msg received");
        mcb.error("Internal error received: " + msg.error);
    }

    @Override
    public void invalid(AusweisAppMessage msg) {
        Log.i(TAG, "INVALID msg received");
        mcb.error("Invalid JSON received: " + msg.error);
    }

    @Override
    public void reader(AusweisAppMessage msg) {
        Log.i(TAG, "READER msg received");

    }

    @Override
    public void readerList(AusweisAppMessage msg) {
        Log.i(TAG, "READER_LIST msg received");

    }

    @Override
    public void status(AusweisAppMessage msg) {
        Log.i(TAG, "STATUS msg received");
    }

    @Override
    public void unknownCommand(AusweisAppMessage msg) {
        Log.i(TAG, "UNKNOWN_COMMAND msg received");
    }
}

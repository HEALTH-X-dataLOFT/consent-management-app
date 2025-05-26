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

import android.os.RemoteException;
import android.util.Log;
import com.governikus.ausweisapp2.IAusweisApp2SdkCallback;

import java.util.ArrayList;

public class AusweisAppCallback extends IAusweisApp2SdkCallback.Stub {
    public String sessionID = null;
    private static final String TAG = "AusweisAppCallback";
    private ArrayList<AusweisAppMessage> messages = new ArrayList<AusweisAppMessage>();
    public AusweisAppMessage status = new AusweisAppMessage();
    private AusweisAppProtocolCallbacks tcb;

    public AusweisAppCallback(AusweisAppProtocolCallbacks tcb) {
        this.tcb = tcb;
    };

    public void setMcb(MessagingCallback mcb) {
        tcb.setMcb(mcb);
    }
    @Override
    public void sessionIdGenerated(String s, boolean b) throws RemoteException {
        Log.i(TAG, "Received session ID: " + s);
        this.sessionID = s;
    }

    @Override
    public void receive(String s) throws RemoteException {
        Log.i(TAG, "Got message: " + s);
        AusweisAppMessage m = AusweisAppMessage.fromJSON(s);

        this.delegateMessage(m);
    }

    private void delegateMessage(AusweisAppMessage m) {
        switch (m.msg) {
            case "ACCESS_RIGHTS": tcb.accessRights(m);
                break;
            case "API_LEVEL": tcb.apiLevel(m);
                break;
            case "AUTH": tcb.auth(m);
                break;
            case "BAD_STATE": tcb.badState(m);
                break;
            case "CERTIFICATE": tcb.certificate(m);
                break;
            case "CHANGE_PIN": tcb.changePin(m);
                break;
            case "ENTER_CAN": tcb.enterCan(m);
                break;
            case "ENTER_PIN": tcb.enterPin(m);
                break;
            case "ENTER_NEW_PIN": tcb.enterNewPin(m);
                break;
            case "ENTER_PUK": tcb.enterPuk(m);
                break;
            case "INFO": tcb.info(m);
                break;
            case "INSERT_CARD": tcb.insertCard(m);
                break;
            case "INTERNAL_ERROR": tcb.internalError(m);
                break;
            case "INVALID": tcb.invalid(m);
                break;
            case "READER": tcb.reader(m);
                break;
            case "READER_LIST": tcb.readerList(m);
                break;
            case "STATUS": tcb.status(m);
                break;
            case "UNKNOWN_COMMAND": tcb.unknownCommand(m);
                break;
        }
    }

    @Override
    public void sdkDisconnected() throws RemoteException {
        // handle SDK dc
    }
}

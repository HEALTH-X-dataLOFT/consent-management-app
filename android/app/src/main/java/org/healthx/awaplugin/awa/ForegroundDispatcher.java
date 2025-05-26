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
import android.nfc.NfcAdapter;
import android.nfc.Tag;
import android.nfc.tech.IsoDep;
import android.os.RemoteException;
import android.util.Log;

import java.util.Arrays;

public class ForegroundDispatcher {
    private static final String TAG = "ForegroundDispatcher";

    private final Activity activity;
    private final NfcAdapter adapter;
    private final int flags;
    private final NfcAdapter.ReaderCallback readerCallback;

    public ForegroundDispatcher(Activity activity, AusweisAppConnector connector) {
        this.activity = activity;
        adapter = NfcAdapter.getDefaultAdapter(this.activity);
        flags = NfcAdapter.FLAG_READER_NFC_A | NfcAdapter.FLAG_READER_NFC_B | NfcAdapter.FLAG_READER_SKIP_NDEF_CHECK;
        readerCallback = new NfcAdapter.ReaderCallback() {
            @Override
            public void onTagDiscovered(Tag tag) {
                Log.i(TAG, "Discovered NFC tag");
                if (Arrays.asList(tag.getTechList()).contains(IsoDep.class.getName())) {
                    if (tag != null) {
                        try {
                            Log.i(TAG, "Updating tag");
                            connector.updateNFCTag(tag);
                        } catch (SDKNotInitializedException | RemoteException e) {
                            Log.e(TAG, "Failed to update NFC tag", e);
                        }
                    }
                }
            }
        };
    }

    public void enable() {
        if(adapter != null) {
            adapter.enableReaderMode(activity, readerCallback, flags, null);
        }
    }

    public void disable() {
        if(adapter != null) {
            adapter.disableReaderMode(activity);
        }
    }
}

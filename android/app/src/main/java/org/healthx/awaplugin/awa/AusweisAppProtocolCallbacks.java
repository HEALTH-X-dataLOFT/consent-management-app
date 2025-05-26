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

public interface AusweisAppProtocolCallbacks {
    public void setMcb(MessagingCallback mcb);
    public void accessRights(AusweisAppMessage msg);
    public void apiLevel(AusweisAppMessage msg);
    public void auth(AusweisAppMessage msg);
    public void badState(AusweisAppMessage msg);
    public void certificate(AusweisAppMessage msg);
    public void changePin(AusweisAppMessage msg);
    public void enterCan(AusweisAppMessage msg);
    public void enterPin(AusweisAppMessage msg);
    public void enterNewPin(AusweisAppMessage msg);
    public void enterPuk(AusweisAppMessage msg);
    public void info(AusweisAppMessage msg);
    public void insertCard(AusweisAppMessage msg);
    public void internalError(AusweisAppMessage msg);
    public void invalid(AusweisAppMessage msg);
    public void reader(AusweisAppMessage msg);
    public void readerList(AusweisAppMessage msg);
    public void status(AusweisAppMessage msg);
    public void unknownCommand(AusweisAppMessage msg);
}

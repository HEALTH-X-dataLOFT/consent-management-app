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

import com.google.gson.Gson;

public class OnboarderResponse {
    public String username;
    public String password;

    public static OnboarderResponse fromJSON(String json) {
        Gson gson = new Gson();
        return gson.fromJson(json, OnboarderResponse.class);
    }
}

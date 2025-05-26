# Consent Management App

The Consent Management App is intended to be a mobile application that allows users to manage their personal healthcare data. The app is available for Android and iOS, and it has a backend that communicates with the Health-X dataspace.

For more details on the functionality and motivation behind the project, please read the [project page](https://www.health-x.org/home).

## Prerequisites

If you're new to Flutter the first thing you'll need is to follow the [setup instructions](https://docs.flutter.dev/get-started/install)  

Once Flutter is setup, you need access to an instance of the [CMA Backend](https://github.com/HEALTH-X-dataLOFT/cma-backend) and a OIDC provider to use the features of this application. 

> **Note:**
> When running or building the app, you must specify which hosts to talk to. This is done by adding the `BASE_PATH`, `OIDC_ISSUER` and `OIDC_CLIENT` [compilation environment declaration](https://dart.dev/guides/environment-declarations), which is picked up by the application. For the purpose of demonstration we use http://development.host.local:1234, http://oidc.host.local:1234 and CMA.

## Installing

1. Clone the repository to your local machine:
   ```bash
   git clone git@https://github.com/HEALTH-X-dataLOFT/consent-management-app.git
   ```

2. Navigate to the project directory:
   ```bash
   cd consent-management-app
   ```
3. Download image_magick_q16 package:

   Download from GitHub [image_magick_q16](https://github.com/Haidar0096/image_magick_q16) package and put in a vendor/im folder
   ```
   git clone git@github.com:Haidar0096/image_magick_q16.git vendor/im
   flutter pub get --directory vendor/im
   ```   
   
4. Install dependencies:
   ```bash
   flutter pub get
   ```

## Usage

The application can be started either via the cli or directly in the IDE. For more information about  target devices and simulators for Android or iOS please read the [Get started guide](https://docs.flutter.dev/get-started/test-drive).

### Run in CLI

```bash
flutter run \
  --dart-define="BASE_PATH=http://development.host.local:1234"
```

### Run in vscode

In vscode you need to add configuration to your `launch.json`.

```json
{

    "version": "0.2.0",
    "configurations": [
        {
            "name": "consent-management-app",
            "request": "launch",
            "type": "dart",
            "toolArgs": [
                "--dart-define",
                "BASE_PATH=http://development.host.local:1234"
                "--dart-define",
                "OIDC_ISSUER=http://oidc.host.local:1234"
                "--dart-define",
                "OIDC_CLIENT=CMA"
            ]
        }    
    ]
}
```
## Developing

Some dependencies and tools rely on code generation as is common in Flutter development. 

### Generate flutter_localizations code

If you want to make changes to the application resource bundle files (.arb) in `/localization` folder, you'll need to update the generated code for [flutter_localizations](https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization#introduction-to-localizations-in-flutter).

Just run the following command:

```bash
flutter gen-l10n
```

### Generate auto_route code

If you make changes to the routing of the application, you must regenerate the code for [auto_route](https://pub.dev/packages/auto_route).

You can either run this once:

```bash
flutter packages pub run build_runner build
```

Or run a watcher that regenerates code on change:

```bash
flutter packages pub run build_runner watch
```

### Generate dwa_backend_api

If the OpenAPI definition for the CMA Backend API has been updated, you need to regenerate the code for [openapi-generator](https://github.com/gibahjoe/openapi-generator-dart):

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Build Apps

For detailed information check out the documentation on [App Deployment](https://docs.flutter.dev/deployment)

> **Note:**
> You can build the app for different platforms, but at the moment we only support Android.

### Build Android App

To build the app for Android, use the following command:

```bash
flutter build apk \
    --dart-define="BASE_PATH=http://development.host.local:1234" \
  --dart-define="OIDC_ISSUER=http://oidc.host.local:1234" \
  --dart-define="OIDC_CLIENT=CMA"
```

The APK file will be generated in the `build/app/outputs/apk directory`.

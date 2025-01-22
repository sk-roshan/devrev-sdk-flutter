# DevRev SDK for Flutter
DevRev SDK, used for integrating DevRev services into your Flutter app.

## Getting started

### Installation
```sh
flutter pub add devrev
```

### Setting up the DevRev SDK
#### Step 1: Credentials
1. Open the DevRev web app at [https://app.devrev.ai](https://app.devrev.ai).
2. Go to the **Settings** page.
3. Then open the **PLuG Settings** page, and copy the value under **Your Unique App ID**.


#### Step 2: Import DevRev
```dart
import 'package:devrev/devrev.dart';
```

#### Step 3: Configuration
> [!IMPORTANT]
> The SDK must be configured before you can use any of its features.

Once you have the credentials, you can configure the DevRev SDK in your app. The SDK will be ready to use once you have called the configuration method:

```dart
devrev = DevRev()
devrev.configure(appId: String)
```

## Features

**Identification**

Certain features of the DevRev SDK **require** a user identification. There are two methods to identify your users:
- **Anonymous users**: Creates an anonymous user with an optional user identifier, no other data is stored or associated with the user.
- **Unverified users**: Identifies the user with a unique identifier, but does not verify the user's identity with the DevRev backend.

The identification functions should be placed at the appropriate place in your app after you login your user. If you have the user information at app launch, call the function after the `DevRevSDK.configure(appID:)` method.

#### Anonymous identification
The anonymous identification method is used to create an anonymous user with an optional user identifier.

```dart
devrev.identifyAnonymousUser(userId: String)
```

#### Unverified identification
The unverified identification method is used to identify the user with a unique identifier, but does not verify the user's identity with the DevRev backend.

```dart
devrev.identifyUnverifiedUser(userID: String, organizationID?: String)
```

> [!IMPORTANT]
> The `userID` property can *not* be updated.

### PLuG support chat
The support chat feature can be shown as a modal screen from the top-most screen.

> [!IMPORTANT]
> This feature requires that the SDK has been configured and the user has been identified (unverified and anonymous users).

```dart
devrev.showSupport()
```

### Analytics
The DevRev SDK supports sending custom analytic events using a properties map.

> [!IMPORTANT]
> This feature requires that the SDK has been configured and the user has been identified (unverified and anonymous users).

You can track them using the following function:
```dart
devrev.trackEvent(name: String, properties?: Map<String, String>)
```

### Observability
The DevRev SDK provides observability features to help you understand how your users are interacting with your app.

> [!CAUTION]
> The session recording feature is opt-out and is enabled by default.

The session recording feature has a number of methods to help you control the recording:

- `devrev.startRecording()`: Starts the session recording.
- `devrev.stopRecording()`: Stops the session recording and uploads it to the portal.
- `devrev.pauseRecording()`: Pauses the ongoing session recording.
- `devrev.resumeRecording()`: Resumes a paused session recording.

## ToDO
- [ ] Timers
- [ ] Session properties
- [ ] Screen tracking
- [ ] Push notifications



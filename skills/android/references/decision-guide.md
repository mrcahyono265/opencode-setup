# Android Project Decision Guide

Read this reference when Android platform, data, API, security, or release choices materially affect the project.

## Platform

| Need | Default choice |
| --- | --- |
| Android only | Kotlin + Jetpack Compose |
| Android and iOS confirmed | Flutter |
| Deep Android or hardware integration | Kotlin + Jetpack Compose |
| Possible, unconfirmed iOS support | Kotlin + Jetpack Compose until the requirement is confirmed |

## Data And Backend

| Need | Approach |
| --- | --- |
| Local-only product | Local persistence; no server by default |
| Existing backend | Reuse its versioned API contract and server-side authorization |
| New shared web/mobile product | Define API, ownership, sync, and error behavior before implementation |
| Offline plus server sync | Define source of truth, conflict policy, retry behavior, and data deletion rules |

## Shared Product Rules

Website and Android applications may use different UI components. Keep these facts shared:

- product terminology and user flows;
- authorization and business rules;
- API contracts and validation;
- design tokens and UI states;
- acceptance criteria for behavior available on both platforms.

## Verification Baseline

- Unit test changed business and data logic.
- Add Compose UI tests or Flutter widget tests for changed interaction paths.
- Build a debug APK and smoke test on an emulator.
- Create a release APK/AAB before a requested release.
- Test a physical device for changed hardware-dependent behavior.

## Security And Release

- Request only required Android permissions and explain their purpose in the UI when needed.
- Keep tokens, credentials, and signing keys outside source control.
- Treat local storage and deep links as trust boundaries.
- Keep authorization on the server when an API is present; client checks are not authorization.
- Use a development or test backend for automated testing. Do not point test automation at production data.

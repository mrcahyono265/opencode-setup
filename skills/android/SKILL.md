---
name: android
description: Plan and build Android applications with explicit platform, UI, data, security, testing, and release boundaries.
compatibility: opencode
---

# Android Workflow

Use `project-context` and `project-planning` for the shared lifecycle: understand, select specs, approve/freeze, implement, verify, and document.

## Platform Decision

- Use Kotlin and Jetpack Compose for Android-only products by default.
- Use Flutter only when Android and iOS are confirmed targets or shared mobile UI is a demonstrated need.
- Do not select a framework from a possible future requirement. Read `references/decision-guide.md` for a substantial platform or architecture decision.

## Domain Focus

- Establish target devices, Android versions, user flows, offline requirements, permissions, notifications, and release destination.
- Decide explicitly whether the app is local-only, connects to an existing API, or requires a new backend. Do not introduce a backend when local storage satisfies the product need.
- Use `architect` for API contracts, sync, persistence, offline conflict handling, authentication, service boundaries, or significant platform integration.
- Use `ui-review` for hierarchy, Android navigation, touch targets, system bars, accessibility, loading, empty, and failure states.
- When a website and Android app share a product, keep terminology, business rules, API contracts, and design tokens aligned. Do not force shared UI code across platforms.
- Use `security-review` for authentication, user data, API access, payments, uploads, deep links, credentials, sensitive storage, or Android permissions.

## Implementation And Verification

- Follow the selected platform's official tooling. Install Android SDK, emulator, Flutter, or other SDKs only for a project that needs them.
- Keep secrets, signing keys, and service credentials out of source control.
- Verify changed logic with unit tests, UI/widget tests, a debug build, and an emulator smoke test when practical.
- Build a release APK or AAB before a requested release. Test on physical devices when changed features use camera, location, notifications, Bluetooth, files, or other hardware.
- Use Playwright for website flows only; validate native Android flows with the platform's test tooling or emulator.

# Supersonic Changelog

Issues are tracked in AppGyver's [unified issue tracker](https://github.com/appgyver/steroids/issues) – please post bug reports and feature requests there.

## 1.6.x (?)

Changes:
- Fixed scrolling issues on xwalk 14 - removed overflow: hidden; from body element on supersonic.css

## 1.6.1 (2015-08-03)

Changes:
- `supersonic.module.router` root path for Modules under `/dist` is now `/modules`

## 1.6.0 (2015-07-30)

Introduces navigation between Composer Modules.

- `supersonic.module.router` maps Composer Module route to installed Modules
- `supersonic.module.layers` allows pushing and popping Module views from the view stack based on routes

## 1.5.11 (2015-07-03)

Fixes:
- Switch the default `supersonic.data` cache adapter for a functioning one. The defective adapter caused caching to be effectively disabled.

## 1.5.10 (2015-07-02)

Features:
- `supersonic.module.transitions` provides view transition animations for Composer Modules

## 1.5.9 (2015-06-17)

Changes:
- Saving a Supersonic Data model instance merges the server response to the instance instead of replacing the whole instance state.

Fixes:
- Prevented the potential for a state leak in the HTTP layer of Supersonic Data. `X-Job-Id` headers would get reused by accident in some scenarios.

## 1.5.8 (2015-06-16)

Pre-features:
- Enabling/Disabling the Drawer via API. Closes [#749](https://github.com/AppGyver/steroids/issues/749). *Note: This feature requires wrapper support, which will be out shortly. Until then, the API calls will not work.*

Fixes:
- Brought back spinning icons that were removed in Supersonic 1.5.7. Closes [#945](https://github.com/AppGyver/steroids/issues/945).

## 1.5.7 (2015-06-08)
Changes:
- Updated Supersonic CSS to match Ionic's v1.0.0 "uranium-unicorn" release.

Breaking Changes:
- Updated Ionicons to v2.0.1. Naming convention for iOS icons changed from `<icon prefix>-ios7-<icon name>` to `<icon prefix>-ios-<icon name>`.

*Note: These updates include minor cosmetic tweaks to the UI – nothing major. That said, you might still want to check your app to ensure everything looks as it should after the update. For those interested, full list of changes can be found in [this commit](https://github.com/AppGyver/supersonic/commit/3b4fd6059bddf23ea0fff06617b6525f8090977d).*
## 1.5.6 (2015-06-04)

Features:
- `supersonic.module.attributes` allows access to AppGyver Enterprise Module instance context

## 1.5.5 (2015-05-22)

Changes:
- `supersonic.data.model` uses `localStorage` instead of `localforage` for the default cache storage adapter

## 1.5.4 (retracted)

## 1.5.3 (2015-05-22)

Features:
- Iframes with `data-module` attribute are detected as AppGyver Enterprise Modules. Their height is automatically adjusted to fit the content height.

Bugfixes:
- The promises returned by `supersonic.ui.View.start()` and `supersonic.ui.views.start()` now resolve to the `startedView` object as intended.

## 1.5.2 (2015-05-08)

Features:
- Support Enterprise users in the `super-data-repeat` component.

Changes:
- `supersonic.auth.users.getCurrentUser` provides a meaningful error message
  if session is not available

## 1.5.1 (2015-05-07)

Fix:
- `supersonic.data.model` reads configuration from `supersonic.env` if it's available

## 1.5.0 (2015-05-07)

Features:
- `supersonic.auth.session` provides accessors to the currently authenticated
  AppGyver Enterprise Session
- `supersonic.auth.users` provides accessors to the users of the
  current AppGyver Enterprise application
- `supersonic.env` provides information of the current AppGyver Enterprise
  application environment

## 1.4.0 (2015-04-23)

Changes:
- Enable caching by default for `supersonic.data.model`.
- Set authorization header by default for `supersonic.data.model`.

## 1.3.0 (2015-04-15)

Features:
- `supersonic.data.model` supports direct file uploads for model fields configured with the type `file`.

## 1.2.2 (2015-04-02)

Features:
- Asynchronous job protocol for slow HTTP endpoints also includes a feature flag in the `X-Feature-Jobs` header to improve backwards compatibility.

## 1.2.1 (2015-03-31)

Features:
- `supersonic.data.storage.adapters` exposes factories for the default `localforage` adapter and an in-memory storage, which can be used as `supersonic.data.model` cache adapters.

## 1.2.0 (2015-03-26)

Features:
- Asynchronous job protocol enabled when accessing slow HTTP endpoints over the AG proxy v3 API.

## 1.1.2 (2015-02-25)

Bugfixes:
- `super-navbar`, `super-navbar-title` and `super-navbar-button` properly hide their content from the DOM

## 1.1.1 (2015-01-21)

Features:
- Custom animation support to `supersonic.ui.layers.push` (iOS-only, see [open ticket](https://github.com/AppGyver/steroids/issues/776) about Android native support). Closes [#721](https://github.com/AppGyver/steroids/issues/721).

## 1.1.0 (2015-01-20)

Features:
- Updated Supersonic CSS to match Ionic's v1.0.0-beta.14 "magnesium-mongoose" release.
- Re-enabled some disabled Ionic components to ensure better backwards compatibility with Ionic apps.

*Note: These updates include minor cosmetic tweaks to the UI – nothing major. That said, you might still want to check your app to ensure everything looks as it should after the update. For those interested, full list of changes can be found in [this commit](https://github.com/AppGyver/supersonic/commit/9bc7e85b355206087ff9722954e982957ca21304).*

## 1.0.11 (2015-01-08)

Features:
- Added 3-way data binding support for single records by `one(123).whenChanged` on `supersonic.data.model`

Bugfixes:
- Resolved issue with `defaultStorage` for `supersonic.data.model` not being defined and the `cache` flag not working without specifying a storage

## 1.0.10 (2014-12-22)

Bugfixes:
- Fixed a bug causing the `timeToLive` option for `supersonic.data.model`'s `cache` to not be adhered

## 1.0.9 (2014-12-19)

Features:
- Added `cache` option support for `supersonic.data.model`

## 1.0.8 (2014-12-18)

Features:
- Added `supersonic.ui.layers.replace` API call for replacing the whole navigation stack with a started view.

Bugfixes:
- Fixed a bug where views returned by `supersonic.ui.views.find` didn't always have the correct `id` set.

## 1.0.7 (2014-12-12)

Bugfixes:
- Fix an inconsistency in handling `supersonic.data.model` instance state when serializing (`.toJson`) and unserializing (`.fromJson`)

## 1.0.6 (2014-12-12)

Features:
- `.fromJson` on `supersonic.data.model` assumes all the data is in a dirty state, so it will be sent to the cloud in case of `.save()`

## 1.0.5 (2014-12-12)

Features:
- Added `.fromJson` support to to complement `instance.toJson` on `supersonic.data.model`

## 1.0.4 (2014-12-11)

Bugfixes:
- `supersonic.ui.views.start()` and `supersonic.ui.views.stop()` now properly return the View object started/stopped.

## 1.0.3 (2014-12-10)

Features:
- Added option support for `supersonic.data.model`
- Added `supersonic.data.storage.property`

## 1.0.2 (2014-12-10)

- Added support for data-params for super-navbar-button when using "location" or "view-id" parameters (as in super-navigate).

## 1.0.1 (2014-12-05)

- Fixed using super-navigate component, layers.push, modal.show data parameters passing in android.

## 1.0.0 (2014-12-03) – MACH 1

Initial release. See the documentation at [http://docs.appgyver.com](http://docs.appgyver.com) for more information.

Bunch of outstanding issues in Steroids.js and other components fixed or made obsolete by Supersonic features:

- The `network.extraResponseHeaders` property in `config/app.coffee` can be used to set custom headers that will be appended to all incoming HTTP responses, allowing e.g. CORS issues to be circumvented for good. iOS-only for the moment, fixes [#124](https://github.com/AppGyver/steroids/issues/124), [#140](https://github.com/AppGyver/steroids/issues/140) and [#150](https://github.com/AppGyver/steroids/issues/150) for iOS.
- New app configs at `config/app.coffee` and `config/structure.coffee` deprecate `config/application.coffee` and the various `config.xml` files. Closes [#194](https://github.com/AppGyver/steroids/issues/194) and [#175](https://github.com/AppGyver/steroids/issues/175).
- New http://docs.appgyver.com sources are public on [GitHub](https://github.com/AppGyver/supersonic/tree/master/docs). Closes [#237](https://github.com/AppGyver/steroids/issues/237).
- Supersonic Routes remove the need for explicit view URLs. Closes [#285](https://github.com/AppGyver/steroids/issues/285).
- Deprecated keyboard `config.ios.xml` settings, since the new keyboard plugin introduced in [iOS runtime v4.0.0](https://github.com/AppGyver/scanner/blob/master/changelog-ios.md#400-2014-10-10-native-css-with-pixate) no longer supports them. Closes [#101](https://github.com/AppGyver/steroids/issues/101) and [#208](https://github.com/AppGyver/steroids/issues/208)

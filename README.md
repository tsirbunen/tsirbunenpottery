# MAD MUD COMPANY WEBPAGES

[![Netlify Status](https://api.netlify.com/api/v1/badges/cec72aa2-df39-4f31-b430-60965f13946f/deploy-status?branch=main)](https://app.netlify.com/sites/mad-mud/deploys)

### Code generation

To build the generated parts of immutable Freezed model classes, the go router routes, and test mocks, use the build_runner command (where "--delete-conflicting-outputs" prevents the prompt asking what to do with conflicting pre-existing files):

`dart run build_runner build --delete-conflicting-outputs`

(You might need to run `flutter pub global activate build_runner` prior to the file generation.)

### Packages and technologies

- **ROUTING:** **[go_router](https://pub.dev/packages/go_router)** with **[type-safe routes](https://pub.dev/documentation/go_router/latest/topics/Type-safe%20routes-topic.html)** and **[go_router_builder file generation](https://pub.dev/packages/go_router_builder)**

### Conventions

- **File imports and exports**: To keep import statements clean and maintainable, we use barrel files (files named **barrel.dart** that re-export other files in a folder) throughout the project.

### Deployment

Build the app with

`flutter build web`
`flutter build web --web-renderer html`

Drag the directory **/build/web/** to Netlify.

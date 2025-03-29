#!/bin/bash

# Install Flutter
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"

# Run flutter doctor to set up Flutter
flutter doctor

# Enable web if not already
flutter config --enable-web

# Get packages and build
flutter pub get
flutter build web --web-renderer html
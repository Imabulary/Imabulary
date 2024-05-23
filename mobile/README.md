# Mobile Client Overview

The app is written using [Dart](https://dart.dev/) and [Flutter](https://flutter.dev/).

The architecture is based on Riverpod (so called Riverpod Architecture). Details are [here](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/). Riverpod plays a huge role in the app, so please [learn it](https://riverpod.dev/) if you're not familiar with such a great tool.

To organize components of the application like forms, fonts, colors, lists, etc. we're using [Atomic Design](https://bradfrost.com/blog/post/atomic-web-design/). The only difference is that in our app `moleculs` are `components` and `organisms` are `widgets`.

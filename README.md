# Tasks UI

UI challenge for a tasks app

## Info ##

This project uses:

* Flutter
* Change Notifier

### Versions ###

See the changelog file

## Setup ##

In order to use this project, you need to install

* [Flutter][1]

For installing libraries, run the following command:

```
flutter pub get
```

To start the application:

```
flutter run
```

To build project for production purpose:

```
flutter build apk --split-per-abi
flutter build ios
```

## Contribution guidelines ##

The rules to submit a contribution are:

* Write only on English
* Don't make push on master
* Do a rebase before merge request
* Request a review before merge
* Limit your text lines to 80 characters or less
* Add an additional line at the end of every file
* Make atomic commits
* Follow the [git message][2] format using the regex:
```
((^[A-Z]{1})([a-z\ A-Z]+[a-z])(\n\n)((.)+([\n]{1,2})?)+)([\n\n]((Close:\ )|(See\ also:\ ) | (Resolves:\ ))\#[0-9]+)?
```
* Create a new branch before upload any change, using the regex:

```
((feature)|((hot)?fix))\/([a-z]+(-?[a-z0-9]*)*)([a-z0-9])$
```

## Contact ##

* [Joel Mauricio Romero Gamarra](mailto:joelrg1288@gmail.com)

## TODO ##

- [ ] Test
- [ ] CI

[1]: https://flutter.dev/
[2]: https://robots.thoughtbot.com/better-commit-messages-with-a-gitmessage-template

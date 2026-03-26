# react-native-add-calendar

allows adding events to native device calendar

## Installation

```sh
npm install react-native-add-calendar react-native-nitro-modules

> `react-native-nitro-modules` is required as this library relies on [Nitro Modules](https://nitro.margelo.com/).
```

## Usage

```js
import { addEvent } from 'react-native-add-calendar';

// ...

addEvent({
  title: 'Hello world',
  description: 'Somewhere over the rainbow',
  startDate: 1773759222723,
  endDate: 1773999600000,
  location: 'Idk maybe over there',
  url: 'https://github.com/Adoobdoob71',
});
```

## Demo

<div style="display: flex; gap: 1rem; flex-wrap: wrap;">
  <figure style="margin: 0; text-align: center;">
    <img src="media/ios_gif.gif" alt="iOS demo" width="360" />
    <figcaption>iOS</figcaption>
  </figure>
  <figure style="margin: 0; text-align: center;">
    <img src="media/android_gif.gif" alt="Android demo" width="360" />
    <figcaption>Android</figcaption>
  </figure>
</div>

## iOS setup

To access the Calendar, add the following keys to your app’s `Info.plist` (the one in your app, not the library):

```xml
<key>NSCalendarsWriteOnlyAccessUsageDescription</key>
<string>Used to add events to the calendar.</string>
<key>NSCalendarsUsageDescription</key>
<string>Used to access calendar information.</string>
```

> ⚠️ Note: Without these keys, the app may crash or be rejected by App Store review when calendar access is requested.

and that's it 🥳

## Android setup

Android is ready to go after downloading library 🥳

## Contributing

- [Development workflow](CONTRIBUTING.md#development-workflow)
- [Sending a pull request](CONTRIBUTING.md#sending-a-pull-request)
- [Code of conduct](CODE_OF_CONDUCT.md)

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)

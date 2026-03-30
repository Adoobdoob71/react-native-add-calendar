# react-native-add-calendar

Allows you to add events to the native device calendar

[![npm version](https://img.shields.io/npm/v/react-native-add-calendar.svg?style=flat-square)](https://www.npmjs.com/package/react-native-add-calendar)
[![npm downloads](https://img.shields.io/npm/dm/react-native-add-calendar.svg?style=flat-square)](https://www.npmjs.com/package/react-native-add-calendar)
[![bundle size](https://img.shields.io/bundlephobia/minzip/react-native-add-calendar?style=flat-square)](https://bundlephobia.com/package/react-native-add-calendar)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)
[![Nitro Modules](https://img.shields.io/badge/built%20with-Nitro%20Modules-ff69b4.svg?style=flat-square)](https://nitro.margelo.com/)

## Installation

```sh
npm install react-native-add-calendar react-native-nitro-modules

> `react-native-nitro-modules` is required as this library relies on Nitro Modules
```

## Usage

```js
import { addEvent } from 'react-native-add-calendar';

// ...

addEvent({
  title: 'Hello world',
  description: 'Somewhere over the rainbow',
  startDate: 1773759222723, // in milliseconds
  endDate: 1773999600000, // in milliseconds
  location: 'Idk maybe over there',
  url: 'https://github.com/Adoobdoob71',
});
```

## Demo

<table>
  <tr>
    <td align="center">
      <img src="media/ios_gif.gif" alt="iOS demo" width="360" />
      <br>
      iOS
    </td>
    <td align="center">
      <img src="media/android_gif.gif" alt="Android demo" width="360" />
      <br>
      Android
    </td>
  </tr>
</table>

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

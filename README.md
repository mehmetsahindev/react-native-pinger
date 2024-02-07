# react-native-pinger

## Getting started

`$ npm install react-native-pinger --save`
or
`$ yarn add react-native-pinger`

## Linking (for React Native <= 0.59 only, React Native >= 0.60 skip this as auto-linking should work)

### Mostly automatic installation

`$ react-native link react-native-pinger`

### Manual installation

#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-ping` and add `RNReactNativePing.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNReactNativePing.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`

- Add `import com.reactlibrary.LHPing.RNReactNativePingPackage;` to the imports at the top of the file
- Add `new RNReactNativePingPackage()` to the list returned by the `getPackages()` method

2. Append the following lines to `android/settings.gradle`:

```
  include ':react-native-pinger'
  project(':react-native-pinger').projectDir = new File(rootProject.projectDir, '../node_modules/react-native-pinger/android')
```

3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:

```
  compile project(':react-native-pinger')
```

4. (optional)

You can override this settings by adding a Project-wide gradle configuration properties for use by all modules in your ReactNative project by adding the below to android/build.gradle file,

```gradle
buildscript {...}

allprojects {...}

/**
* Project-wide gradle configuration properties for use by all modules
*/
ext {
    compileSdkVersion           = 26
    targetSdkVersion            = 26
    buildToolsVersion           = "26.0.2"
    googlePlayServicesVersion   = "12.0.1"
    googlePlayServicesVisionVersion = "15.0.2"
    supportLibVersion           = "27.1.0"
}
```

## Usage

### Get RTT (Round-trip delay time)

```javascript
import Ping from 'react-native-pinger';

...

try {
  /**
   *
   * Get RTT (Round-trip delay time)
   *
   * @static
   * @param {string} ipAddress - For example : 8.8.8.8
   * @param {Object} option - Some optional operations
   * @param {number} option.timeout - timeout
   * @returns
   * @memberof Ping
   */
  const ms = await Ping.start('114.114.114.114',{ timeout: 1000 });
  console.log(ms);
} catch (error) {
  console.log('special code',error.code, error.message);
}
```

#### About Error

| Code | Message                                     | platform    |
| ---- | ------------------------------------------- | ----------- |
| "0"  | PingUtil_Message_Timeout                    | iOS,Android |
| "1"  | PingUtil_Message_PreviousPingIsStillRunning | /           |
| "2"  | PingUtil_Message_HostErrorNotSetHost        | iOS,Android |
| "3"  | PingUtil_Message_HostErrorUnknown           | iOS,Android |
| "4"  | PingUtil_Message_HostErrorHostNotFound      | Only iOS    |
| "5"  | PingUtil_Message_Unknown                    | Only iOS    |

### Get Traffic Stats

| Property             | Description               |
| -------------------- | ------------------------- |
| receivedNetworkSpeed | Download Speed per second |
| sendNetworkSpeed     | Upload Speed per second   |
| receivedNetworkTotal | Download Total            |
| sendNetworkTotal     | Upload Total              |

```javascript
import Ping from 'react-native-ping';

...

const {
  receivedNetworkSpeed,
  sendNetworkSpeed,
  receivedNetworkTotal,
  sendNetworkTotal
} = await Ping.getTrafficStats();
```

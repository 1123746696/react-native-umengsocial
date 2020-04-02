
# react-native-umeng-social

## Getting started

`$ npm install react-native-umeng-social --save`

### Mostly automatic installation

`$ react-native link react-native-umeng-social`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-umeng-social` and add `RNUmengSocial.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNUmengSocial.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNUmengSocialPackage;` to the imports at the top of the file
  - Add `new RNUmengSocialPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-umeng-social'
  	project(':react-native-umeng-social').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-umeng-social/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-umeng-social')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNUmengSocial.sln` in `node_modules/react-native-umeng-social/windows/RNUmengSocial.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Com.Reactlibrary.RNUmengSocial;` to the usings at the top of the file
  - Add `new RNUmengSocialPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNUmengSocial from 'react-native-umeng-social';

// TODO: What to do with the module?
RNUmengSocial;
```
  
# IonIcons-iOS
Easily use Ionicons in your Swift iOS projects

*Currently using ionicons 1.4.1*  
*This project is simply a port and slight reconfiguration of [Sweetmandm/Ionicons-iOS](https://github.com/sweetmandm/ionicons-iOS/)*


## Requirements

- iOS 8.0+ / Mac OS X 10.9+
- Xcode 6.0
- (Support for embedded frameworks)

## Installation

1. Add Ionicons as a [submodule](http://git-scm.com/docs/git-submodule) by opening the Terminal, `cd`-ing into your top-level project directory, and entering the command `git submodule add https://github.com/DanielKoehler/Ionicons.git`
2. Open the `Ionicons` folder, and drag `Ionicons.xcodeproj` into the file navigator of your app project.
3. In Xcode, navigate to the target configuration window by clicking on the blue project icon, and selecting the application target under the "Targets" heading in the sidebar.
4. Ensure that the deployment target of Ionicons.framework matches that of the application target.
5. In the tab bar at the top of that window, open the "Build Phases" panel.
6. Expand the "Target Dependencies" group, and add `Ionicons.framework`.
7. Click on the `+` button at the top left of the panel and select "New Copy Files Phase". Rename this new phase to "Copy Frameworks", set the "Destination" to "Frameworks", and add `Ionicons.framework`.

---

## Usage

For available icons, look at the `Ionicon` emumeration source or [browse them on the IonIcons website](http://ionicons.com).

### Get the Ionicons font

```swift
import Ionicons

var ioniconicFont = Ionicons.fontWithSize(14);
```

### Make a UILabel with an ionicons icon

```swift
import Ionicons

var ioniconiclabel = Ionicons.labelWithIcon(
									iconName: Ionicon.Icecream, 
									size: 14, 
									color: UIColor.blackColor()
								);
```


### Render an Ionicons icon in a UIImage

```swift
import Ionicons

var icon = Ionicons.imageWithIcon(
									iconName: Ionicon.Icecream, 
									iconSize: 14, 
									iconColour: UIColor.redColor(), 
									imageSize: CGSizeMake(90, 90)
								);
```

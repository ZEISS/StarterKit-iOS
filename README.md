# StarterKit-iOS

# Intro

A starter project with great defaults for iOS app development.

## Contents

* Carthage (https://github.com/Carthage/Carthage)
* Fastlane (https://fastlane.tools)
* SimulatorStatusMagic (https://github.com/shinydevelopment/SimulatorStatusMagic)
* WhatsNewKit (https://github.com/SvenTiigi/WhatsNewKit)
* ZEISS Brand Colors (https://brand.zeiss.com)

# Download

```bash
git clone https://github.com/ZEISS/StarterKit-iOS.git
cd StarterKit-iOS
git remote remove origin
```

# Usage

## First use

* Set your own bundle identifier
* Run carthage update to compile frameworks

```bash
carthage update --platform iOS
```

## Icon

* Use the `App-Icon Template.sketch` template to create the icon
* Create the asset catalog file with e.g. [Asset Catalog Creator](https://itunes.apple.com/de/app/asset-catalog-creator/id866571115)

## Before deployment

### Create screenshots automatically (fastlane)

```bash
fastlane ios screenshots
```


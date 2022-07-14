<p align="center">
<img src="https://i.postimg.cc/rshx3FKM/Enterprise-Digital-Technology-Services-EDTS.png" alt="EDTSTracker" title="EDTSTracker" width="200"/>
</p>

<p align="center">
<a href="https://cocoapods.org/pods/EDTSTracker"><img src="https://img.shields.io/cocoapods/v/EDTSTracker.svg?style=flat"></a>
<a href="https://cocoapods.org/pods/EDTSTracker"><img src="https://img.shields.io/cocoapods/p/EDTSTracker.svg?style=flat"></a>
</p>

EDTSTracker is a simple iOS SDK which can track any event and activities that happen in client side. It's pure Swift library and easy to use.

## Features

- [x] Page view event tracking.
- [x] Page detail event tracking.
- [x] User impression tracking.
- [x] App activity tracking.
- [x] Click link event tracking.
- [x] Filter sort tracking.
- [x] Filter value tracking.
- [x] Event Submission tracking.
- [x] Error report tracking.
- [x] Backend data tracking.
- [x] Customizable event tracking.
- [x] HTTP Header X-API-Key support.
- [x] HTTP Header Authorization support.
- [x] Swift 5 support.


## How To Use

Firstly is you need to configure your URL Host, token, and HTTP header type you want to use.

```swift
import EDTSTracker

EDTSTracking.sharedInstance.configure(host: [YOUR_URL_HOST], token: [YOUR_TOKEN], headerType: [HTTP_HEADER_TYPE]) //.xAPIKey or .authorization
EDTSTracking.sharedInstance.synchronizeTrackingData()
```

EDTSTracker will send pending tracking data through `synchronizeTrackingData()` method after you configure your URL host, token, and HTTP header type. And then you can simply call method to send tracking data.

#### Page View Event Tracking

```swift
EDTSTracking.sharedInstance.sendEventPageView(name: [EVENT_NAME])
```

#### Page Detail Event Tracking

```swift
EDTSTracking.sharedInstance.sendEventPageDetail(name: [EVENT_NAME], details: [EVENT_DATA])
```

#### User Impression Tracking

```swift
EDTSTracking.sharedInstance.sendEventImpression(name: [EVENT_NAME], impressions: [LIST_DATA])
```

#### App Activity Tracking

```swift
EDTSTracking.sharedInstance.sendEventAppActivity(name: [EVENT_NAME])
```

#### Click Link Event Tracking

```swift
EDTSTracking.sharedInstance.sendEventClickLink(name: [EVENT_NAME])
```

#### Filter Sort Tracking

```swift
EDTSTracking.sharedInstance.sendEventFilterSort(name: [EVENT_NAME], sort: [SORT_DATA])
```

#### Filter Value Tracking

```swift
EDTSTracking.sharedInstance.sendEventFilterValue(name: [EVENT_NAME], list: [LIST_DATA])
```

#### Event Submission Tracking

```swift
EDTSTracking.sharedInstance.sendEventSubmission(name: [EVENT_NAME], status: [EVENT_STATUS], failed: [FAILED_MESSAGE])
```

#### Error Report Tracking

```swift
EDTSTracking.sharedInstance.sendEventError(exception: [ERROR_EXCEPTION], stackTrace: [STACK_TRACE])
```

#### Backend Data Tracking

```swift
EDTSTracking.sharedInstance.sendEventBackendData(name: [EVENT_NAME], eventDetails: [EVENT_DETAIL], details: [EVENT_DATA])
```

#### Customizable Event Tracking

```swift
EDTSTracking.sharedInstance.sendEventCustom(name: [EVENT_NAME], eventDetails: [EVENT_DETAIL])
``` 

## Installation

For installation is recomended using Cocoapods.

#### CocoaPods

```ruby
target 'MyApp' do
  pod 'EDTSTracker'
end
```

## Other

EDTSTracker is released under company SG-EDTS. For futher information please kindly visit our website https://sg-edts.com or send email to info@sg-edts.com .

Copyrights © 2022 All Rights Reserved by EDTS

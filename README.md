# Freeze App

The #MeToo movement is a global phenomenon, and 1 in 5 women are sexually assaulted during their college career in the United States. There are 3 biological responses to danger: fight, flight, and the common response to sexual assault, the freeze response. This is where you “freeze” up and are incapable of protecting yourself or alerting others. Freeze determines if you have entered this freeze response by tracking biometric data using the Apple Watch and sends “act now” alerts.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Initial setup

What things you need to install the app

```
Xcode
```
### Steps
1. Clone the repo.
```
git clone git@github.com:shainedl/Freeze.git
```
2. Open the project in Xcode.

3. Follow component specific instructions to run.

### Components
There are two main components of the Freeze application.
1. Freeze Response Detection
2. Act Now Alerts

#### Freeze Response Detection

Besides immobility, an important feature of freezing is the parasympathetically induced heart rate deceleration, also called ‘bradycardia’. For our MVP, we focused tracking biometric data on heart monitoring. Using the HealthKit API, Freeze monitors heart rate on the Apple Watch. By deploying the Freeze application to the Apple Watch, Freeze determines if the user’s heart rate has dropped below 60 beats per minute, which is the definition of bradycardia. Though this detection occurs on the backend, for demonstration purposes, the current state of the application displays your heart rate as Freeze tracks it. When the user’s heart rate has dropped below 60 beats per minute, the display message switches from ‘Monitoring’ to ‘Freeze Response Detected’. This transition brings us to the next module of our product: sending act now alerts.

#### Prerequisites
- Initial setup
- iphone/iphone simulator
- apple watch/watch simulator  


##### Running the Freeze Response Detection component

- After the initial setup is completed, we select freezewatchapp target in xcode and build it.
- When the build is successful, the app will attach and deploy on the selected device/simulator.
- The iphone application will then request for access to the users health data.
- Grant access to see real time heart rate data being tracked on the applewatch app.  


#### Act Now Alerts

##### Prerequisites
- Twilio account (free trial available)
- iPhone/iPhone simulator
- Apple Watch/Watch simulator  


##### Twilio API
While Twilio is a REST API and you could make an HTTP request to it directly, you would need to store your Twilio credentials inside your app which poses a serious security issue. An attacker could decompile the application, extract your credentials and use your Twilio account for anything they liked. Put in your own Twilio credentials including ACCOUNT_SID,  AUTH_TOKEN, and from_. The from_ field (within def send_sms) is the phone number Twilio assigns and the number the texts will come from. 

```
python app.py
```


##### Install Dependency
We are going to use CocoaPods to install the dependency we’ll need for this project. Install CocoaPods if you don’t have it:
```
sudo gem install cocoapods
```

In the repository that you cloned, there is a Podfile listing the dependencies that need to be installed. We’re just using Alamofire for making HTTP requests, so that’s the only thing in the list. Install with the following command:

```
pod install
```

CocoaPods takes care of linking all of the frameworks for you by creating a new Xcode Workspace. You can open this Workspace with: 

```
open Freeze.xcworkspace
```

Press “Command-B.” to verify the project builds with our dependency: Alamofire.

##### Send Act Now Alerts
Please run the iPhone application or iPhone simulator. Within the iPhone application, our MVP simulates adding a contact number to their safety network that the user would like to contact when the application determines that the user has entered the freeze response and is in immediate danger of sexual assault. On the screen, you can enter a phone number to contact in the format that is given as an example. Therefore, you can enter your <phone_number>, and pressing 'Send' will send an ‘act now’ alert showing who is in danger and what their location is. The contact can click the link to open Google Maps to direct the contact to the user’s location. The text message comes in using the Twilio API.

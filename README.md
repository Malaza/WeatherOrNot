# WeatherOrNot

# Installation
After downloading/pulling the project, please run the WeatherOrNot.xcodeproj file, to run the project

# Architecture
I used the VIPER architecture in the project, and I ensured to strictly follow all Viper rules.

# Testing
I tested the presenter, interactor, view controller and views. Although my tests are not extensive, and may not cover every scenario, my aim was to demonstrate and understanding and ability to write unit tests.

# Design
The design is based on the recommended design implementation, with zero to little refinements on it. The only refinemeent I have added, is the use of more improved margins where the edges and the UILabels are concerned. The splash screen logo was just a playful addition, which is not meant to be offensive in any form.

# Excluded Resolutions

320 * 568 px. If I want to cater for this resolution, I will have to compromise on the UI for the Pro Max 430 * 932 px, considering the fact that devices that run on this resolution are not supported by iOS 15, my target OS, it makes more sense to exclude support for these devices in favour of higher resolution devices.

# Security
On the Constants object, I have left the APIkey openly exposed, without encrypting it, because of the disposable nature of this project, I didn't take steps to secure/encrypt the key, but I understand the importance of doing so, one way I would have done that, is by keeping the value in the Keychain.

# What could have been improved?

I realized after my last commit that I left some comments, as well as a link in the code base, I was meant to clean that up and remove the comments when I prepare this Readme file.

In the weather presenter, I have mapped the ID from the Weather object, referencing the codes in this link: https://openweathermap.org/weather-conditions

I am not happy with how I mapped the image views and temperature values on this function **func configureForecastView(model: [ForecastModel])** in WeatherForecastView, I understand that there will be a crash should any of the array indexes be empty, and ideally I would have returned a model that has transformed the array, and already mapped Tuesday -> Saturay temperature values, and I will just link the values based on variables named 'tuesdayTemp' -> 'saturdayTemp'.

On the CurrentWeatherView I used attributed strings to avoid having two labels for the temp and the text underneath.



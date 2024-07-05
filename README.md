# Github User App

This app is a able to search users from **Github** that when searched are displayed in a list. You can see the detail of the user in another view.

## Architecture
I have user **MVVM** as architecture because is  **clean**. I have also created a **SPM** (Swift Package Manager) for the API connections to be modular and can be reused if need.


## Views
I used **SwiftUI** to create the principal views, **List and Detail**. Also used to create the **reusable views or cells** that are displayed inside the principal ones.

## Swift

Everything is code in **Swift 5.9**, and everything is native, from the API calls with **URLSession** and **Async/Await** to every other method, without using third parties frameworks 

## How to use it
Start the app. 
Start typing in the search box for the user you want to search
Touch the cell to see the user detail

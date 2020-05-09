# IntelliBudget

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
An app that will allow people of all ages to get a grip on their finances (spending vs income). As can be seen a lot of people are cavalier with their finances,
spending money everyday, and then wondering where all the money went (I ask myself this everyday). An app like this can be tailored to logging daily, weekly, bi-weekly income, while also tracking day to day purchases. Another feature would be to set monthly bills/reminders or set a goal to save up for. 

### App Evaluation
- **Category:** Finance
- **Mobile:** Easy to track purchases while at the store or in your home.
- **Story:** Allows users to keep track of purchases, and track income to help them budget better.
- **Market:** People of all ages 
- **Habit:** Excessive Spending
- **Scope:** Teaches people of all ages to spend money accordingly to better themselves with purchases in the future

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Allow user to input purchases
* Create an account
* Login/ Logout
* Daily report of how much was spent 
* Daily report of money left from last income source

**Optional Nice-to-have Stories**


* Add conistent flow of income based on date
* Weekly/Monthly/Yearly spending report
* Graphs to show spending habits
* Categorized spending reports


### 2. Screen Archetypes

* Login/Register screen
   * Prompts the user to login/register using proper credentials
* Home page 
   * Add purchase / income
   * Log of that days spending
   * Current Balance
   * Spending report (line graph)
* Categorized Reports
    * Categories for spending to track expenses
* Questions
   * Place for users to pose questions and receive feedback from financial specialists 
* Settings
   * Users can adjust settings of the app
### 3. Navigation

**Tab Navigation** (Tab to Screen)

* List of purchases
* Account settings

**Flow Navigation** (Screen to Screen)

* Login/Register Screen
   * Home Page
* Home Page
   * Categorized Reports
   * Settings
   * Questions

## Wireframes
https://www.figma.com/proto/Ujhh2F4v4KLSHNBoxokE5V/CodePath-Project-WireFrame?node-id=1%3A4&scaling=scale-down

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
| Property | Type | Description |
| -------- | ---- | ----------- |
| username | String | username for what the user posts |
| image | File | image that the user posts |
| price | Number | the amount the user spent on a purchase |
| date | DateTime | the date when the purchase was made |
| itemPurchased | String | the item the user purchased |
| category | String | the specific category of the item purchased |
| chartImage | File | this image shows the user's purchases through a chart (bar graph/ line graph) |
### Networking
* HomeFeedScreen
  * (Read/GET) List of all purchases the user has made
    * including dates and categories
  ```
  let query = PFQuery(className:"Purchases")
  query.whereKey("username", equalTo: currentUser)
  query.order(byDescending: "date")
  query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
  if let error = error { 
      print(error.localizedDescription)
   } else if let purchases = purchases {
      print("Successfully retrieved \(purchases.count) purchases.")
  // TODO: Do something with purchases...
   }
  } 
  ```
* Create a new purchase
    * (Create/POST) Add a new purchase 
    * (DELETE) Remove an existing purchase
* Profile Screen
    * (Read/GET) Weekly and monthly Reports
    * (Read/GET) Categorized spending 
    * (Read/GET) History of posed questions (answered and unanswered)
    * (Update/PUT) Update user profile image
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]

## App Walkthrough Gif
<img src='http://g.recordit.co/tBkBZridPu.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

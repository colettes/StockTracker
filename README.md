# Mobile App Template

## Description:
This is a simple app that uses static data to create a list of stocks with information from the Alpha Advantage API. It is an exploration on API data processing along with app structuring. 

### API Features That I Used:

#### Tab Bar Controller: 
This was first implemented by Dewone, but I added a tab to edit profile. Further, I overrode the viewDidAppear() function on each view controller connected to the tab bar so the stock list would be up-to-date when the user changes their stock style preference in Edit Profile, as well as when the Watchlist has stocks added or deleted. 
#### Core Graphics: 
I utilized CG to implement a ‘toast’ like function that temporarily pops up when the add or delete button on the Detail View is pressed more than once. I wanted something that was non-intrusive but still alerted the user to information. It is a label that is created using CGRect, only when the add/delete button is pressed, and the ticker is already added or deleted from the WatchList.
#### GestureRecognizer: 
In order to utilize multitouch, I implemented gesture recognizers on the front page. This serves as a sort of quasi-security measure before login and adds an element of gamification. First the view recognizes and requires a triple tap to continue then a swipe of any direction segues to the Profile screen.
Alpha Advantage: Not demonstrated in class, the Alpha Advantage API contains JSON data for a single stock. It is used in order to populate the data in the detail view, based on the title of the ticker that is clicked on in every table view cell (WatchList, Suggested, Search). 
#### URLSession: 
Not demonstrated in class, the URLSession is utilized on the detail view. It takes the information from the call to the Alpha Vantage API, decodes the JSON file that is received and then sets each label on the view controller with the correct information. Further, to easily implement the data from the URLsession, I created a struct extending the Codable protocol. There are a limited number of calls that can be made using the free Alpha Advantage API key, so I decided to make a call only when the data needs to be populated in the Detail View.


## Requirements:

* [Xcode](http://docs.phonegap.com/en/3.5.0/guide_platforms_ios_index.md.html#iOS%20Platform%20Guide)

## Authors:
Created with [Dewone Westerfield] (https://github.com/DewoneW536)


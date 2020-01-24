# Memeful
Memeful

# Home screen
Implemented Home screen with dynamic collectionview cell size based on meme poster image size.
Implemeted imgur api's using NSURLSession in APIKit to send request and get back the response.
MemeList uses 'Codable' protocol to map json response.

# Details screen
Implemeted MemeDetailCell to display meme poster, comments list.
Meme poster will display based on if it's jpg/png relying on poster animated true/false.
Uses 'getCommentsFor' method from APIKit to fetch comments for given meme.id/galaryId 
CommentsList uses 'Codable' protocol to map json response.

# Memeful project build and run in iOS Simulator
$ git clone git@github.com:krsunmoon/Memeful.git
open the project using Xcode.
clean and build project and run.

# Testing
Testing done on iPhone 11 Pro Max only.
Once Memeful app loads on iPhone Simulator, app launchs with home screen with meme's list
Click on a meme to see it's details with comment's.

# Pending tasks
Need to add Segmented cotrol on Home screen nav bar.
Need to customize Details screen Nav bar to disply following
  -- Author avatar
  -- Meme title
  -- author
  -- follow link

Need to implement avatar who commented - Placehoder image is implemented

# Issue
Observed that, details screen poster display not with proper size  

# Screenshots
![Screenshot](https://github.com/krsunmoon/Memeful/blob/master/Screenhots/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-01-24%20at%2022.25.15.png)
![Screenshot](https://github.com/krsunmoon/Memeful/blob/master/Screenhots/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-01-24%20at%2022.26.10.png)
![Screenshot](https://github.com/krsunmoon/Memeful/blob/master/Screenhots/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-01-24%20at%2022.25.37.png)
![Screenshot](https://github.com/krsunmoon/Memeful/blob/master/Screenhots/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202020-01-24%20at%2022.25.48.png)


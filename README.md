Westport Civil Management Application
========


```bash
$ git clone ...
$ npm install
```
## Mockups

### Initial Architecture
![Mockup 3][3]

#### Features

* User Login (local - node level)

* email address username
	- password (reset features)
	- SMS security pass (future feature)
	- Official ID
	- Contact Info

* Stealth Mode
* Guest Services (Public Data)
* Nodes obtain DNS and find other division nodes
* Universal Fields
* Node / Federation Based System
* Central DNS Server
* Database API
* Simple Install
* Each Division/Department will Fork Master Repo
* Database Schema will be recorded and versioned to local repo
* Transaction Log
* Nodes will be auto updated with regression testing, unit testing, reversion on fail.

* DEFAULT FIELDS  (default properties), i.e. public:[true|false]
	* DATETIME STAMP	(VERSIONED)
	* INCIDENT #
	* TYPE			(VERSIONED)
	* UNIT (VEHICLE) 	(VERSIONED)
	* COMMENTS 		(VERSIONED)
	* LOCATION 		(VERSIONED)	Google Maps API
	* STATUS 		(VERSIONED)
	* GROUP 		(VERSIONED)

#### QUESTIONS
* What is public data?

#### CASES
COMMENT CASE:

<blockquote>
DISPATCHER LOGS CALL WITH INITIAL COMMENT

- OFFICER REPORTED ON-SCENE - DISPATCHER #2001
- CALL RECEIVED, CAR REPORTED STOLEN - DISPATCHER #101
</blockquote>

New Fields can be added, with prompt:
	* Suggests are given.
	* Icon Selection available. 
	* Checkboxes for Share (Local, State, Federal)


### Dept View
![Mockup 1][1]

### Overview
![Mockup 2][2]

[1]: https://s3.amazonaws.com/iMediaS3/westport/CivilAppDeptView.png "Dept View"
[2]: https://s3.amazonaws.com/iMediaS3/westport/Civil+AppOverview.png "Overview"
[3]: https://s3.amazonaws.com/iMediaS3/20130522_134228.jpg "Initial Architecture"


     ,-----.,--.                  ,--. ,---.   ,--.,------.  ,------.
    '  .--./|  | ,---. ,--.,--. ,-|  || o   \  |  ||  .-.  \ |  .---'
    |  |    |  || .-. ||  ||  |' .-. |`..'  |  |  ||  |  \  :|  `--, 
    '  '--'\|  |' '-' ''  ''  '\ `-' | .'  /   |  ||  '--'  /|  `---.
     `-----'`--' `---'  `----'  `---'  `--'    `--'`-------' `------'
    ----------------------------------------------------------------- 

##BLOCMETRICS

Blocmetrics is an analytic service that offers a few key features:

* A client-side JavaScript snippet that allows a user to track events on their website, 
 by adding the following snippet to the user website:

```ruby
 var blocmetrics = {};
   blocmetrics.report = function(eventName){
   
    var event = {event: { name: eventName }};
 
   
    var request = new XMLHttpRequest();
  
    request.open("POST", "https://blocmentrics-ednah.c9users.io/api/events", true);
   
    request.setRequestHeader('Content-Type', 'application/json');
   
    request.send(JSON.stringify(event));
   };
```

* A server-side API that captures and saves those events to a database.

* A Rails application that displays the captured event data for a user.

* A user can sign in and out of Blocmetrics providing an email and password.

* A user can register an application with Blocmetrics for tracking.

* A user can view a graph of events for each registered application.

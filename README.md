# Rocket_Elevators_foundation

Site is now online at http://www.rocketelevatorswl.online/

API : Twilio, Slack, Dropbox, Google Maps, DropBox, SendGrid, IBM Watson et ZenDesk.

-IBM Watson : on the admin section, you can press a button and a file play to give you information sonically. It gave you your name, the number of elevator, number of customer, number of city etc...

-SendGrid : When a customer send a Lead he receives confirmation email via SendGrid with logo of Rocket Elevators and display some information. (All fields must containt some infomations including File Attachment)

-Zendesk : Everytime a customer fill up a lead or a quote, we receive a ticket and a email for letting us know there is someone who want to contact us

-Twilio: When an elevator status is updated (Active or Inactive). Twilio check if the status is in intervention, if so the contact name of the technician of this elevator is sent to a employee cellphone for a maintenance service

-Google Maps : The dashboard panel has a geolocations section which displays all the building deployed by Rocket Elevators. Google Maps Api is used to extract geolocation data from database and display key info including building location, number of batteries, columns and elevators.

-Slack : When an elevator status is changed in the dashboard system, a notification is sent to Rocket Elevator employees in the "elevator_operations" slack channel to notify about the status update along with the specifications of that particular elevator.

-Dropbox: when an admin create a new customer, the dropbox api look if the email of the customer is already inside the lead database. It take the attach file, upload it to Rocket Elevator dropbox. The link of the uploaded file remplace the file attachment inside the database for an easy access.

Customer : On the site, you can make a submission, create a user or send a leads.

When you are logged as a customer, you can go to the page customer dashboard and see all the submissions linked to your email.

If you try to have a quotes while being login, you will that some of yours informations are already there.

Admin :

email: Your codeboxx email
password: patate

If you go to the admin page (only avalaible if you are also an employee, wich every codeboxx coachs are) , you can see all the informations in the SQL DB. You can also check for some BI information in the the dashboard blazer with the link chart or by using the srolldown button on the normal pages.

Furthermore, you can edit your informations of the user profil likes last name, first name, compagny, password ect.


To send the data from sql to postgresql DB use :  rake transfer_for_fact


Finally for the Rest Api, its deployed on azure at this url: https://restapiwl.azurewebsites.net
The git repository for it is : https://github.com/WilliamLanglois/RestApi
If you want to see all the intervention, add /api/interventions at the end of the url
For de demonstration, it'll be done via postman as you can see in the video that it work fine.


For the security assesment the link to it is : https://docs.google.com/document/d/1CqUaAFo-6QHvP227iyAqa5yqB33LyNjQC10QZaE8gFE/edit

To run the test for the delivrable you can put in the terminal:

    rspec ./spec/elevator_media_spec.rb

It will show some information in a string between some div tag


If you want to run it and see the bonus test and see more details, you can put in the terminal:

    bundle exec rspec --format documentation 

If you want to run the test for python you can put in the terminal:

    pytest

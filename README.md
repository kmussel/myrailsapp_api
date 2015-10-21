Example API and Oauth2 Provider
-------------



# rails 4, rails-api, devise, doorkeeper, oauth, cancancan, rspec, puma, vcr, factory_girl, reqres_rspec, pg, dotenv, rack-cors, active_model_serializers, rubocop 


Mobile applications will use credential based authentication to get back a token that will be passed to all subsequent request  
Web applications will use Oauth2 authorization flow.  
- User will be redirected to this application to login.   
- Upon successful login the auth application will redirect back to the client application with an authorization code.  
- The client app will then make another request using the authorization code to get an access token for the user.  
- The user will then be logged in using session authentication  

This application will also provide a rest api 


Features:

* User Signup
* Restore password
* Modify own user profile
* User password-based authentication
* Client application authentication
* Access with OAuth access_token
* Generate new access_token via refresh_token
* Authorization


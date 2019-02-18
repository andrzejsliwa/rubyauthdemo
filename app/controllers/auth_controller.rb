class AuthController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']
 
    if session[:user_id]
      # Means our user is signed in. Add the authorization to the user
      User.find(session[:user_id]).add_provider(auth_hash)
 
      render :text => "You can now login using #{auth_hash["provider"].capitalize} too!"
    else
      # Log him in or sign him up
      auth = Authorization.find_or_create(auth_hash)
 
      # Create the session
      session[:user_id] = auth.user.id
   
      render :text => "Welcome #{auth.user.name}!"
      redirect_to '/dashboard'
    end
  end

  # This stores all the user information that came from Auth0
  # and the IdP
  def callback
    session[:userinfo] = request.env['omniauth.auth']

    # Redirect to the URL you want after successful auth
    redirect_to '/dashboard'
  end

  # This handles authentication failures
  def failure
    @error_type = request.params['error_type']
    @error_msg = request.params['error_msg']
    # TODO show a failure page or redirect to an error page
  end

  def destroy
    session[:userinfo] = nil
    #render :text => "You've logged out!"
    redirect_to '/'
  end
end

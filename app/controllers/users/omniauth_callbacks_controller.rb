# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    user = User.from_google(from_google_params)
    if user.present?
      sign_out_all_scopes
      flash[:notice] = t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect user, event: :authentication
    else
      flash[:alert] = "User is not authorized."
      redirect_to new_user_session_path
    end
   end

   def from_google_params
     @from_google_params ||= {
       uid: auth.uid,
       full_name: auth.info.full_name,
       email: auth.info.email
     }
   end

   def auth
     @auth ||= request.env['omniauth.auth']
   end
end

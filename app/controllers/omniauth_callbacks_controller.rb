class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def twitter
        callback_from :twitter
    end
    
    def facebook
      callback_from :facebook
    end

  private

  def callback_from(provider)
    provider = provider.to_s

    @user = User.find_or_create_from_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      session[:user_id] = @user.id
      sign_in_and_redirect @user, event: :authentication
    else
        if provider == 'twitter'
          session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
        else
          session["devise.facebook_data"] = request.env["omniauth.auth"]
        end
      redirect_to new_user_registration_url
    end
  end

end
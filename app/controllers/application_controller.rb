class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :authorize_user
  helper_method :destroy_release

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar])
   devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar, :remove_avatar])
 end

 def authorize_user
    if !user_signed_in? || !current_user.is_admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def destroy_release(release)
    reviews = release.reviews
    reviews.each do |review|
      review.destroy
    end
    release.destroy
  end
end

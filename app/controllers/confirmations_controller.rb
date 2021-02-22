class ConfirmationsController < Devise::ConfirmationsController
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?
    if resource.errors.empty?
      #set_flash_message!(:notice, :confirmed)
      respond_with_navigational(resource){ redirect_to "https://toptaskmanager.herokuapp.com/login" }
    end
  end
end
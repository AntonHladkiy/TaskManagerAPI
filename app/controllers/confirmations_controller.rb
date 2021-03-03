class ConfirmationsController < Devise::ConfirmationsController
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    redirect_to "https://toptaskmanager.herokuapp.com/success"
  end
end
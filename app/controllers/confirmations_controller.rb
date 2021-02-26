class ConfirmationsController < Devise::ConfirmationsController
  def after_confirmation_path_for(resource_name, resource)
    "https://toptaskmanager.herokuapp.com/success"
  end
end
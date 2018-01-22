class Users::SessionsController < Devise::SessionsController


  def new
    super
  end

  def create
      self.resource = warden.authenticate!(auth_options)
      sign_in(resource_name, resource)
      redirect_to notes_path, :flash => {:notice => "Signed in successfully."}
  end

  def failure
    redirect_to new_user_session_path, :flash => {:notice => "Invalid email or password."}
  end

  def destroy
    sign_out(current_user)
    redirect_to new_user_session_path, :flash => {:notice => "Signed out successfully."}
  end

  private

  def auth_options
    {:scope => resource_name, :recall => "#{controller_path}#failure"}
  end

end

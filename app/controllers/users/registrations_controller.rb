class Users::RegistrationsController < Devise::RegistrationsController


  def new
    super
  end

  def create
    build_resource(sign_up_params)
    resource.skip_confirmation!
    if resource.save
      set_flash_message(:notice, :signed_up)
      sign_in(resource_name, resource)
      redirect_to root_path
    else
      set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
      render :new
    end
  end

  def edit
    render :edit 
  end

end

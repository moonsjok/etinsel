# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   before_action :configure_sign_up_params, only: [:create]
   before_action :configure_account_update_params, only: [:update]
    before_action :user_params

  # GET /resource/sign_up
   def new
   super
   end

  # POST /resource
   def create
     #super
     #User.find(current_user.id).update(online:1)
     #Identity.new(user_id: current_user.id).save
   end

  # GET /resource/edit
   def edit
     super
   end

  # PUT /resource
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to "/monprofil/login", notice: 'Identity was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end
protected
  # The path used after sign up.
   def after_sign_up_path_for(user)
     super(resource)
     User.find(current_user.id).update(online:1)
     redirect_to new_identity_path
   end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:username, :phonenumber, :email, :password, :password_confirmation)
  end

end

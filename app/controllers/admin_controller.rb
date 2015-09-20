class AdminController < ApplicationController
  def index
    @pending_users  = User.pending_user_list
    @active_users   = User.active_user_list
  end

  def update
    Rails.logger.debug("admin#update: Got called by JSON!")
    respond_to do |format|
      if change_user_active_state(params[:id],
                                  toggle_active_state(params[:active_state]))
         format.html {
           redirect_to admin_index_path, notice: "User status updated"
         }
         #format.js do 
         #  Rails.logger.debug("Rendering update.js.erb")
         #  render :update
         #end
         format.json do
           Rails.logger.debug("JSON OK") 
           render json: {id: params[:id], result: "ok"}
         end 
      else
         Rails.logger.debug("The update failed")
      end
    end
  end

  def destroy
    respond_to do |format|
      delete_user(params[:id])
      format.html do
        redirect_to admin_path, notice: "user destroyed"
      end
      format.json do
        render json: { id: params[:id], result: "ok" }
      end
    end
  end
  
  
  private
  def user_params
    params.require(:user).permit(:is_active,:is_admin)
  end
  # Input String "true" or "false"
  def toggle_active_state(old_state)
    if old_state == "true"
      return false;
    else
      return true;
    end
  end
  def change_user_active_state(user_id,new_active_state)
    Rails.logger.debug("Entered change_user_active_state()")
    Rails.logger.debug("Inputs user_id: " + user_id + ", new_active_state: " + new_active_state.to_s)
    user = User.find user_id
    result = user.update(is_active: new_active_state)
    Rails.logger.debug("Exiting change_user_active_state()")
    return result
  end
  def delete_user(user_id)
    user = User.find user_id
    user.destroy
    return true;
  end
end

module CatsHelper

  def owns_cat!
    redirect_to cats_url if current_user.nil? || current_user.id != Cat.find_by_id(params[:id]).user_id
  end

end

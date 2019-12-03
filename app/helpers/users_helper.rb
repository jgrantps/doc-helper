module UsersHelper
  def upper_avatar
    current_user.associated_users("all", current_user).distinct.each do |associate| 
      raise params.inspect
       render partial: 'users/dashboard/avatar', locals: {:avatar => associate} 
    end 
  end

  
end

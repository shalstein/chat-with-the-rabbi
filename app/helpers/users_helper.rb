module UsersHelper
  def wallet
    if @user.wallet
      "You have #{number_to_currency(@user.wallet)} in your wallet"
    else
      "You are broke! #{link_to 'Edit Your Profile', edit_user_registration_path} to add more money."
    end
  end

end

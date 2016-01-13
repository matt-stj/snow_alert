class UserMailer < ApplicationMailer
  default from: 'gnarpow.info@gmail.com'

  def alert(user)
    @user = user
    @forecast = Alert.new(@user).alert_data
    mail(to: @user.email, subject: "Snow is on the way!")
  end

end

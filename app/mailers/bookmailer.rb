class Bookmailer < ApplicationMailer
 default from: 'notifications@example.com'
   
   def email(user)
      @user = user
    
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
   end

end

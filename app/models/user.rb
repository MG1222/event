class User < ApplicationRecord
	after_create :welcome_send # callback 
	def welcome_send
		UserMailer.welcome_email(self).deliver_now
	
  	end
end

class AttendanceMailer < ApplicationMailer
	default from: 'no-reply@monsite.fr'
 
  def attendance_email(ticket)
    @ticket = ticket
    @user = User.find(@ticket.user_id)
    @event = Event.find(@ticket.event_id)
    
    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/event/id' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Confirmation ! ') 
  end
end



		
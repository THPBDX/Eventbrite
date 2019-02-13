class AttendanceMailer < ApplicationMailer

    default from: 'no-reply@monsite.fr'

   def attendance_email(attendance)
     @event = attendance.event
     @attendance = attendance

     mail(to: @event.organiser.email, subject: 'Vous avez un nouveau participant à votre évènement!')
   end
  end

class Attendance < ApplicationRecord
	after_create :attendance_send
  	belongs_to :user
  	belongs_to :event


  def confirmation_send
    AttendanceMailer.attendance_email(self).deliver_now
  end

end # class

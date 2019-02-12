class Attendance < ApplicationRecord
  # after_create :attendance_send

  belongs_to :participant, class_name: "User"
  belongs_to :event

  validates :participant_id, presence: true
	validates :event_id, presence: true
  validates :stripe_customer_id, presence: true



  def attendance_send
    AttendanceMailer.attendance_email(self).deliver_now
  end

end

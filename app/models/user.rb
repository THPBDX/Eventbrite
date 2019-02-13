class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable


  after_create :welcome_send

  has_many :attendances, foreign_key: "participant_id", class_name: "Attendance"
  has_many :participated_events, through: :attendances
  has_many :organised_events, foreign_key: 'organiser_id', class_name: 'Event'

  validates :first_name, presence: true, length: { in: 2..30 }
  validates :last_name, presence: true, length: { in: 2..30 }
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :description, presence: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }


  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end

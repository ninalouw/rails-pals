class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile, dependent: :nullify
  has_many :dogs, dependent: :nullify

  private

  def downcase_email
    email.downcase! if email.present?
  end

  def full_name
    "#{first_name} #{last_name}".strip.squeeze(' ').titleize
  end
end

class Profile < ApplicationRecord
  belongs_to :user
  validates :screen_name, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :description, presence: true
  validates :occupation, presence: true
  validates :suburb, presence: true
  validates :postal_code, presence: true
  validates :image, presence: true

  has_attached_file :image, styles: { small: "100x100", med: "200x200", large: "400x400" }, default_url:"/images/:style/missing.png", :s3_protocol => :https
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def user_full_name
    if user
      user.first_name + ' ' + user.last_name
    else
      'Anonymous'
    end
  end
end

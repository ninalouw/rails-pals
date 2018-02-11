class Dog < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { minimum: 2 }
  validates :breed, presence: true
  validates :age, presence: true
  validates :size, presence: true
  validates :description, presence: true, length: {minimum: 10}
  validates :availability, presence: true
  validates :suburb, presence: true
  validates :postal_code, presence: true
  validates :image, presence: true
  belongs_to :size

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

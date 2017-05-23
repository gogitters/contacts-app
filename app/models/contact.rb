class Contact < ApplicationRecord
  belongs_to :user

  def friendly_updated_at
    updated_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def full_name
    # first_name + " " + last_name
    "#{first_name} #{middle_name} #{last_name}!"
  end

  def japan_phone
    "+81 #{phone_number}"
  end

  def self.all_johns
    Contact.where(first_name: "John")
  end
end

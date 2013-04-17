class Person < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :availability_id, :expected_graduate_date, :notes
  validates_format_of :email, message: 'must be a valid email address.', with: /[^@]+@([^\.]+\.)+[^\.]/
  validates_presence_of :email, :name, :availability_id
  belongs_to :availability

  #
  # Pad the ID a little so nobody thinks they're the first person ever. ;)
  #
  def confirmation_number
    27 + id
  end
end

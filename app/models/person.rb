class Person < ActiveRecord::Base
  attr_accessible :email, :name
  validates_format_of :email, message: 'must be a valid email address.', with: /[^@]+@([^\.]+\.)+[^\.]/
  validates_presence_of :email, :name
end

class Preuser < ActiveRecord::Base
  validates_presence_of :email, :message => "Please enter an email address."
  validates_uniqueness_of :email, :message => "Looks like we've already got you!"
  validates_email_format_of :email, :message => "Is that an email address?"
end
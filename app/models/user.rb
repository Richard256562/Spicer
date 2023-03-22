class User < ApplicationRecord
    # imaginary table
    has_many :tasks, dependent:
    #fields
    validates: email, presence: true, uniqueness: true
    validates :email, format {with: URI::MailTo::EMAIL_REGEXP}
    validates :username, presence: true, uniqueness: true
    validates :password, length : {minimum : 6}, if:-> {new_record? || !password.nil?}
    # has a password utility function
end

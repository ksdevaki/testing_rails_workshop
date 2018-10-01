class User < ActiveRecord::Base
  has_one :membership
  has_one :group, through: :membership

    has_secure_password
    validates :email, presence: true, uniqueness: true
    def self.authenticate email, password
        user = find_by_email email
        if user && user.authenticate(password)
          user
        else
          Invalid.new email
         end
    end
end

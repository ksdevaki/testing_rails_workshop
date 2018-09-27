class User::CreateUser
    def self.create_random_user
        random = SecureRandom.hex(8)
         User.create! email: "#{random}@abcd.com", password: random, password_confirmation: random
    end
end
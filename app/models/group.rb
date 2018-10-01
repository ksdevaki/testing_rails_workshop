class Group < ActiveRecord::Base
    validates :name, presence: true
    has_many :memberships
    has_many :users, through: :memberships
    has_many :posts
    
    def is_member? user
        users.include? user
    end
    
    def empty_post date
        Post.new(group: self, date: date)
      end
    def add_member user
        users << user unless is_member? user
    end

    def remove_member user
        users.destroy user if is_member? user
    end

    def post_for_day date
        # posts.where("date = ?", date)
        byebug
        unless(date.blank?)
            posts.where(date: date)
        else
            posts
        end
    end

    def post_for_day_and_user date, user
        # posts.where("date = ? and user_id = ?", date, user.try(:id))
        posts.where(date: date, user: user)
        # Post.where(group: self, date: date, user: user).first

    end

     def add_post date, user, body
        # post = Post.new
        # post.date = date
        # post.user = user 
        # post.body = body
        # posts << post
        Post.create(group: self, user: user, date: date, body: body)

     end

end

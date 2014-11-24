class BlogPost < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :description, presence: true,
													length: {minimum: 5}

end


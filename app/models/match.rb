class Match < ActiveRecord::Base
  belongs_to :user_one, class_name: 'User', foreign_key: :user_one_id 
  belongs_to :user_two, class_name: 'User', foreign_key: :user_one_id 
end

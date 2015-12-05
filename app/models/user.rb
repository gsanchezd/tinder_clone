class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :photos, dependent: :destroy

  has_many :interactions_one, class_name: "Interaction", foreign_key: :user_one_id, dependent: :destroy
  has_many :interactions_two, class_name: "Interaction", foreign_key: :user_two_id, dependent: :destroy

  has_many :matches_one, class_name: "Match", foreign_key: :user_one_id, dependent: :destroy
  has_many :matches_two, class_name: "Match", foreign_key: :user_two_id, dependent: :destroy

  accepts_nested_attributes_for :photos, allow_destroy: true

  def interacted_users
    User.eager_load(:interactions_two).where("interactions.user_one_id = ?", self.id)
  end

  def next_users
    User.all - interacted_users - [self]
  end

  def next_user
    (next_users).first
  end

  def matches
    self.matches_one + self.matches_two
  end


end

class UserSignup
  include ActiveModel::Model
  attr_accessor :accepts_terms_of_service
  attr_reader :user

  delegate :email, :email=, to: :user
  delegate :id, to: :user, prefix: true, allow_nil: true
  validates :email, :accepts_terms_of_service, presence: true

  def initialize attributes = {}
    @user = User.new
    super attributes
  end

  def save
    if valid?
      user.save
    end
  end

  def user_profile
    UserProfile.new(user)
  end

end
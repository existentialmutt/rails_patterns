class UserProfile
  include ActiveModel::Model
  attr_reader :user

  delegate :full_name, :full_name=, :bio, :bio=, :persisted?, :id, to: :user
  validates :full_name, presence: true

  def initialize user
    @user = user
  end

  def save
    if valid?
      user.save
    end
  end

  def self.find id
    self.new User.find(id)
  end

  def update attributes = {}
    attributes.each do |k, v|
      send "#{k}=", v
    end
    save
  end

end
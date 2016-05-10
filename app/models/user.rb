class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  enum role:  { pr: 0, admin: 1, editor: 2}
  has_many :saved_talents

  def saved_for_later?(talent)
    saved_talents.for_talent?(talent)
  end

  def save_for_later(talent)
    saved_talents.create!(talent: talent)
  end

  def remove_from_saved(talent)
    saved_talents.destroy!(talent: talent)
  end

  rails_admin do
    navigation_label "Admin"
    list do
      field :email
      field :role
    end
    field :email
    field :password
    field :password_confirmation
    field :role
  end
end

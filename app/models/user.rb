class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  enum role:  { pr: 0, admin: 1, editor: 2}

  rails_admin do
    navigation_label "Admin"
    list do
      field :email
      field :role
    end
    field :email
    field :password
    field :password_confirmation
  end
end

class User < ActiveRecord::Base
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    belongs_to :rol
end

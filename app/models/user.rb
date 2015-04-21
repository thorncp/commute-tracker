class User < ActiveRecord::Base
  include Clearance::User

  has_many :commutes, dependent: :destroy
end

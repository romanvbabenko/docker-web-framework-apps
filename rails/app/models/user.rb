class User < ApplicationRecord
  validates :f_name, :l_name, presence: true
end

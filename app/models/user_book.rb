class UserBook < ActiveRecord::Base
  belongs_to :books
  attr_accessor :img
end

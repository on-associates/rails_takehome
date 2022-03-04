class Task5 < ActiveRecord::Base
  include Noteable

  has_many :notes, as: :noteable, dependent: :destroy

end

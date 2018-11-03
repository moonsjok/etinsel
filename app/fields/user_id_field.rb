require "administrate/field/base"

class UserIdField < Administrate::Field::Base
  def to_s
    data
  end
end

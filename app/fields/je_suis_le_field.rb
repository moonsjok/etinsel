require "administrate/field/base"

class JeSuisLeField < Administrate::Field::Base
  def to_s
    data
  end
end

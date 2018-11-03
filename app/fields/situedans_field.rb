require "administrate/field/base"

class SituedansField < Administrate::Field::Base
  def to_s
    data
  end
end

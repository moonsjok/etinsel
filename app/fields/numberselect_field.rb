require "administrate/field/base"

class NumberselectField < Administrate::Field::Base
  def to_s
    data
  end
end

require "administrate/field/base"

class CategorieField < Administrate::Field::Base
  def to_s
    data
  end
end

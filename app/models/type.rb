class Type < ApplicationRecord
  belongs_to :pokemon
  self.inheritance_column = :_type_disabled
end

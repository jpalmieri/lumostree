class MyTree < ApplicationRecord
  validates_presence_of :name
  has_closure_tree
end

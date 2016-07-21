class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:tags)
  has_and_belongs_to_many(:ingredients)
  validates(:name, {:presence => true, :length => {:maximum =>25}})
  before_save(:capitalize_each_word)


private

# define_method(:upcase_name) do
    # self.name=name().upcase()
  define_method(:capitalize_each_word) do
    self.name=name.split.map(&:capitalize)*' '
  end
end

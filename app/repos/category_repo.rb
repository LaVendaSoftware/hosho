class CategoryRepo < ApplicationRepo
  include Scopes::ByCompany
end

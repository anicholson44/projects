class Project < ApplicationRecord
  scope :search, -> (search) do
    where('school_name ilike :search or description ilike :search', { search: "%#{search}%" })
  end
end

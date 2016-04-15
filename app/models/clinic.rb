class Clinic < ActiveRecord::Base

  belongs_to :user
  has_many :schedules
  has_many :reviews
  filterrific(
  default_filter_params: {},
  available_filters: [
    :search_query,
    :by_state,
    :by_municipality
  ]
  )
  #Required fields for possible filters
  validates :name, presence: true
  validates :state, presence: true
  validates :municipality, presence: true
  scope :search_query, lambda { |query|
    return nil  if query.blank?
    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)
    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conditions = 3
    where(
      terms.map {
        or_clauses = [
          "LOWER(clinics.name) LIKE ?",
          "LOWER(clinics.state) LIKE ?",
          "LOWER(clinics.municipality) LIKE ?"
        ].join(' OR ')
        "(#{ or_clauses })"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }
  #For state filter
  scope :by_state, lambda { |state|
    where("state LIKE ?", "%#{state}%")
  }
  #For municipality filter
  scope :by_municipality, lambda { |municipality|
    where("municipality LIKE ?", "%#{municipality}%")
  }
  #For name filter
  scope :by_name, lambda { |name|
    where("name LIKE ?", "%#{name}%")
  }
  scope :order_by_name, -> {
    order(:name => :desc)
  }
 def self.options_for_select_state
  order('LOWER(state)').group('clinics.id', 'state').map { |e| [e.state, e.state] }
 end
 def self.options_for_select_municipality
  order('LOWER(municipality)').group('clinics.id', 'municipality').map { |e| [e.municipality, e.municipality] }
 end
end

require "administrate/base_dashboard"

class IdentityDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    typeannonceur: JeSuisLeField,
    name: Field::String,
    country: Field::String,
    city: Field::String,
    adress: Field::String,
    zip: Field::String,
    about: TrixField,
    user_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :typeannonceur,
    :name,
    :country,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :typeannonceur,
    :name,
    :country,
    :city,
    :adress,
    :zip,
    :about,
    :user_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :typeannonceur,
    :name,
    :country,
    :city,
    :adress,
    :zip,
    :about,
    :user_id,
  ].freeze

  # Overwrite this method to customize how identities are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(identity)
  #   "Identity ##{identity.id}"
  # end
end

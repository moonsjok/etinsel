class Annonce < ApplicationRecord
  validates :categorie,presence:true, exclusion: { in: %w(Choisissez une catégorie)}
  validates :sous_categorie,presence:true, exclusion: { in: %w(Choisissez une sous catégorie)}
  has_many_attached :photos
end

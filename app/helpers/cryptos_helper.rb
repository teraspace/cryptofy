module CryptosHelper
  include Pagy::Frontend

  CRYPTO_TYPES = {
    grass: 'text-bg-success',
    steel: 'text-bg-success',
    fire: 'text-bg-danger',
    water: 'text-bg-info',
    air: 'text-bg-info',
    electric: 'text-bg-info',
    normal: 'text-bg-primary',
  }.with_indifferent_access

  def crypto_type(type)
    CRYPTO_TYPES[type]
  rescue
    CRYPTO_TYPES[:normal]
  end

end

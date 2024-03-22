module ErrorsManagement
  extend ActiveSupport::Concern

  included do
    rescue_from CryptoApiPermanentError, with: :permanent_error
    rescue_from CryptoApiTemporalError, with: :temporal_error
  end
  def permanent_error
    redirect_to permanent_error_path
  end

  def temporal_error
    redirect_to temporal_error_path
  end
end

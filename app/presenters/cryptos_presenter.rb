class CryptosPresenter < BasePresenter

  def initialize(data, item_presenter)
    @item_presenter = item_presenter
    @results = map_response(data)
    @total_pages = nil
  end

  private

  def map_response(data)
    return [] if data.nil?

    data.map! do |k, _v|
      @item_presenter.new k
    end
  end

end

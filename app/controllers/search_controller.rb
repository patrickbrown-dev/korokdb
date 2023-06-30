class SearchController < ApplicationController
  def index
    @search = params[:q]
    @search_results = Cartridge.joins(:game).where("games.title ILIKE ?", "%" + Game.sanitize_sql_like(@search) + "%")
  end
end

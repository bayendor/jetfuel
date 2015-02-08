class ShortUrlsController < ApplicationController
  before_action :set_short_url, only: [:show]
  before_action :index, only: [:new, :create]
  helper_method :sort_column, :sort_direction

  def show
    @short = set_short_url
    @short.update(visits: @short.visits += 1)

    respond_to do |format|
      format.html { redirect_to @short.original_url }
    end
  end

  def new
    @short_url = ShortUrl.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @short_url = ShortUrl.new(short_url_params)

    respond_to do |format|
      if @short_url.save
        format.html { render :show, notice: "Short url was created." }
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_short_url
    @short_url = ShortUrl.find(params[:id].to_i(36))
  end

  def short_url_params
    params.require(:short_url).permit(:original_url, :visits)
  end

  def sort_column
    ShortUrl.column_names.include?(params[:sort]) ? params[:sort] : "visits"
  end

  def sort_direction
    %w(asc desc).include?(params[:direction]) ?  params[:direction] : "asc"
  end

  def index
    @short_urls = ShortUrl.order(sort_column + " " + sort_direction)
  end
end

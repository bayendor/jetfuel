class ShortUrlsController < ApplicationController
  before_action :set_short_url, only: [:show]
  before_action :index, only: [:new, :create]

  def show
    @short = set_short_url

    respond_to do |format|
      format.html { redirect_to @short.original_url }
      format.json { render :show, status: :ok, location: @short_url }
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
        format.json { render :show, status: :created, location: @short_url }
      else
        format.html { render :new }
        format.json do
          render json: @short_url.errors, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def set_short_url
    @short_url = ShortUrl.find(params[:id].to_i(36))
  end

  def short_url_params
    params.require(:short_url).permit(:original_url)
  end

  def index
    @short_urls = ShortUrl.all
  end
end

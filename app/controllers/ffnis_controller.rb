class FfnisController < ApplicationController
  before_action :set_ffni, only: [:show, :update, :destroy]

  # GET /ffnis
  def index
    @ffnis = Ffni.all

    render json: @ffnis
  end

  # GET /ffnis/1
  def show
    render json: @ffni
  end

  # POST /ffnis
  def create
    @ffni = Ffni.new(ffni_params)

    if @ffni.save
      render json: @ffni, status: :created, location: @ffni
    else
      render json: @ffni.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ffnis/1
  def update
    if @ffni.update(ffni_params)
      render json: @ffni
    else
      render json: @ffni.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ffnis/1
  def destroy
    @ffni.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ffni
      @ffni = Ffni.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ffni_params
      params.require(:ffni).permit(:topic, :content, :badge, :upvotes, :downvotes, :approval, :user_id)
    end
end

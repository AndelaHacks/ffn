class FfnisController < ApplicationController
  before_action :set_user, except: [:index]
  before_action :set_ffni, only: [:show, :edit, :update, :destroy]

  skip_before_action :verify_authenticity_token

  # GET /ffnis
  # GET /ffnis.json
  def index
    @user = User.includes(:ffnis).find(params[:user_id])
    @ffnis = @user.ffnis
  end

  # GET /ffnis/1
  # GET /ffnis/1.json
  def show
    @comment = @ffni.comments.new
    @comment.user_id = @user.id
  end

  # GET /ffnis/new
  def new
    @ffni = @user.ffnis.new
  end

  # GET /ffnis/1/edit
  def edit
  end

  # POST /ffnis
  # POST /ffnis.json
  def create
    @ffni = Ffni.new(ffni_params)

    respond_to do |format|
      if @ffni.save
        format.html { redirect_to [@user, @ffni], notice: 'Ffni was successfully created.' }
        format.json { render :show, status: :created, location: [@user, @ffni] }
      else
        format.html { render :new }
        format.json { render json: @ffni.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ffnis/1
  # PATCH/PUT /ffnis/1.json
  def update
    respond_to do |format|
      if @ffni.update(ffni_params)
        format.html { redirect_to [@user, @ffni], notice: 'Ffni was successfully updated.' }
        format.json { render :show, status: :ok, location: [@user, @ffni] }
      else
        format.html { render :edit }
        format.json { render json: @ffni.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ffnis/1
  # DELETE /ffnis/1.json
  def destroy
    @ffni.destroy
    respond_to do |format|
      format.html { redirect_to [@user, :ffni], notice: 'Ffni was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_ffni
      @ffni = @user.ffnis.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ffni_params
      params.require(:ffni).permit(:topic, :media, :content, :badge, :upvotes, :downvotes, :user_id)
    end
end

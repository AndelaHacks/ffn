class CommentsController < ApplicationController
  before_action :set_user, :set_ffni, except: [:index]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @user = User.includes(:ffnis).find(params[:user_id])
    @ffni = @user.ffnis.find(params[:ffni_id])
    @comments = @ffni.comments
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = @ffni.comments.new
    @comment.user_id = @user.id
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@user, @ffni, @comment], notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: [@user, @ffni, @comment] }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to [@user, @ffni, @comment], notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: [@user, @ffni, @comment] }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to [@user, @ffni, :comments], notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_ffni
      @ffni = @user.ffnis.find(params[:ffni_id])
    end

    def set_comment
      @comment = @ffni.comments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:text, :approvals, :disapprovals, :user_id, :ffni_id)
    end
end

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /artists
  # GET /artists.json
  def index
    @users = User.all
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
    @user = User.find(params[:id])
    @is_admin = current_user && current_user.id == @user.id
  end

  # GET /artists/new
  def new
    if current_user
      redirect_to root_path, :notice => "You are already registered"
    end
    @user = User.new
  end

  # GET /artists/1/edit
  def edit
    @user =  User.find(params[:id])
    if current_user.id != @user.id
      redirect_to @user
    end
  end

  # POST /artists
  # POST /artists.json
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, :notice => "Artist was successfully created."
    else
      render "new"
    end
  end

  # PATCH/PUT /artists/1
  # PATCH/PUT /artists/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, :notice => 'Artist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(login_path, :notice => 'User was successfully activated.')
    else
      not_authenticated
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

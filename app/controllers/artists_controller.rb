class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  # GET /artists
  # GET /artists.json
  def index
    @artists = Artist.all
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
    @artist = Artist.find(params[:id])
    @is_admin = current_user && current_user.id == @artist.id
  end

  # GET /artists/new
  def new
    if current_user
      redirect_to root_path, :notice => "You are already registered"
    end
    @artist = Artist.new
  end

  # GET /artists/1/edit
  def edit
    @artist =  Artist.find(params[:id])
    if current_user.id != @artist.id
      redirect_to @artist
    end
  end

  # POST /artists
  # POST /artists.json
  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      session[:artist_id] = @artist.id
      redirect_to @artist, notice: "Artist was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /artists/1
  # PATCH/PUT /artists/1.json
  def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to artists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:name, :email, :password, :password_hash, :place, :art_piece, :art_piece_price, :wepay_access_token, :wepay_account_id)
    end
end

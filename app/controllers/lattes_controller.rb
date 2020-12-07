class LattesController < ApplicationController
  before_action :set_latte, only: [:show, :edit, :update, :destroy]

  # GET /lattes
  # GET /lattes.json
  def index
    @lattes = Latte.all
  end

  # GET /lattes/1
  # GET /lattes/1.json
  def show
  end

  # GET /lattes/new
  def new
    @latte = Latte.new
  end

  # GET /lattes/1/edit
  def edit
  end

  # POST /lattes
  # POST /lattes.json
  def create
    @latte = Latte.new(latte_params)

    respond_to do |format|
      if @latte.save
        format.html { redirect_to @latte, notice: 'Latte was successfully created.' }
        format.json { render :show, status: :created, location: @latte }
      else
        format.html { render :new }
        format.json { render json: @latte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lattes/1
  # PATCH/PUT /lattes/1.json
  def update
    respond_to do |format|
      if @latte.update(latte_params)
        format.html { redirect_to @latte, notice: 'Latte was successfully updated.' }
        format.json { render :show, status: :ok, location: @latte }
      else
        format.html { render :edit }
        format.json { render json: @latte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lattes/1
  # DELETE /lattes/1.json
  def destroy
    @latte.destroy
    respond_to do |format|
      format.html { redirect_to lattes_url, notice: 'Latte was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_latte
      @latte = Latte.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def latte_params
      params.require(:latte).permit(:name, :time)
    end
end

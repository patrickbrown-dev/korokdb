class CartridgesController < ApplicationController
  before_action :set_cartridge, only: %i[show edit update destroy]

  # GET /cartridges or /cartridges.json
  def index
    @cartridges = Cartridge.all
  end

  # GET /cartridges/1 or /cartridges/1.json
  def show
  end

  # GET /cartridges/new
  def new
    @cartridge = Cartridge.new
  end

  # GET /cartridges/1/edit
  def edit
  end

  # POST /cartridges or /cartridges.json
  def create
    @cartridge = Cartridge.new(cartridge_params)

    respond_to do |format|
      if @cartridge.save
        format.html { redirect_to cartridge_url(@cartridge), notice: "Cartridge was successfully created." }
        format.json { render :show, status: :created, location: @cartridge }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cartridge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cartridges/1 or /cartridges/1.json
  def update
    respond_to do |format|
      if @cartridge.update(cartridge_params)
        format.html { redirect_to cartridge_url(@cartridge), notice: "Cartridge was successfully updated." }
        format.json { render :show, status: :ok, location: @cartridge }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cartridge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cartridges/1 or /cartridges/1.json
  def destroy
    @cartridge.destroy

    respond_to do |format|
      format.html { redirect_to cartridges_url, notice: "Cartridge was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cartridge
    @cartridge = Cartridge.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cartridge_params
    params.require(:cartridge).permit(:game_id, :code, :build, :region, :revision, :game_version)
  end
end

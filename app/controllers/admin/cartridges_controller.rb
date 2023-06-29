class Admin::CartridgesController < Admin::ApplicationController
  before_action :set_cartridge, only: %i[show edit update destroy]

  def index
    @cartridges = Cartridge.all
  end

  def show
  end

  def new
    @cartridge = Cartridge.new
  end

  def edit
  end

  def create
    @cartridge = Cartridge.new(cartridge_params)

    respond_to do |format|
      if @cartridge.save
        format.html { redirect_to admin_cartridge_url(@cartridge), notice: "Cartridge was successfully created." }
        format.json { render :show, status: :created, location: @cartridge }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cartridge.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cartridge.update(cartridge_params)
        format.html { redirect_to admin_cartridge_url(@cartridge), notice: "Cartridge was successfully updated." }
        format.json { render :show, status: :ok, location: @cartridge }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cartridge.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cartridge.destroy

    respond_to do |format|
      format.html { redirect_to admin_cartridges_url, notice: "Cartridge was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_cartridge
    @cartridge = Cartridge.find(params[:id])
  end

  def cartridge_params
    params.require(:cartridge).permit(:game_id, :code, :build, :region, :revision, :game_version)
  end
end

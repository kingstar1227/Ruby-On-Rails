class VocablesController < ApplicationController
  before_action :set_vocable, only: [:edit, :update, :destroy]


  # GET /vocables/new
  def new
    @vocable = Vocable.new
  end

  # GET /vocables/1/edit
  def edit
  end

  # POST /vocables
  # POST /vocables.json
  def create
    @vocable = Vocable.create(vocable_params)
    respond_to do  |format|
      format.js 
      format.json {render json: @vocable}
    end


  end

  # PATCH/PUT /vocables/1
  # PATCH/PUT /vocables/1.json
  def update
    respond_to do |format|
      if @vocable.update(vocable_params)
        format.html { redirect_to @vocable, notice: 'Vocable was successfully updated.' }
        format.json { render :show, status: :ok, location: @vocable }
      else
        format.html { render :edit }
        format.json { render json: @vocable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vocables/1
  # DELETE /vocables/1.json
  def destroy
    @vocable.destroy
    respond_to do |format|
      format.html { redirect_to vocables_url, notice: 'Vocable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vocable
      @vocable = Vocable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vocable_params
      params.require(:vocable).permit(:german, :english, :swedish, :unit_id)
    end
end

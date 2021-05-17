class PartsController < ApplicationController
  before_action :set_part, only: %i[ show edit update destroy ]

  # GET /parts/autosuggest
  def autosuggest
    @part_numbers = Part.where('part_number LIKE ?', "#{query}%").pluck(:part_number)

    render partial: 'autosuggest'
  end

  # GET /parts/fetch
  def fetch
    @part = Part.find_by(part_number: query)

    render @part, partial: "parts/part"
  end

  # GET /parts/reset
  def reset
    @parts = Part.all.order(:part_number)

    render @parts
  end

  # GET /parts or /parts.json
  def index
    @parts = Part.all.order(:part_number)
  end

  # GET /parts/1 or /parts/1.json
  def show
  end

  # GET /parts/new
  def new
    @part = Part.new
  end

  # GET /parts/1/edit
  def edit
  end

  # POST /parts or /parts.json
  def create
    @part = Part.new(part_params)

    respond_to do |format|
      if @part.save
        format.html { redirect_to @part, notice: "Part was successfully created." }
        format.json { render :show, status: :created, location: @part }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parts/1 or /parts/1.json
  def update
    respond_to do |format|
      if @part.update(part_params)
        format.html { redirect_to @part, notice: "Part was successfully updated." }
        format.json { render :show, status: :ok, location: @part }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parts/1 or /parts/1.json
  def destroy
    @part.destroy
    respond_to do |format|
      format.html { redirect_to parts_url, notice: "Part was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part
      @part = Part.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def part_params
      params.require(:part).permit(:part_number, :description, :manufacturer, :stock_quantity)
    end

    def query
      params[:q]
    end
end

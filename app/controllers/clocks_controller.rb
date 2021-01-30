class ClocksController < ApplicationController
  before_action :set_clock, only: [:show, :edit, :update, :destroy]

  # GET /clocks
  # GET /clocks.json
  def index
    @clocks = Clock.all
    Time.zone = 'Melbourne'
    @defaultTime =  Time.zone

    #work out difference in days
    @clocks.each do |clock|
      Time.zone = clock.timezone
      dayDiff(@defaultTime, Time.zone, clock)
    end
  end

  # work out if time is yesterday, today, tomorrow in relation to default time "Melbourne"
  def dayDiff(default, current, clock)
    #test if months are different first
    if(default.now.month<current.now.month)
      clock.daydiff = "Tomorrow"
    elsif(default.now.month>current.now.month)
      clock.daydiff = "Yesterday"
    #now test if days are different
    elsif(default.now.day<current.now.day)
      clock.daydiff = "Tomorrow"
    elsif(default.now.day>current.now.day)
      clock.daydiff = "Yesterday"
    else
    #today if nothing different
      clock.daydiff = "Today"
    end
  end
  # GET /clocks/1
  # GET /clocks/1.json
  def show
  end

  # GET /clocks/new
  def new
    @clock = Clock.new
    @cities = City.all
  end

  # GET /clocks/1/edit
  def edit
  end

  # POST /clocks
  # POST /clocks.json
  def create

    #find time zone for city
    params[:clock][:timezone] = find_timezone(params[:clock][:city])

    @clock = Clock.new(clock_params)

    respond_to do |format|
      if(params[:clock][:timezone] == nil)
        format.html { redirect_to new_clock_path, notice: 'Invalid Name'}
      elsif @clock.save
        format.html { redirect_to root_url, notice: 'Clock was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @clock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clocks/1
  # PATCH/PUT /clocks/1.json
  def update
    respond_to do |format|
      if @clock.update(clock_params)
        format.html { redirect_to @clock, notice: 'Clock was successfully updated.' }
        format.json { render :show, status: :ok, location: @clock }
      else
        format.html { render :edit }
        format.json { render json: @clock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clocks/1
  # DELETE /clocks/1.json
  def destroy
    @clock.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Clock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #method for finding timezone of city
  def find_timezone(city)
    @cities = City.all
    cityObject = @cities.where(name: city.downcase)

    timezone=nil
    cityObject.each do |c|
      timezone = c.timezone
    end

    return timezone
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clock
      @clock = Clock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def clock_params
      params.require(:clock).permit(:city, :timezone, :daydiff)
    end
end

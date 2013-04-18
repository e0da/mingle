class PeopleController < ApplicationController

  before_filter :authenticate

  # GET /people
  # GET /people.json
  def index
    @people = Person.all

    respond_to do |format|
      format.html # index.html.erb
      format.json do
        render json: @people.to_json(
          methods: :confirmation_number,
          include: :availability
        )
      end
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/new
  # GET /people/new.json
  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(params[:person])
    set_expected_graduation_date

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Thanks for registering!' }
        format.json { render json: @person, status: :created, location: @person }
      else
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.json
  def update
    @person = Person.find(params[:id])
    set_expected_graduation_date

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to @person, notice: 'Thanks for registering!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end

  def like
    @person = Person.find(params[:id])
    @person.impression = 1
    @person.save
    render nothing: true
  end

  def dislike
    @person = Person.find(params[:id])
    @person.impression = -1
    @person.save
    render nothing: true
  end

  private

  def set_expected_graduation_date
    @person.expected_graduation_date = Date.parse("#{params[:date][:month]}/#{params[:date][:year]}")
  end
end

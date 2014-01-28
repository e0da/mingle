class PeopleController < ApplicationController

  before_filter :authenticate

  # GET /people
  # GET /people.json
  def index
    @people = Person.all

    respond_to do |format|
      format.html # index.html.erb

      # XXX To get this to render as pretty JSON, we have to use @people.to_json
      # with arguments (i.e. :methods, :include) to get the appropriate data
      # out of. But @people.to_json returns a String, and JSON.pretty_generate
      # expects a JSON, Hash, or Array. So we have to render the JSON to a
      # string, then parse it to a Hash with JSON.parse, and finally run
      # JSON.pretty_generate on that Hash. >_<
      format.json do
        render json: pretty_json(
          @people.to_json(
            methods: :confirmation_number,
            include: :availability
          )
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
      format.json { render json: pretty_json(@person) }
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
    set_graduation_date

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
    set_graduation_date

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
    set_impression(1)
  end

  def dislike
    set_impression(-1)
  end

  def meh
    set_impression(0)
  end

  private

  def set_graduation_date
    @person.graduation_date = Date.parse("#{params[:date][:month]}/#{params[:date][:year]}") if params[:date]
  end

  def set_impression(value)
    @person = Person.find(params[:id])
    @person.impression = value
    @person.save
    render nothing: true
  end

  # Accept JSON as a String and return a formatted JSON string
  def pretty_json(subject)
    subject = subject.to_json unless subject.class == String
    JSON.pretty_generate JSON.parse(subject)
  end
end

class PeopleController < ApplicationController
  def index
    term = params[:search]
    @people = term ? Person.search(term) : Person.sorted
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new person_params
    save_person('created') || render('new')
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    @person.update person_params
    save_person('updated') || render('edit')
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to people_path, notice: "#{@person.name} has been deleted"
  end

  private

  def person_params
    params.require(:person).permit(:name, :job_title, :bio)
  end

  def save_person(action)
    redirect_to @person, notice: "#{@person.name} has been #{action}" if @person.save
  end
end

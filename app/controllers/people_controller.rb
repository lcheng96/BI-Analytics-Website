class PeopleController < ApplicationController
  def new
  end
  
  def create
    @person = Person.new(params.require(:person).permit(:name, :group))
    @person.save
    redirect_to @person
  end

  def show
    @person = Person.find(params[:id])
  end

  def index
    @people = Person.all
  end
  
  def explore
    @people = Person.all
  end
end

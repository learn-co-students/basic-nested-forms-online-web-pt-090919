class PeopleController < ApplicationController
  def new
    @person = Person.new
    # when we create a Person in the PeopleController, 
    # we'll add two empty addresses to fill out 
    @person.addresses.build(address_type: 'work')
    @person.addresses.build(address_type: 'home')
  end

  def create    
    Person.create(person_params)
    redirect_to people_path
  end

  def index
    @people = Person.all
  end

  private

  def person_params
    params.require(:person).permit(
      :name,
      # modify our person_params method to accept address
      addresses_attributes: [
        :street_address_1,
        :street_address_2,
        :city,
        :state,
        :zipcode,
        :address_type
      ]
  end
end

# class ApplicationController < Sinatra::Base
#   set :default_content_type, 'application/json'
  
#   # Add your routes here
#   get "/" do
#     { message: "Good luck with your project!" }.to_json
#   end

# end


class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  before do
    response.headers['Access-Control-Allow-Origin'] = "*"
  end

  #enabling CORS prefLight requests
  options "*" do
    response.headers['Access-Control-Allow-Method'] = "GET, POST, PUT, PATCH, DELETE, OPTIONS"
  end
  
  # Adding routes
  get "/" do
    { message: "Am Lucky to have a code that works on first instance" }.to_json
  end

  # get all pet in the database
  get "/api/pets" do
    Pet.all.to_json
  end

  #Get all pet by ID
  get "/api/pets/:id" do
    Pet.find(params[:id]).to_json
  end

  #allows for pet creation,
  post "/api/pets" do
    Pet.create(
      name: params[:name],
      price: params[:price],
      owner: params[:owner],
      location: params[:location],
      img: params[:img]
      # age: params[:age]
    )
  end

  # helps us to put/update pet info
  put "/api/pets/:id" do
    pet = Pet.find(params[:id])
    pet.update(
      name: params[:name]? params[:name]: pet[:name],
      price: params[:price]? params[:price]: pet[:price],
      owner: params[:owner]? params[:owner]: pet[:owner],
      location: params[:location]? params[:location]: pet[:location],
      img: params[:img]? params[:img]: pet[:img]
      # age: params[:age]? params[:age]: pet[:age]
    )

    pet.to_json
  end

  # deletes pet by id
  delete "/api/pets/:id" do
    pet = Pet.find(params[:id])
    pet.destroy

    {message:"Pet Deleted Successfully"}.to_json
  end

end


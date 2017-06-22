require 'rails_helper'

RSpec.describe "ApiDevelopments", type: :request do

  def parsed_body
    JSON.parse(response.body)
  end


  describe "RDMS-backed model" do 
    before(:each) {City.delete_all}
    after(:each) {City.delete_all}

    it "create RDMS-backed model" do
    	object=City.create(:name=>"test")
    	expect(City.find(object.id).name).to eq("test")
    end

    it "expose RDMS-backed resource" do
    	object=City.create(:name=>"test")
    	get city_path(object.id)
    	expect(response).to have_http_status(:ok)
    	expect(JSON.parse(response.body)["name"]).to eq("test")

    end
  end


  describe "MongoDB-backed" do

    before(:each) {State.delete_all}
    after(:each) {State.delete_all}

  	it "create MongoDB-backed model" do
      object = State.create(:name=>"test")
      expect(State.find(object.id).name).to eq("test")
    end
  	
    it "expose MongoDB-backed API resource" do
     
     object = State.create(:name=>"test")
     

     #get State_path(object.id)
     #expect(response).to have_http_status(:ok)
     #expect(JSON.parse(response.body)["name"]).to eq("test")

     puts state_path
     expect(state_path).to eq("/api/states")
     get state_path(object.id) 
     expect(response).to have_http_status(:ok)
     expect(parsed_body["name"]).to eq(object.name)
     expect(parsed_body).to include("created_at")
     expect(parsed_body).to include("id"=>object.id.to_s)






    end
  end

end


  # describe "GET /api_developments" do
  #   it "works! (now write some real specs)" do
  #     get api_developments_path
  #     expect(response).to have_http_status(200)
  #   end
  # end


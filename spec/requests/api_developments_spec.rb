require 'rails_helper'

RSpec.describe "ApiDevelopments", type: :request do

  def parsed_body
    JSON.parse(response.body)
  end


  describe "RDMS-backed model" do 
    before(:each) {Foo.delete_all}
    after(:each) {Foo.delete_all}

    it "create RDMS-backed model" do
    	object=Foo.create(:name=>"test")
    	expect(Foo.find(object.id).name).to eq("test")
    end

    it "expose RDMS-backed resource" do
    	object=Foo.create(:name=>"test")
    	get foo_path(object.id)
    	expect(response).to have_http_status(:ok)
    	expect(JSON.parse(response.body)["name"]).to eq("test")

    end
  end


  describe "MongoDB-backed" do

    before(:each) {Bar.delete_all}
    after(:each) {Bar.delete_all}

  	it "create MongoDB-backed model" do
      object = Bar.create(:name=>"test")
      expect(Bar.find(object.id).name).to eq("test")
    end
  	
    it "expose MongoDB-backed API resource" do
     
     object = Bar.create(:name=>"test")
     

     #get bar_path(object.id)
     #expect(response).to have_http_status(:ok)
     #expect(JSON.parse(response.body)["name"]).to eq("test")


     expect(bars_path).to eq("/api/bars")
     get bar_path(object.id) 
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


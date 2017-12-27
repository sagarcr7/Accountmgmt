require 'rails_helper'

RSpec.describe RecordsController, type: :controller do

describe "GET #index" do
  it "renders the index template" do
    get :index
    expect(response).to render_template :index
  end
end

describe "GET #new" do
  it "renders the new template" do
    get :new
    expect(response).to render_template :new
  end
end

describe "POST #create" do
  context "when attributes are valid" do
    it "creates a new record" do
    	expect {
    post :create, params: {record: FactoryGirl.attributes_for(:record) }
    }.to change(Record, :count).by(1)
	end
    it "redirects to root_path" do
    	post :create, params: {record: FactoryGirl.attributes_for(:record) } 
    	expect(response).to redirect_to root_path
    end
  end

  context "when attributes are invalid" do
    it "doesn't create a new record" do
    	expect {
    	post :create, params: {record: FactoryGirl.attributes_for(:invalid_record) }
    	}.to change(Record, :count).by(0)
    	end
    it "renders the new template" do
    	post :create, params: {record: FactoryGirl.attributes_for(:invalid_record) }
    	expect(response).to render_template :new
    end
  end
end

describe "GET #edit" do
	it "renders the edit template" do
		record = FactoryGirl.create(:record)
		get :edit, params: { id: record.id }
		expect(response).to render_template :edit
		end
	end


end

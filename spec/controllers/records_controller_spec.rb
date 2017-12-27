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
  context "with valid attributes" do
    it "creates a new record" do
    	expect {
    post :create, params: {record: FactoryGirl.attributes_for(:record) }
    }.to change(Record, :count).by(1)

    end
    it "redirects to root_path" do

    end
  end

  context "with invalid attributes" do
    it "doesn't create a new record" do

    end
    it "renders the new template" do

    end
  end
end

end

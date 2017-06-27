require 'rails_helper'

# As an API user
# When I visit "/api/v1/items"
# Then I should receive a 200 response
# And the body should contain a JSON response that looks like this
# {
#   "items": [
#     {},
#     {}
#   ]
# }

describe "Items API" do
  it "sends a list of items" do
   create_list(:item, 3)

   get '/api/v1/items'

   expect(response).to be_success

   raw_items = JSON.parse(response.body)
   raw_item = raw_items.first

   expect(raw_items.count).to eq(3)
   expect(raw_item).to have_key("name")
   expect(raw_item["name"]).to be_a String
   expect(raw_item).to have_key("description")
   expect(raw_item["description"]).to be_a String
  end

  context "GET api/v1/item/:id" do
    it "returns info" do
      id = create(:item).id
      get "/api/v1/items/#{id}"

      raw_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(raw_item["id"]).to eq(id)
      expect(raw_item).to have_key("name")
      expect(raw_item["name"]).to be_a String
      expect(raw_item).to have_key("description")
      expect(raw_item["description"]).to be_a String
    end
  end

  context "POST /api/v1/items" do
    it "creates an item with valid params" do
      item_params = {
        name: "Super Mario Bors. 3",
        description: "One of the best."
      }

      expect {
        post "/api/v1/items", params: item_params
      }.to change {Item.count}.by(1)

      expect(response).to have_http_status(201)
    end
  end
end

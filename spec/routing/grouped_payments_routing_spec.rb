require "rails_helper"

RSpec.describe GroupedPaymentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/grouped_payments").to route_to("grouped_payments#index")
    end

    it "routes to #new" do
      expect(get: "/grouped_payments/new").to route_to("grouped_payments#new")
    end

    it "routes to #show" do
      expect(get: "/grouped_payments/1").to route_to("grouped_payments#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/grouped_payments/1/edit").to route_to("grouped_payments#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/grouped_payments").to route_to("grouped_payments#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/grouped_payments/1").to route_to("grouped_payments#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/grouped_payments/1").to route_to("grouped_payments#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/grouped_payments/1").to route_to("grouped_payments#destroy", id: "1")
    end
  end
end

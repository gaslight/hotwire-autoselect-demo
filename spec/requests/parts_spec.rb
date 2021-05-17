 require 'rails_helper'

RSpec.describe "/parts", type: :request do

  let(:valid_attributes) {
    { part_number: 'a-valid-part-number' }
  }

  let(:invalid_attributes) {
    { part_number: nil }
  }

  describe "GET /autosuggest" do
    it "renders a successful response" do
      Part.create! valid_attributes
      get autosuggest_parts_url(q: 'a-valid')
      expect(response).to be_successful
    end
  end

  describe "GET /fetch" do
    it "renders a successful response" do
      part = Part.create! valid_attributes
      get fetch_parts_url(q: part.part_number)
      expect(response).to be_successful
    end
  end

  describe "GET /reset" do
    it "renders a successful response" do
      %w[1234 5678].each { |part_number| Part.create!(part_number: part_number) }
      get reset_parts_url
      expect(response).to be_successful
    end
  end

  describe "GET /index" do
    it "renders a successful response" do
      Part.create! valid_attributes
      get parts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      part = Part.create! valid_attributes
      get part_url(part)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_part_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      part = Part.create! valid_attributes
      get edit_part_url(part)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Part" do
        expect {
          post parts_url, params: { part: valid_attributes }
        }.to change(Part, :count).by(1)
      end

      it "redirects to the created part" do
        post parts_url, params: { part: valid_attributes }
        expect(response).to redirect_to(part_url(Part.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Part" do
        expect {
          post parts_url, params: { part: invalid_attributes }
        }.to change(Part, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post parts_url, params: { part: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_part_number) { 'a-different-valid-part-number' }
      let(:new_attributes) {
        { part_number: new_part_number }
      }

      it "updates the requested part" do
        part = Part.create! valid_attributes
        patch part_url(part), params: { part: new_attributes }
        expect(part.reload.part_number).to eq(new_part_number)
      end

      it "redirects to the part" do
        part = Part.create! valid_attributes
        patch part_url(part), params: { part: new_attributes }
        part.reload
        expect(response).to redirect_to(part_url(part))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        part = Part.create! valid_attributes
        patch part_url(part), params: { part: invalid_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested part" do
      part = Part.create! valid_attributes
      expect {
        delete part_url(part)
      }.to change(Part, :count).by(-1)
    end

    it "redirects to the parts list" do
      part = Part.create! valid_attributes
      delete part_url(part)
      expect(response).to redirect_to(parts_url)
    end
  end
end

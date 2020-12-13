# spec/requests/cats_spec.rb
require 'rails_helper'

RSpec.describe 'Cats API' do
  # Initialize the test data
  let!(:collection) { create(:collection) }
  let!(:cats) { create_list(:cat, 20, collection_id: collection.id) }
  let(:collection_id) { collection.id }
  let(:id) { cats.first.id }

  # Test suite for GET /collections/:collection_id/cats
  describe 'GET /collections/:collection_id/cats' do
    before { get "/collections/#{collection_id}/cats" }

    context 'when collection exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all collection cats' do
        expect(json.size).to eq(20)
      end
    end

    context 'when collection does not exist' do
      let(:collection_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Collection/)
      end
    end
  end

  # Test suite for GET /collections/:collection_id/cats/:id
  describe 'GET /collections/:collection_id/cats/:id' do
    before { get "/collections/#{collection_id}/cats/#{id}" }

    context 'when collection cat exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the cat' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when collection cat does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Cat/)
      end
    end
  end

  # Test suite for PUT /collections/:collection_id/cats
  describe 'POST /collections/:collection_id/cats' do
    let(:valid_attributes) { { name: 'Visit Narnia', done: false } }

    context 'when request attributes are valid' do
      before { post "/collections/#{collection_id}/cats", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/collections/#{collection_id}/cats", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /collections/:collection_id/cats/:id
  describe 'PUT /collections/:collection_id/cats/:id' do
    let(:valid_attributes) { { name: 'Mozart' } }

    before { put "/collections/#{collection_id}/cats/#{id}", params: valid_attributes }

    context 'when cat exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the cat' do
        updated_cat = cat.find(id)
        expect(updated_cat.name).to match(/Mozart/)
      end
    end

    context 'when the cat does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Cat/)
      end
    end
  end

  # Test suite for DELETE /collections/:id
  describe 'DELETE /collections/:id' do
    before { delete "/collections/#{collection_id}/cats/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

class CatsController < ApplicationController
  before_action :set_collection
  before_action :set_collection_cat, only: [:show, :update, :destroy]

  # GET /collections/:collection_id/cats
  def index
    json_response(@collection.cats)
  end

  # GET /collections/:collection_id/cats/:id
  def show
    json_response(@cat)
  end

  # POST /collections/:collection_id/cats
  def create
    @collection.cats.create!(cat_params)
    json_response(@collection, :created)
  end

  # PUT /collections/:collection_id/cats/:id
  def update
    @cat.update(cat_params)
    head :no_content
  end

  # DELETE /collections/:collection_id/cats/:id
  def destroy
    @cat.destroy
    head :no_content
  end

  private

  def cat_params
    params.permit(:name, :done)
  end

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end

  def set_collection_cat
    @cat = @collection.cats.find_by!(id: params[:id]) if @collection
  end
end

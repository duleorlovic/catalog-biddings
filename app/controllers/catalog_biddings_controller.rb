class CatalogBiddingsController < ApplicationController
  before_action :set_catalog_bidding, only: [:show, :edit, :update, :destroy]

  # GET /catalog_biddings
  # GET /catalog_biddings.json
  def index
    @catalog_biddings = CatalogBidding.all
  end

  # GET /catalog_biddings/1
  # GET /catalog_biddings/1.json
  def show
  end

  # GET /catalog_biddings/new
  def new
    @catalog_bidding = CatalogBidding.new
  end

  # GET /catalog_biddings/1/edit
  def edit
  end

  # POST /catalog_biddings
  # POST /catalog_biddings.json
  def create
    @catalog_bidding = current_user.catalog_biddings.new(catalog_bidding_params)
    @catalog_bidding.offered_at = Time.now

    respond_to do |format|
      if @catalog_bidding.save
        format.html { redirect_to @catalog_bidding, notice: 'Catalog bidding was successfully created.' }
        format.json { render :show, status: :created, location: @catalog_bidding }
        format.js do
          render js: %(
            $('tbody').append('#{view_context.j view_context.render partial: 'catalog_auctions/bid_row', locals: { catalog_bidding: @catalog_bidding }}');
          )
        end
      else
        format.html { render :new }
        format.json { render json: @catalog_bidding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catalog_biddings/1
  # PATCH/PUT /catalog_biddings/1.json
  def update
    respond_to do |format|
      if @catalog_bidding.update(catalog_bidding_params)
        format.html { redirect_to @catalog_bidding, notice: 'Catalog bidding was successfully updated.' }
        format.json { render :show, status: :ok, location: @catalog_bidding }
      else
        format.html { render :edit }
        format.json { render json: @catalog_bidding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catalog_biddings/1
  # DELETE /catalog_biddings/1.json
  def destroy
    @catalog_bidding.destroy
    respond_to do |format|
      format.html { redirect_to catalog_biddings_url, notice: 'Catalog bidding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catalog_bidding
      @catalog_bidding = CatalogBidding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catalog_bidding_params
      params.require(:catalog_bidding).permit(:catalog_auction_id, :user_id, :offered_price, :offered_at)
    end
end

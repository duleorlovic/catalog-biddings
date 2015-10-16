class CatalogAuctionsController < ApplicationController
  before_action :set_catalog_auction, only: [:show, :edit, :update, :destroy]

  # GET /catalog_auctions
  # GET /catalog_auctions.json
  def index
    @catalog_auctions = CatalogAuction.all
  end

  # GET /catalog_auctions/1
  # GET /catalog_auctions/1.json
  def show
  end

  # GET /catalog_auctions/new
  def new
    @catalog_auction = CatalogAuction.new
  end

  # GET /catalog_auctions/1/edit
  def edit
  end

  # POST /catalog_auctions
  # POST /catalog_auctions.json
  def create
    @catalog_auction = CatalogAuction.new(catalog_auction_params)

    respond_to do |format|
      if @catalog_auction.save
        format.html { redirect_to @catalog_auction, notice: 'Catalog auction was successfully created.' }
        format.json { render :show, status: :created, location: @catalog_auction }
      else
        format.html { render :new }
        format.json { render json: @catalog_auction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catalog_auctions/1
  # PATCH/PUT /catalog_auctions/1.json
  def update
    respond_to do |format|
      if @catalog_auction.update(catalog_auction_params)
        format.html { redirect_to @catalog_auction, notice: 'Catalog auction was successfully updated.' }
        format.json { render :show, status: :ok, location: @catalog_auction }
      else
        format.html { render :edit }
        format.json { render json: @catalog_auction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catalog_auctions/1
  # DELETE /catalog_auctions/1.json
  def destroy
    @catalog_auction.destroy
    respond_to do |format|
      format.html { redirect_to catalog_auctions_url, notice: 'Catalog auction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catalog_auction
      @catalog_auction = CatalogAuction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catalog_auction_params
      params.require(:catalog_auction).permit(:catalog_id, :initial_price, :is_active, :expires_at)
    end
end

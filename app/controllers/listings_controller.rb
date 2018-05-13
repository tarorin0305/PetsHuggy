class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:show, :update, :basics, :description, :address, :price, :photos, :calendar, :bankaccount, :publish]

  def index
    @listings = current_user.listings
  end

  def show
    @photos = @listing.photos
    #1つのListingデータ(Listingモデルのインスタンス)には、複数のphotoが紐付いており、つまりは複数のphotosテーブルレコードが紐付いているということ。
  end

  def new
    # 現在のユーザーのリスティングの作成
    @listing = current_user.listings.build
  end

  def create
    # パラメーターとともに現在のユーザーのリスティングを作成
    @listing = current_user.listings.build(listing_params)

    if @listing.save
      redirect_to manage_listing_basics_path(@listing), notice: "リスティングを作成・保存をしました"
    else
      redirect_to new_listing_path, notice: "リスティングを作成・保存出来ませんでした"
    end

  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      redirect_to :back, notice: "更新できました"
    end
  end

  def basics
  end

  def description
  end

  def address
  end

  def price
  end

  def photos
    @photo = Photo.new
  end

  def calendar
  end

  def bankaccount
  end

  def publish
  end



  private
  def listing_params #更新を許可するカラムをここで書いている。
    params.require(:listing).permit(:home_type, :pet_type, :breeding_years, :pet_size, :price_pernight, :address)
  end

  def set_listing
    @listing = Listing.find(params[:id])
    #ここがあやしい。でも問題なさそう。paramsの引き渡しは出来ている（3 をparamsに与えるとちゃんと出る）
    #おそらくは、Listing.find(params[:id])で、URLパラメータと同じ数字をidにもつレコードをlistingsテーブルから引っ張ってきて、@listing変数に代入している。
    #たぶん、左辺には配列形式のデータが格納されている。
  end


end

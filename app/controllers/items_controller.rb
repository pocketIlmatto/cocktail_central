class ItemsController < ApplicationController
  include ItemsHelper
  before_action :set_item, only: [:show]

  # GET /items
  # GET /items.json
  def index
    @items = pimp_my_bar().paginate(page: params[:page]) 
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params[:item][:ingredient_list] ||= []      
      params.require(:item).permit(:name, ingredient_list: [])
    end   
    

    def pimp_my_bar()
      
      ingredient_list = []
      ingredient_list = params[:ingredient_list]
      
      if !ingredient_list.nil? 
        puts "brute forcing"
        @items = brute_force(ingredient_list)      
                 
      else
        @items = Item.all
        
      end
    end


end

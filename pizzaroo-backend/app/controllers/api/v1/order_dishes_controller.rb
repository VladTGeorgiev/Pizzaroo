class Api::V1::OrderDishesController < ApplicationController

    def index
        render json: OrderDish.all
    end

    def create
        order_dish = OrderDish.create(order_dish_params)
        render json: { order_dish: OrderDishSerializer.new(order_dish)}
    end

    def show
        order_dish = OrderDish.find_by(id: params[:id])
        if order_dish 
            render json: {order_dish: OrderDishSerializer.new(order_dish)}
        else
            render plain: "This order doesn't exist"
        end
    end

    def update
        order_dish = OrderDish.find(params[:id])
        order_dish.update(order_dish_params)
    end

    def destroy
        order_dish = OrderDish.find_by(id: params[:id])
        order_dish.destroy
    end

    private

    def order_dish_params
        params.require(:order_dish).permit(:order_id, :dish_id, :quantity)
    end
end
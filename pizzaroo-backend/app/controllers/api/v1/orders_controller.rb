class Api::V1::OrdersController < ApplicationController

    def index
        render json: Order.all
    end

    def create
        order = Order.create(order_params)
        render json: { order: OrderSerializer.new(order)}
    end

    def show
        order = Order.find_by(id: params[:id])
        if order 
            render json: {order: OrderSerializer.new(order)}
        else
            render plain: "This order doesn't exist"
        end
    end

    def update
        order = Order.find(params[:id])
        order.update(order_params)
        render json: OrderSerializer.new(order).to_serialized_json
    end

    def destroy
        order = Order.find_by(id: params[:id])
        id = order.id
        order.destroy
        render json: {info: 'Order Deleted!', orderId: id}
    end

    private

    def order_params
        params.require(:order).permit(:restaurant_id, :user_id)
    end
end

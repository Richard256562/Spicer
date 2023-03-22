class UsersController < ApplicationController
def index

end
# GET /users/{id}
def show
    #check if user is present
 user =User.find_by(id: params[id])
 # return user
 if user
    render json: user, status: :ok
else
    render json: {error: "user not found"}, status: :not_found
end
# POST 
def create
    user = User.create(production_params)
            #check whethet task is valid
            if user.valid?
                render json: user, status::accepted
            else 
                render json: {error:"An error occurred.Please try again"}, status: :unprocessable entity
            end
        end
    #PUT/PATCH/users/{id}
        def update 
            user =User.find_by(id: params[id])
            if user
                user.update(production_params)
                #return it
                render json: task, status::accepted
            else
                #throw not found error
                render json: {error: "User not found"}, status: :not_found
            end
    
        end
end

private
def
end
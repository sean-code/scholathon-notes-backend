class NotesController < ApplicationController
    #All notes
    def index
        user = User.find_by(id: session[:user_id])
        note = Note.all
        render json: note, except: [:created_at, :updated_at], status: :ok
    end

    #GET /notes/ 1
    def show
        if set_note
            render json: set_note, status: :ok
        else
            render json: {error: "Note Does Not Exist"}, status: :not_found
        end
    end

    #POST -- For the Add note Button
    def create
        @user = User.find_by(id: session[:user_id])
        @note = Note.create(note_params)
        if @note
          render json: @note, status: :created
        else
          render json: @note.errors, status: :unprocessable_entity
        end
    end

    #PATCH
    def update
        @note=note.update(note_params)
        if @note 
            render json: @note, status: :ok
        else 
            render json: {error: "Not Updated"}, status: :unprocessable_entity
        end
    end

    #DELETE
    def destroy 
        set_note.destroy
        head :no_content
    end

    

    private
    # Use callbacks to share common setup or constraints between actions.
    def authorize
        return render json: { errors: ["Not authorized"] }, status: :unauthorized unless session.include? :user_id
    end

    def set_note
        @note = Note.find_by(id: params[:id])
    end
    # Only allow trusted parameter "white list" through
    def note_params
        params.permit(:title, :content)
    end

end

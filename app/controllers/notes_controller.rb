class NotesController < ApplicationController
    def index
        @notes=Note.all
        render json: @notes, except:[:created_at, :updated_at], status: :ok
    end

    def show
        @note = Note.find_by(id: params[:id])
        if @note
            render json: @note, except: [:created_at, :updated_at], status: :ok
        else
            render json: {error: "Note Not Found"}, status: :not_found
        end
    end
end

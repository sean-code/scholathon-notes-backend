class NotesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with:  :respond_record_not_found

    def index
        @notes = Note.all
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

    # CRUD Actions

    def create
        @note = Note.create(note_params)
        render json: @note, status: :created
    end

    def update
        @note = Note.find_by(id: params[:id])
        if @note
            @note.update(note_params)
            render json: @note
        else
            render json: { error: "Note not found" }, status: :not_found
        end
    end

    def destroy
        @note = Note.find_by(id: params[:id])
        if @note
            @note.destroy
            head :no_content
        else
            render json: { error: "Note not found" }, status: :not_found
        end
    end


    private

    def note_params
        params.permit(:title, :content)
    end

    def respond_record_not_found
        render json: { error: "note not found" }, status: not_found
    end
end

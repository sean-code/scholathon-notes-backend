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

    def update 
        note = find_note
        if note
            note.update(note_params)
            render json: note
        else
            render json: { error: "Note not found" }, status: :not_found
        end
    end

    def destroy
        note = find_note
        if note
            note.destroy
            head :no_content
        else
            render json: { error: "note not found" }, status: :not_found
        end
    end

    private
    def find_note
        Note.find_by(id: params[:id])
    end

    def note_params
        params.permit(:title, :content)
    end

    def respond_record_not_found
        render json: { error: "note not found" }, status: 404
    end
end

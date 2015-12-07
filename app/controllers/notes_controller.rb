class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new
    @note.user_id = params[:user_id]
    @note.content = params[:content]
    @note.contact_id = params[:conact_id]


    if @note.save
      redirect_to "/notes", :notice => "Note created successfully."
    else
      render 'new'
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.user_id = params[:user_id]
    @note.content = params[:content]
    @note.contact_id = params[:contact_id]

    #Update stale listings if a contact changes. Adding a contact method adds new stale listings to existing moves. Removing a contact method deletes existing stale listings referencing it.

    #Step 1: Add new stale listings when a new contact method is added
    if @note.save

      redirect_to "/notes", :notice => "Note updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @note = Note.find(params[:id])

    @note.destroy

    redirect_to "/notes", :notice => "Note deleted."
  end
end

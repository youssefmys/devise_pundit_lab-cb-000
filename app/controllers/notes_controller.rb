class NotesController < ApplicationController

  include Pundit

  before_action :authenticate_user!
  after_action  :verify_authorized, :except => :index
  #after_action  :verify_policy_scoped, :only => :index

  rescue_from Pundit::NotAuthorizedError , with: :user_not_authorized

  def index
    @notes = policy_scope(Note)   #=> PolicyScope::Scope.new(current_user, Note).resolve

    render :index
  end

  def new
    @note = Note.new
    authorize @note
    render :new
  end

  def create
    note = Note.new(note_params)
    authorize note
    note.user = current_user
    note.save!
    redirect_to '/'
  end

  def update
    authorize @note
    @note.update(note_params)
    redirect_to '/'
  end

  def edit
    @note = Note.find(params[:id])
  end

  def show
  end

  def index
    @notes = Note.none
    if current_user
      @notes = current_user.readable
    end
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

  def user_note_authorized
    redirect_to new_user_session_path, flash: {:notice => "You are not authorized to access this page"}
  end

end

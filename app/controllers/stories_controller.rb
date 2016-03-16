class StoriesController < ApplicationController
  def index
    @stories = Story.order(created_at: :desc)
  end

  def show
    @story = get_story
  end

  def new
    @story = Story.new
    @story.sentences.build
    @creating_new_story = true
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      flash[:notice] = "Story successfully created."
      redirect_to @story
    else
      render :new
    end
  end

  def edit
    @story = get_story
  end

  def update
    @story = get_story
    if @story.update(story_params)
      flash[:notice] = "Story successfully updated."
      redirect_to @story
    else
      render :edit
    end
  end

  private

  def get_story
    Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, sentences_attributes: [:id, :content, :author])
  end

  # def sentence_params
  #   params.require(:sentence).permit(:content, :author)
  # end
end

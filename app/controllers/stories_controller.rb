class StoriesController < ApplicationController
  def index
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
    @story.sentences.build
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

  private

  def story_params
    params.require(:story).permit(:title, sentences_attributes: [:content, :author])
  end

  # def sentence_params
  #   params.require(:sentence).permit(:content, :author)
  # end
end

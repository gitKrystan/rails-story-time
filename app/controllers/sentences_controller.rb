class SentencesController < ApplicationController

  def new
    @story = get_story
    @sentence = @story.sentences.new
  end

  def create
    @story = get_story
    @sentence = @story.sentences.new(sentence_params)
    if @sentence.save
      flash[:notice] = "Sentence successfully saved."
      redirect_to @story
    else
      render :new
    end
  end

  private

  def get_story
    Story.find(params[:story_id])
  end

  def sentence_params
    params.require(:sentence).permit(:content, :author)
  end
end

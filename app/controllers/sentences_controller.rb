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

  def edit
    @story = get_story
    @sentence = get_sentence
  end

  def update
    @story = get_story
    @sentence = get_sentence
    if @sentence.update(sentence_params)
      flash[:notice] = 'Sentence successfully updated.'
      redirect_to @story
    else
      render :edit
    end
  end

  def destroy
    story = get_story
    @sentence = get_sentence
    if !@sentence.destroy
      flash[:alert] = 'Cannot delete sentence that is not last.'
    end
    redirect_to story
  end

  private

  def get_sentence
    Sentence.find(params[:id])
  end

  def get_story
    Story.find(params[:story_id])
  end

  def sentence_params
    params.require(:sentence).permit(:content, :author)
  end
end

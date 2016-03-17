class SentencesController < ApplicationController
  def new
    @story = get_story
    @story_sentences = get_story_sentences
    @sentence = @story.sentences.new
    @sentence_image = Image.random
  end

  def create
    @story = get_story
    @sentence = @story.sentences.new(sentence_params)
    if @sentence.save
      flash[:notice] = 'Sentence successfully saved.'
      redirect_to @story
    else
      @story_sentences = get_story_sentences
      @sentence_image = Image.find(sentence_params['image_id'].to_i)
      render :new
    end
  end

  def edit
    @story = get_story
    @story_sentences = get_story_sentences
    @sentence = get_sentence
    @sentence_image = get_image
  end

  def update
    @story = get_story
    @sentence = get_sentence
    if @sentence.update(sentence_params)
      flash[:notice] = 'Sentence successfully updated.'
      redirect_to @story
    else
      @story_sentences = get_story_sentences
      @sentence_image = get_image
      render :edit
    end
  end

  def destroy
    story = get_story
    @sentence = get_sentence
    unless @sentence.destroy
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

  def get_story_sentences
    @story.sentences.order(:created_at)
  end

  def get_image
    @sentence.image
  end

  def sentence_params
    params.require(:sentence).permit(:content, :author, :image_id)
  end
end

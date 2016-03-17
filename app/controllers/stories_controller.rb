class StoriesController < ApplicationController
  def index
    @stories = Story.order(created_at: :desc)
  end

  def search
    @query = params[:q]
    sentence_search_stories = Sentence.basic_search(@query).map { |sentence| sentence.story }
    story_search_stories = Story.basic_search(@query)
    @stories = (sentence_search_stories + story_search_stories).uniq
    render :index
  end

  def show
    @story = get_story
    @story_image = get_story_image
    @sentences = @story.sentences.order(:created_at)
  end

  def new
    @story = Story.new
    @story.sentences.build
    @story_image = Image.random
    @creating_new_story = true
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      flash[:notice] = "Story successfully created."
      redirect_to @story
    else
      @creating_new_story = true
      @story_image = Image.find(story_params['sentences_attributes']['0']['image_id'].to_i)
      render :new
    end
  end

  def edit
    @story = get_story
    @story_image = get_story_image
  end

  def update
    @story = get_story
    if @story.update(story_params)
      flash[:notice] = "Story successfully updated."
      redirect_to @story
    else
      @story_image = get_story_image
      render :edit
    end
  end

  def destroy
    @story = get_story
    @story.destroy
    redirect_to stories_path
  end

  private

  def get_story
    Story.find(params[:id])
  end

  def get_story_image
    @story.sentences.order(:created_at).first.image
  end

  def story_params
    params.require(:story).permit(:title, sentences_attributes: [:id, :content, :author, :image_id])
  end
end

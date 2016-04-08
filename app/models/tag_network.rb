class TagNetwork
  include ActiveModel::AttributeMethods
  attr_reader :sibling_similarities


  def initialize(context, networkable)
    @context = context
    @networkable = networkable
    @weights ||= GraphWeight.for(@networkable.class.name, @context)
    @tags = @networkable.tags_on(@context)

    @tag_weights = {}
    @tags.each do |tag|
      @tag_weights[tag.id] = @weights.tag_weights[tag.id.to_s].to_r
    end
    @sibling_similarities = get_sibling_similarities
  end

  private

  def get_sibling_similarities
    similarities = {}
    @networkable.send("find_related_on_#{@context}").each do |sibling|
      similarities[sibling.id] = get_similarities_with(sibling)
    end
    similarities
  end

  def get_similarities_with(sibling)
    sibling_tags = sibling.tags_on(@context)
    common_tags = @tags & sibling_tags
    normaliser = 1 / (sibling_tags.length + @tags.length)
    score = {}
    score[:tags] = common_tags.map do |tag|
      { 
        id: tag.id,
        name: tag.name, 
        score: @tag_weights[tag.id]
      }
    end
    score[:normalized] = score[:tags].collect{ |el| el[:score] }.sum * normaliser
    score
  end
end
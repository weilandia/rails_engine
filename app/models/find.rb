class Find
  def initialize(params)
    @model = constantize_model(params[:table])
    @parameter = select_parameter(@model, params)
    @query = params[@parameter].downcase
  end

  def locate_record
    if @parameter == "id"
      @model.find(@query)
    elsif @parameter == "created_at"
      @model.find_by(@parameter => @query)
    elsif @parameter == "updated_at"
      @model.find_by(@parameter => @query)
    elsif @parameter == "unit_price"
      @model.find_by(@parameter => (@query.to_f * 100).round)
    elsif @model.column_for_attribute(@parameter).type == :integer
      @model.where(@parameter => @query).first
    else
      @model.find_by("lower(#{@parameter}) = ?", @query)
    end
  end

  def constantize_model(table)
    table.singularize.camelize.constantize
  end

  def select_parameter(model, params)
    model.new.attributes.keys.find do |attribute|
      params.include?(attribute)
    end
  end
end

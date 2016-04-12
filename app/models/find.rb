class Find
  def initialize(params)
    @model = constantize_model(params[:table])
    @parameter = select_parameter(@model, params)
    @query = params[@parameter].downcase
  end

  def locate_record
    if @parameter == "id"
      @model.find(@query)
    elsif @model.column_for_attribute(@parameter).type != :string
      @model.find_by(@parameter => @query)
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

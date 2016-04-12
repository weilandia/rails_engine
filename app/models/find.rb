class Find
  def initialize(params)
    @_params = params
    @_model = constantize_model(params[:table])
    @_parameter = select_parameter(model, params)
  end

  def locate_record
    if parameter == "id"
      model.find(query)
    elsif model.column_for_attribute(parameter).type != :string
      model.find_by(parameter => query)
    else
      model.find_by("lower(#{parameter}) = ?", query)
    end
  end

  def locate_records
    if model.column_for_attribute(parameter).type != :string
      model.where(parameter => query)
    else
      model.where("lower(#{parameter}) = ?", query)
    end
  end

  def random
    model.offset(rand(model.count)).first
  end

private
  def params
    @_params
  end

  def model
    @_model
  end

  def parameter
    @_parameter
  end

  def query
    params[parameter].downcase
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

ActiveRecord::Base.descendants.each do |imodel|
  if imodule.included_modules.includes?(Allport::Concerns::Contactable)
    config.model "#{imodel.name}" do
      list do
        exclude_fields :name
      end
    end
  end
end

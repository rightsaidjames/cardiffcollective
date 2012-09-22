ActsAsTaggableOn.remove_unused_tags = true
ActsAsTaggableOn.force_lowercase = true
ActsAsTaggableOn.force_parameterize = true

ActsAsTaggableOn::Tag.class_eval do
  def to_param
    name.parameterize
  end
end
module Slugifiable
  def self.included(base)
    base.extend ClassMethods
  end

  def slug
    slug = self.username.downcase.gsub(' ', '-').gsub(/[^\w-]/, '') || self.name.downcase.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  class ClassMethods
    def find_by_slug(slug)
      self.all.find{|obj| obj.slug == slug}
    end
  end
end

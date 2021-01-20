require "not_blank/version"

module NotBlank
  module Object
    def nb
      self
    end
  end

  module Enumerable
    def nb
      (a = map(&:nb).compact).empty? ? nil : a
    end
  end

  module Hash
    def nb
      (h = reject { |k,v| v.nb.nil? }).empty? ? nil : h
    end
  end

  module FalseClass
    def nb
      nil
    end
  end

  module String
    def nb
      (strip == "") ? nil : self
    end
  end

  def self.setup
    ::Object.send :include, Object
    ::Hash.send :include, Hash
    ::Enumerable.send :include, Enumerable
    ::Array.send :include, Enumerable
    ::FalseClass.send :include, FalseClass
    ::String.send :include, String
  end
end

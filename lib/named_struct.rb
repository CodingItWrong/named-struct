# frozen_string_literal: true
module NamedStruct
  def self.new(*fields)
    Class.new do
      fields.each do |field|
        attr_accessor field
      end

      define_method(:initialize) do |params|
        assert_no_unknown_keywords(params)
        fields.each do |field|
          send("#{field}=", params[field])
        end
      end

      define_method(:assert_no_unknown_keywords) do |params|
        unknown_keywords = (params.keys - fields)
        raise_keyword_error(unknown_keywords) unless unknown_keywords.empty?
      end

      def raise_keyword_error(unknown_keywords)
        noun = unknown_keywords.count == 1 ? 'keyword' : 'keywords'
        raise(ArgumentError, "unknown #{noun}: #{unknown_keywords.join(', ')}")
      end
    end
  end
end

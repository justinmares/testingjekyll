module Jekyll
  class RandomizeIncludeTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
    end

    def render(context)
      randomizeDir = Dir.new(context.registers[:site].config['randomize_dir'])
      filename = randomizeDir.reject {|f| f.start_with?('.') }.choice
      File.open(randomizeDir.path +  '/' + filename, 'r').read()
    end
  end
end

Liquid::Template.register_tag('randomize', Jekyll::RandomizeIncludeTag)

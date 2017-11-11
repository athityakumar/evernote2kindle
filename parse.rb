require 'nokogiri'
require 'reverse_markdown'

def first(note)
  value = Nokogiri::XML(
                note.children.search('content').first
               ).xpath('//div')
  return if value.empty?
  ReverseMarkdown.convert(value.last.to_html)
end

def content(note)
  content = Nokogiri::XML(note.search('content').to_html)
    .search('en-note').first

  ReverseMarkdown.convert(content.children.to_html) unless content.nil?
end

def parts(note)
  [
    note.children.search('title').first.content,
    content(note)
  ]
end

def parse(file = '/Users/athityakumar/Downloads/HackerRank.enex')
  Nokogiri::XML(File.read(file)).xpath('//note').map do |note|
    title, content = parts(note)
    { title: title, note: note, content: <<-END

## #{title}

#{content}

END
    }
  end
end

def get_index(i)
  return i.to_s if i > 9
  "0#{i}"
end

def run(file, i)
  notes = parse(file)
  puts "There are #{notes.count} notes to migrate."

  i = get_index(i+1)

  title = file.split('/').last.gsub('.enex', '')

  File.open("chapters/#{i}.#{title}.md", 'w') do |f|
    f.write(
      "# #{title} \n" + notes.map do |note|
        note[:content]
      end.join("\n")
    )
  end
  puts 'All done migrating notes.'
end


ARGV.each_with_index do |file, i|
  run(file, i)
end

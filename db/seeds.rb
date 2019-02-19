[
    {
        author: Author.create(name: 'Some Name'),
        title: 'Some Title',
        published_date: 1.day.ago,
        summary: 'Some Summary',
        content: 'Some Content',
        status: 'published'
    }
].each do |content|
  Content.create(content)
end
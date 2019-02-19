[
    {
        author: Author.create(name: 'Some Name 1'),
        title: 'Some Title 1',
        published_at: 1.day.ago,
        summary: 'Some Summary 1',
        content: 'Some Content 2',
        status: 'draft'
    }, {
        author: Author.create(name: 'Some Name 2'),
        title: 'Some Title 2',
        published_at: 1.day.from_now,
        summary: 'Some Summary 2',
        content: 'Some Content 2',
        status: 'draft'
    }, {
        author: Author.create(name: 'Some Name 3'),
        title: 'Some Title 3',
        published_at: 5.minutes.from_now,
        summary: 'Some Summary 3',
        content: 'Some Content 3',
        status: 'draft'
    }, {
        author: Author.create(name: 'Some Name 4'),
        title: 'Some Title 4',
        published_at: 5.minutes.ago,
        summary: 'Some Summary 4',
        content: 'Some Content 4',
        status: 'draft'
    }, {
        author: Author.create(name: 'Some Name 5'),
        title: 'Some Title 5',
        published_at: 10.minutes.from_now,
        summary: 'Some Summary 5',
        content: 'Some Content 5',
        status: 'draft'
    }, {
        author: Author.create(name: 'Some Name 6'),
        title: 'Some Title 6',
        published_at: 10.minutes.ago,
        summary: 'Some Summary 6',
        content: 'Some Content 6',
        status: 'draft'
    }, {
        author: Author.create(name: 'Some Name 7'),
        title: 'Some Title 7',
        published_at: 10.minutes.ago,
        summary: 'Some Summary 7',
        content: 'Some Content 7',
        status: 'draft'
    }

].each do |content|
  Content.create(content)
end
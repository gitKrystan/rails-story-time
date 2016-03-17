def create_test_story
  Story.create(title: 'Test Story',
               sentences_attributes: [ author: 'Test Author',
                                       content: 'Test content.',
                                       image: Image.random ])
end

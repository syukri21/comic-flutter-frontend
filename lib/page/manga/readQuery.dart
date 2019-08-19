const String readComic = """
  query readComic(\$where: ComicWhereUniqueInput!, \$params: ChaptersParamsExec) {
    comic(where: \$where) {
      id
      postId
      title
      japaneseTitle
      author
      type
      image
      status
      released
      synopsis
      postedBy
      postedOn
      updateOn
      rating
      userRating
      userVote
      genres{
        id
        genre
      }
      chapters(params: \$params) {
        id 
        name
      }
      hits
    }
  }
    
  """;

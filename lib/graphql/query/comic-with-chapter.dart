String readComicWithChapters = """
  query readComicWithChapters(\$first: Int, \$orderBy: ComicOrderByInput, \$last: Int, \$firstChapter: Int) {
    comics(first: \$first, orderBy: \$orderBy, last: \$last) {
      id
      title
      japaneseTitle
      author
      type
      image
      rating
      chapters(params:{
        OrderBy: number_DESC,
        First: \$firstChapter
      }){
        id
        name
      }
    }
  }
""";

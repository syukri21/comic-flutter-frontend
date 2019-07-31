String readComics = """
  query readComics(\$first: Int, \$orderBy: ComicOrderByInput, \$last: Int) {
    comics(first: \$first, orderBy: \$orderBy, last: \$last) {
      id
      title
      japaneseTitle
      author
      type
      image
      rating
    }
  }
""";

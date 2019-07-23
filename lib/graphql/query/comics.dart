String readComics = """
  query Comics(\$first: Int, \$orderBy: ComicOrderByInput, \$last: Int) {
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

String readComics = """
  query Comics(\$first: Int, \$orderBy: ComicOrderByInput) {
    comics(first: \$first, orderBy: \$orderBy) {
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

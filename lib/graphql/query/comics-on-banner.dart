String comicsOnBanner = """
  query comicsOnBanner(\$first: Int, \$orderBy: ComicOrderByInput, \$last: Int) {
    comics(first: \$first, orderBy: \$orderBy, last: \$last) {
      id
      title
      japaneseTitle
      image
      rating
      released
      synopsis
      genres {
        id
        genre
      }
    }
  }
""";

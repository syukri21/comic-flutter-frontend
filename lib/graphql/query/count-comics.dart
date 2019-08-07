String readCountsComic = """
  query readCountsComic(\$where: ComicWhereInput){
    countComics(where: \$where)
  }
""";

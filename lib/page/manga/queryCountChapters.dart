const String queryCountChapters = """
  query queryCountChapters(\$where: ChapterWhereInput) {
    countChapters(where: \$where) 
  }
  """;

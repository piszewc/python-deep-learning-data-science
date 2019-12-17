# Introduction to Joins

## Join Syntax

- ANSI SQL-92

  - Tables Joined by Join operator in FROM Claus

    - Preferred syntax

      > SELECT ...
      >
      > FROM Table1 JOIN Table2
      >
      > ON <on_predicate>;

- ANSI SQL-89

  - Tables joined by commas in FROM Clause

    - Not recommended: Accidental Cartesian products!

      > SELECT ...
      >
      > FROM Table1, Table2
      >
      > ON <on_predicate>;


Feature: elementos por orden pokemon

  Background:
    * url apiUrl

  Scenario: Listar movimientos de Squirtle ABC
    Given path 'pokemon', 'squirtle'
    When method GET
    Then status 200
    * def moves = response.moves
    * def moveNames = moves.map(m => m.move.name)
    * def sortedMoveNames = []
    * eval
    """
    sortedMoveNames = moveNames.slice().sort((a, b) => {
      return a.toLowerCase() < b.toLowerCase() ? -1 : a.toLowerCase() > b.toLowerCase() ? 1 : 0;
    });
    """
    * print 'Movimientos ordenados alfabeticamente:', sortedMoveNames

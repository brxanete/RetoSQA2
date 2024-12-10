Feature: get evoluciones pokemon

  Background:
    * url apiUrl

  Scenario Outline: Verificar evoluciones pokemon
    Given path 'pokemon', '<namePokemon>'
    When method GET
    Then status 200
    * def speciesUrl = response.species.url

    Given url speciesUrl
    When method GET
    Then status 200
    * def cadenaEvoUrl = response.evolution_chain.url

    Given url cadenaEvoUrl
    When method GET
    Then status 200

    * def evolutions = []
    * def currentChain = response.chain

    * eval
    """
    while (currentChain != null) {
      evolutions.push(currentChain.species.name);
      currentChain = currentChain.evolves_to.length > 0 ? currentChain.evolves_to[0] : null;
    }
    """
    * match evolutions == [<namePokemon>, <PokemonEvolution_2>, <PokemonEvolution_3>]

    Examples:
      | namePokemon  | PokemonEvolution_2 | PokemonEvolution_3 |
      | charmander   | charmeleon         | charizard          |




Feature: Executar testes na API pokeapi.

  Background: Executa antes de cada teste
    * def url_api = "https://pokeapi.co/api/v2/"

  Scenario: Verificar se o item de id 1 é o master-ball
    Given url url_api + 'item/1'
    When method get
    Then status 200
    And match response.name == "master-ball"
  Scenario: Verficar a categoria do item 1
    Given url url_api + 'item/1'
    When method get
    Then status 200
    And match response.category.name == "standard-balls"
  Scenario: Verficar a quantidade de items
    Given url url_api + 'item/'
    When method get
    Then status 200
    And match response.count == 1607
  Scenario: Ao realizar uma chamada em contest-type/ pelo metodo get o status code deve ser 200 (feito para falhar)
    Given url url_api + 'contest-type/'
    When method get
    Then status 201

  Scenario: Verficar se não existem mais que 5 contest-type
    Given url url_api + 'contest-type/6'
    When method get
    Then status 404

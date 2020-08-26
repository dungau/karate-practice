Feature: sample karate test script

  Background:
    * url 'https://reqres.in/api'

  Scenario: get list users in any page and then get the firsr user by id and get the user not found
    Given path 'users'
    And params {page: '1'}
    When method get
    Then status 200

    * def first = response.data[0]

    Given path 'users', first.id
    When method get
    Then status 200

    Given path 'users', 23
    When method get
    Then status 404


  Scenario: create a user and then get it by id, update the user by put and patch
    * def user =
      """
      {
        "name": "dung",
        "job": "STE"
      }
      """
    Given url 'https://reqres.in/api/users'
    And request user
    When method post
    Then status 201

    * def id = response.id
    * print 'Created id is: ', id

    * def user =
      """
      {
        "name": "dungau",
        "job": "tester"
      }
      """

    Given path id
	  And request user
    When method put
    Then status 200
    And match response contains user
  

    * def user =
      """
      {
        "name": "dung",
        "job": "tester"
      }
      """

    Given path id
	  And request user
    When method patch
    Then status 200
    And match response contains user

  Scenario: delete user by id
    
    * def id = '610'

    Given path 'users', id
    When method delete
    Then status 204
Feature: Example Login
	As a user I should able to login into Example website.
 
Scenario: I login with valid credential as administrator
    Given I open homepage
    And I'm not logged in
    When I login as administrator
    Then I should be logged in

Scenario: I try to login with an invalid credential
    Given I open homepage
    And I'm not logged in
    When I login with invalid credentials
    Then I should NOT be logged in
    And I can find partial text "unrecognized username or password"

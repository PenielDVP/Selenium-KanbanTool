@Login
Feature: Login
Test successfully and unsuccessfully login and logout

#  @SmokeTest
#  Scenario: Users should be able to login using valid credentials
#    Given I navigate to Login page
#    When I login as "Damian.Villanueva@fundacion-jala.org" with password "Control123"
#    Then I should login successfully
#
  @ValidLogin
  Scenario Outline: Users should be able to login using valid credentials
    Given I navigate to Login page
    When I login as "<User Name>" with password "<Password>"
    Then I should login successfully

  Examples:
    | User Name                                | Password     |
    | Damian.Villanueva@fundacion-jala.org     | Control123   |

#  @InvalidLogin
#  Scenario Outline: Users should not be able to login using invalid credentials
#    Given I navigate to Login page
#    When I login as "<User Name>" with password "<Password>" Incorrect
#    Then I not should login successfully
#
#  Examples:
#    | User Name                                | Password     |
#    | Admin                                    | Password123! |
#    | DamianVillanueva                         | Control123   |
#    | Concurrent                               | Password123! |
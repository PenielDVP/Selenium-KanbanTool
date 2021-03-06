
@Persons
Feature: people
  Background:
#    Given I login as "Damian.Villanueva@fundacion-jala.org" with password "Control123"
    Given I login as "penieldvp18@gmail.com" with password "Control123"

  @addNewPerson
  Scenario Outline: :User should be able add new person in the account
    Given I navigate to User page
    When I added a person with the following details "<Name>", "<Email>", "<Privilege>"
    Then the person "<Name>" added should de displayed on the page
    And A successful message: "<Message>" should be displayed on the window

  Examples:
    |Name       |Email                                |Privilege              |Message      |
    |DamianVP   |Damian.Villanueva@fundacion-jal.org  |Project manager        |New user account has been created and activated\n+ Add another one|
#    |Damian2    |penieldvp18@gmail.com                |Account administrator  |
#    |Damian3    |pvp1624@hotmail.com                  |Account owner          |
#    |Damian4    |pvp1624@hotmail.com                  |None                   |




#
#  @InviteWholeTeam
#  Scenario Outline: User should be able to invite a whole team
#    Given I navigate to User page
#    When I invite a whole team with the following details "<Name>", "<InitialName>", "<Email>"
#    Given I am in the People section
#    When I want to invite a whole team
#    Then I select Invite a whole team
#    And I enter one person per line on the text area  with the next format: John Smith, JS, john.smith@companyemail.com
#    And I select Go
#    When I invite a  whole team
#    Then a message [quantity user] users imported successfully should displayed on the window
#    And the new persons added should displayed on the people section
#
#  Examples:
#  |Name       |Email                                |Privilege              |
#  |Damian     |Damian.Villanueva@fundacion-jal.org  |Project manager        |
#  |Damian2    |penieldvp18@gmail.com                |Account administrator  |
#  |Damian3    |pvp1624@hotmail.com                  |Account owner          |
#  |Damian4    |pvp1624@hotmail.com                  |None                   |
#

  @SuspendedUsers
  Scenario Outline: User should be able suspend users
    Given I navigate to User page
    And I added a person with the following details "<User Name>", "<Email>", "<Privilege>"
    When I suspend the user "<User Name>"
    Then The message "<Message>" should be displayed
    And I should not be able to view the user "<User Name>" on the Users list
    And I should be able view the user "<User Name>" on the user Suspended list

  Examples:
    |User Name        |Email                    |Privilege         |Message                  |
    |UserToSuspend    |pvp1624@hotmail.com      |None              |Selected user has been suspended and will not be able to login.|

  @reactivateUser
  Scenario Outline: User should be able reactivate users     #to reactivate
    Given I navigate to User page
    And I added a person with the following details "<User Name>", "<Email>", "<Privilege>"
    And I suspend the user "<User Name>"
    And I navigate to Suspended User List
    When I reactivate the user "<User Name>"
    Then I should be able to view the message: There are no suspended users
    And I should not be able to view the user "<User Name>" on the User Suspended List
    And I should be able to view the user "<User Name>" on Users list
  Examples:
    |User Name           |Email                    |Privilege         |Message                  |
    |UserToReactivate    |pvp1624@hotmail.com      |None              |Selected user has been suspended and will not be able to login.|


  @deleteUser
  Scenario Outline: User should be able to delete a User
    Given I navigate to User page
    And I added a person with the following details "<User Name>", "<Email>", "<Privilege>"
    And I suspend the user "<User Name>"
    And I navigate to Suspended User List
    When I delete to user "<User Name>"
    Then I should not be able to view the user "<User Name>" on the User Suspended List
    And I should not be able to view the user "<User Name>" on the Users list

  Examples:
    |User Name        |Email                    |Privilege         |Message                  |
    |UserToDeleted    |pvp1624@hotmail.com      |None              |Selected user has been suspended and will not be able to login.|

  @editUser
  Scenario Outline: User should be able edit a user
    Given I navigate to User page
    And I added a person with the following details "<User Name>", "<Email>", "<Privilege>"
    When I Edit the user "<User Name>"
    Then I should be able to view the changes for "<User Name>" on the active user list
  Examples:
    |User Name        |Email                    |Privilege         |Message                  |
    |UserToEdit    |pvp1624@hotmail.com      |None              |Selected user has been suspended and will not be able to login.|


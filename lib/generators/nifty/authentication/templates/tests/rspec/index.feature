Feature:
Background:
Given a user exists with username: "lifter"
And a user exists with username: "dover", roles_mask: 2

Scenario Outline: You must be admin to be able to change user roles
Given a user exists with roles_mask: <role>
And I am logged in as that user
When I go to the users page
Then I should <redirect> on the users page
Examples:
| role | redirect |
|    2 | be       |
|    4 | be       |
|    8 | not be   |

Scenario: Users should be listed in alphabetical order after username
Given I am logged in as "dover"
When I go to the users page
Then I should see "dover" listed first
And I should see "lifter" listed second

Feature:

Scenario: Users should be listed in alphabetical order after username
Given a user: "lifter" exists with username: "lifter"
And a user: "dover" exists with username: "dover", roles_mask: 2
And I am logged in as "dover"
When I go to the users page
Then I should see "dover" in the first table row
And I should see "lifter" in the second table row

Scenario Outline: Links within a user for different users
Given a user exists with roles_mask: <role>
And I am logged in as that user
When I go to the users page
Then I should <view> "Roles" within the first table row
Examples:
| role | view    |
|    2 | see     |
|    4 | not see |

Scenario: Follow links
Given a user exists with roles_mask: 2
Given I am logged in as that user
When I go to the users page
And I follow "Roles" within the first table row
Then I should be on that user's edit roles page

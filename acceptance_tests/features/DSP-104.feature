@ErrorForm @UnhappyPath @StepOne

Feature: DSP-104 - Permit error unhappy path - conditions

	Background:
		When I go to Step One of the error form

	Scenario: Selecting Conditions or length of stay
		When I check the Condtions of lenth of stay checkbox
		And I click "Continue"
		Then I am on the Conditons and Length of stay exit page
		When I click "Close"
		Then I am on the Start page

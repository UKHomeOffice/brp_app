@SomeoneElseForm @StepThree @Validation @NotLive
Feature: Under age validation for Step 03 of the Someone Else Form

	Background:
		When I go to Step Three of the someone else form, selecting "under-age"

	Scenario: Attempting to proceed to Step 04 of the Someone Else Form when over 18
		When I enter "18" years old into the Date of birth field
		And I enter something valid in the Full name field
		And I type fill in the nationality field with something valid
		And I click "Continue"
		Then I see the "If you are over 18 years old you can collect your own BRP" link

	Scenario: Proceeding to Step 04 of the Someone Else Form
		When I enter "17" years old into the Date of birth field
		And I enter something valid in the Full name field
		And I type fill in the nationality field with something valid
		And I click "Continue"
		Then I am on Step Four of the somone else form

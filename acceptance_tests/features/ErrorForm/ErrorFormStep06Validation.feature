@ErrorForm @StepSix @Validation
Feature: Validation for Step 06 of the Error Form

	Background:
		When I go to Step Six of the error form

	Scenario: Attempting to submit the form without selecting a radio button
		When I click Send
		Then I see the "Did you have help completing this form?" link
		And I see "Did you have help completing this form?"

	Scenario: Attempting to submit the from with Yes selected and only Organisation completed
		When I check the "Yes" radio button
		And I click Send
		Then I see the "What is the name of the person who helped you complete this form?" link
		And I see "What is the name of the person who helped you complete this form?"
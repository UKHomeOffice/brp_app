@DeliveryForm @StepFive @Validation @DSP-68
Feature: Validation for Step Five of the Delivery Form

	Background:
		When I go to Step Five of the delivery form

	Scenario: Attempting to proceed to Step 06 of the Delivery Form without selecting a radio button
		When I click Send
		Then I see the "Did you have help completing this form?" link
		And I see "Did you have help completing this form?"

	Scenario: Attempting to proceed to Step 06 of the Delivery Form with Yes selected and only Organisation completed
		When I check the "Yes" radio button
		And I click Send
		Then I see the "What is the name of the person who helped you complete this form?" link
		And I see "What is the name of the person who helped you complete this form?"
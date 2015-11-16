@LostStolenDamaged @ChangeDetails
Feature: Changing Lost Stolen Damaged Form details

	Scenario Outline: Changing the values from Step 03 of the Lost Stolen Damaged form
		When I go to Step Five of the lost stolen damaged form
		And I click the "Change" link in the "<xpath>"
		Then I see the personal details I entered on Step Three of the lost stolen damaged form
		When I change the value in the Full name field
		And I change the values in the Date of birth fields
		And I change the value in the Nationality field
		And I change the value in the BRP card number field
		And I click "Continue"
		Then I can see all the changed personal details from step three of the lost stolen damaged form

		Examples:
			|xpath													  |
			|/html/body/main/div[2]/div/form/table/tbody/tr[1]/td[3]/a|
			|/html/body/main/div[2]/div/form/table/tbody/tr[2]/td[3]/a|
			|/html/body/main/div[2]/div/form/table/tbody/tr[3]/td[3]/a|
			|/html/body/main/div[2]/div/form/table/tbody/tr[4]/td[3]/a|

	Scenario Outline: Changing the email value from Step 04 of the Lost Stolen Damaged form
		When I go to Step Five of the lost stolen damaged form
		And I click the "Change" link in the "<xpath>"
		Then I see email address and phone number I entered on Step Four of the lost stolen damaged form
		When I change the value in the Email field
		And I change the value in the Phone field
		And I click "Continue"
		Then I can see the changed email address and phone number from step four of the lost stolen damaged form

		Examples:
			|xpath													  |
			|/html/body/main/div[2]/div/form/table/tbody/tr[5]/td[3]/a|
			|/html/body/main/div[2]/div/form/table/tbody/tr[6]/td[3]/a|

	Scenario: Changing the address values from Step 04 of the Lost Stolen Damaged form
		Given I have provided a contact address and I am on Step Five of the lost stolen damaged form
		And I click the "Change" link in the "/html/body/main/div[2]/div/form/table/tbody/tr[4]/td[3]/a"
		Then I see the contact address I entered on Step Four of the lost stolen damaged form
		When I change the value in the House name field of Step Four of the lost stolen damaged form
		And I change the value in the Town/City field of Step Four of the lost stolen damaged form
		And I change the value in the County field of Step Four of the lost stolen damaged form
		And I change the value in the Postcode field of Step Four of the lost stolen damaged form
		And I click "Continue"
		And I can see all the changed address from step four of the lost stolen damaged form

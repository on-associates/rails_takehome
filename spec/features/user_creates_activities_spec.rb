require 'rails_helper'

describe "User creates activity", type: :feature do
  describe "clicks steps" do
    def stepper(step)
      if step >= 1
        fill_in 'activity_name', with: 'Play Games'
      end

      if step >= 2
        click_on 'Next'

        fill_in 'activity_address', with: 'Central Park'
      end

      if step >= 3
        click_on 'Next'
      end
    end

    before { visit new_activity_path }

    context "at step 1" do
      it "is step 1" do
        expect(page).to have_css 'p.steps', text: '1 of 3'
        expect(page).to_not have_button('Back')
        expect(page).to have_button('Next')
      end

      it 'displays errors and not step forward' do
        click_on "Next"

        expect(page).to have_selector 'div.error-message'
        expect(page).to have_css 'p.steps', text: '1 of 3'
      end

      it 'proceeds to next step' do
        fill_in 'activity_name', with: 'Play Games'
        click_on 'Next'

        expect(page).to have_css 'p.steps', text: '2 of 3'
      end
    end

    context "at step 2" do
      before { stepper(2) }

      it "is step 2" do
        expect(page).to have_css 'p.steps', text: '2 of 3'
        expect(page).to have_button('Back')
        expect(page).to have_button('Next')
      end

      it 'goes back' do
        click_on 'Back'

        expect(page).to have_css 'p.steps', text: '1 of 3'
        expect(page).to_not have_button('Back')
      end

      it 'displays errors and not step forward' do
        fill_in 'activity_address', with: ''
        click_on "Next"

        expect(page).to have_selector 'div.error-message'
        expect(page).to have_css 'p.steps', text: '2 of 3'
      end

      it 'proceeds to next step' do
        click_on 'Next'

        expect(page).to have_css 'p.steps', text: '3 of 3'
        expect(page).to have_button("Submit")
      end
    end

    context "at step 3" do
      before { stepper(3) }

      it "is step 3" do
        expect(page).to have_css 'p.steps', text: '3 of 3'
        expect(page).to_not have_button('Next')
        expect(page).to have_button('Submit')
      end

      it 'goes back' do
        click_on 'Back'

        expect(page).to have_css 'p.steps', text: '2 of 3'
        expect(page).to_not have_button('Submit')
        expect(page).to have_button('Next')

        click_on 'Back'

        expect(page).to have_css 'p.steps', text: '1 of 3'
        expect(page).to_not have_button('Back')
      end

      it 'displays start error and not step forward' do
        click_on 'Submit'

        expect(page).to have_selector "div.error-message-start"
      end

      it 'displays end error and not step forward' do
        fill_in 'activity_starts_at', with: Date.today.strftime("%d-%m-%Y")
        click_on 'Submit'

        expect(page).to have_selector "div.error-message-end"
      end

      it 'saves the activity' do
        date = Date.today
        fill_in 'activity_starts_at', with: date
        fill_in 'activity_ends_at', with: date + 3.days
        click_on 'Submit'

        expect(page).to have_css 'h1', text: 'Activities'
      end
    end
  end
end

# Challenge

Your assignment is to create an application page that features a form that will allow the applicant to enter his or her personal details, provide a motivational letter and upload his or her CV. Based on .PSD mockup below.

## The form

On submission, the page should show a message thanking the applicant for applying. The applicant must be able to complete the form with any type of input method (keyboard, mouse, touch screen) on any type of device. The form should provide immediate feedback to the applicant on correct or incorrectly entered data, should require all fields and should only accept file types .doc(x), .pdf, .rtf and .txt for upload. Bonus points for being able to upload files from Dropbox or Google Drive.

The form should at least consist of the following:
* First and last name
* Date of birth (bonus points for using a datepicker)
* E­mail address
* Sex
* Address, house number and a dutch zipcode

## The page

The application page shows the applicant a menu bar, a full­width header image (bonus points for parallax scrolling), the apply form, an FAQ section and the footer with links to other pages.
On smaller screens and on mobile devices, the menu will slide in and out from the left.

## Mockups

![![desktop]](docs/netwerven.png)

![![mobile]](docs/mobile.png)

# Solution

## Demo

[Click here to see live version](http://www.act.poznan.pl/eze)

## Technology Stack

* HTML
* SLIM
* CSS
* SCSS
* Javascript
* Coffee Script
* jQuery
* Across ­device/browser/platform conformity
* Responsiveness (small, medium, large)
* Grunt
* Bower
* Adobe Photoshop

## Notice about some features

* web font embedding (Lato)
* font icons
* responsive top bar with hamburger on the left
* Dropbox (link with Dropbox API)
* popup message containing the name of candidate appears when submit form
* CSS animated main menu (shrink) when user scroll
* Back to top link is an animation
* custom (hardcoded) form validations, just to show some javascript.

Address require somewhere 5 digits as a code. Mockup doesn't include address field. So I replace City into address to keep is simple.

```
/[\w,.\s]+[\d]{5}[\w,.\s]*/
```

E-mail has more complex validation
```
/^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$/i
```

Both address and e-mail has 2 validations. So if it is empty then 'required' validation works. When it is filled then validates via regular expression at once.

## Screenshots

I stored some screenshots in [screenshots folder](docs/screenshots) proving the responsiveness.

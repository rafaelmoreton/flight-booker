# Flight Booker

This is a study project, a mockup of a flight booker app. It's an assignement from [The Odin Project](https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker) intended on getting some practice with advanced rails forms.

## Functionality

The app allows users to select desired dates and airports, presents them a list of corresponding available flights, allows them to select the desired flight and enter passenger informations for all passengers. The last step would be for the user to enter the billing information, omitted on this toy app.

It doesn't require user authentication, neither allows previously created passengers' records to be retrieved for new bookings. Those are out of this assignement's scope.

## Learning

This project's main lesson is about building complex Rails forms. There are a couple of form features accomplished by the new techniques here employed:

* Instead of the simple POST form that creates a single new data record I've been using, this form will have multiple new records created at once because the main object being created by the form (a booking model) shall have one or more associated passengers, hence the use of **nested forms**.
* Depending on the existance and number of passengers before the creation of a booking means that it's creation problably rely on some **active record callback**.
* Airport options are restricted to a couple of them, so they should be presented on a selection list for better UX, making use of **select tags**.
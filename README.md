# Task

Imagine you're writing software to control the flow of planes at an _airport_. The _planes_ can *land* and *take off* provided that the _weather_ is sunny. Occasionally it may be stormy, in which case no _planes_ can land or take off.

Your task is to create a set of classes/modules to make the given test suite pass. You will need to use a *random number generator* to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use stubbing* to override random weather. Finally, every plane must have a status indicating whether it's flying or landed. You may expand on the original tests.

### Plane
* name
* flying_status
* take_off
* land

### Airport
# name
# capacity
# docking_planes
# releasing_planes
# weather_restrictions


(Stubbing is something that we haven't touched yet - you'll need to read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs. There's an example of using a test double to test a die that's relevant to testing random weather in the test).

The tests are located at: http://
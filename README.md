# seat-allocator-2010
This Ruby project lets you assign an arbitrary number of House of Representatives seats to the states according to [the accepted method](https://en.wikipedia.org/wiki/Huntington%E2%80%93Hill_method).

It uses default data from the 2010 US census, as the House did when they last allocated seats to states. After we have 2020 US census data I will create an updated version that defaults to that data but includes the option to use the 2010 data as well.

## Versions
### 1.2
* Added the choice of setting the size of the House of Representatives directly to the previously existing indirect method of using the average district population
* Fixed some minor typos
### 1.1
* Added a variant file that only assigns seats to the current 50 states
### 1.0
* Assigns seats to the 50 states, DC, and Puerto Rico for any size of House of Representatives


// Example of Objects
let restaurant = {
  name: 'Italian Bistro',
  seatingCapacity: 120,
  hasDineInSpecial: true,
  entrees: ['Penne alla Bolognese', 'Chicken Cacciatore', 'Linguine Pesto']
};

- let restaurant creates a variable named restaurant that stores the object.
- We create the object between curly braces: {}.
- name, seatingCapacity, hasDineInSpecial, and entrees are all keys.
- We separate each key from its corresponding value by a colon (:).
- The value is to the right of the colon. For example, seatingCapacity's value is 120.
- Every key-value pair is separated by a comma ,

//   Accessing Object Properties (Key's Value):  Dot Notation
console.log(restaurant.entrees);

//   Accessing Object Properties (Key's Value):  Bracket Notation
console.log(restaurant['entrees'];

/*   Bracket notation is required to use variables to look up keys within an object. 
It's not possible to use variables like this with dot notation. */

//   Adding Properties to Object
restaurant['appetizers'] = ['Fried Calamari', 'Bruschetta'];
restaurant.desserts = ['Homemade Tiramisu', 'Cannoli'];

//   Methods = functions in an object
let restaurant = {
  name: ()=> {
  	return("Italian Bistro")
  },
    // New Way (ES6)
  seatingCapacity() {
  	return(120)
  }
  //   'This.' Keyword (access properties inside same object)
  sayHello: function() {
 	return `Hello, my name is ${this.name}`
  }
  //   Setter and Getter
  set sayHello()



  Class is similar to object, but with heigherichy
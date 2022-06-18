MODULES:  reusable code that can be exported and imported to another program.

/* Define an object to represent the module. */
let Menu = {};
let specialty = ''   //  * is this necessary? *

//  Add data or behavior to the module.
Menu.specialty = "Roasted Beet Burger";

//  Export the module
module.exports = Menu;
export default Menu;   // New ES6 syntax  (use default when)

export let specialty = '';            //  Exporting Named Exports
export function isVegetarian() {      //
}; 


// Import Menu module into a new file
const Menu = require('./menu.js');
import Menu from './menu';  // New ES6 syntax

import { specialty, isVegetarian } from './menu'; // Importing objects stored in a variable
import { specialty, isVegetarian } from 'menu';   // Importing Nameda Imports



// Create a function using original module object
function placeOrder() {
  console.log('My order is: ' + Menu.specialty);
}

placeOrder();  // Outputs: "My order is: Roasted Beet Burger"


------------------------

//  Changing name of variables in Named Exports.
export { specialty as chefsSpecial, isVegetarian as isVeg, isLowSodium };
 //  Changing name of variables in Named Imports.   (import Named Export Aliases)
import { chefsSpecial, isVeg, isLowSodium as saltFree }

//  Import entire module (menu.js) as an alias
import * as Carte from './menu';
Carte.chefsSpecial;
Carte.isVeg();
Carte.isLowSodium();


/*                      Review
Modules in JavaScript are reusable pieces of code that can be exported from one program and imported for use in another program.

- module.exports_exports the module for use in another program.
- require() imports the module for use in the current program.

ES6 introduced a more flexible, easier syntax to export modules:

- default exports use export default to export JavaScript objects, functions, and primitive data types.
- named exports use the export keyword to export data in variables.
- named exports can be aliased with the as keyword.
- import is a keyword that imports any object, function, or data type.
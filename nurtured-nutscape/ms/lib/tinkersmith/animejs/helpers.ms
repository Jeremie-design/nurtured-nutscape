// javascript 

// helper functions that support the communication 
// between microStudio and js 
//=====================================================
// global.js returns 'strict' true/false values for
// js libraries that do not accept 0/1 instead
// usage:    loop = js.true

global.js = { "true": true , "false": false }; 

// global.jsfunc() allows to hand over ms functions
// as a callback reference to js 
// 
// Example - 
// Javascript original:
//
// anime({
//   posx: function(){return anime.random(-50,50);},
//   loop: true
//   complete: animateBlocks       // ms function
// }) 
//
// microStudio verison:
//
// anime(object
//   posx     = jsfunc(function() anime.random(-50,50) end)
//   loop     = js.true
//   complete = jsfunc(animateBlocks)
// end)
//

global.jsfunc = function(ms_func) { return ms_func ; }


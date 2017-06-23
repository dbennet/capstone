(function() {
  "use strict";

  angular
    .module("spa-demo.cities")
    .controller("spa-demo.cities.CitiesController", CitiesController);

  CitiesController.$inject = ["spa-demo.cities.City"];

  function CitiesController(City) {
      var vm = this;
      vm.cities;
      vm.City;
        

      activate();
      return;
      ////////////////
      function activate() {
        newCity();
      }

      function newCity() {
        vm.City = new City();
      }
      function handleError(response) {
        console.log(response);
      } 
      function edit(object) {
        
      }

      function create() {
        //console.log("creating City", vm.City);   
      }

      function update() {
        //console.log("update", vm.City);       
      }

      function remove() {                
      }


      function removeElement(elements, element) {      
      }      
  }
})();
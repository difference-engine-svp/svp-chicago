(function() {
  "use strict";

  angular.module("app")

  // THIS FILTER IS USED TO DISPLAY THE AVERAGE OF THE RATINGS
  // UPDATING DYNAMICALLY AS THE LIST IS FILTERED
  .filter('avgOfValue', function () {
    return function (data, key) {
   
        if (angular.isUndefined(data) || (data.length == 0)){
          return 0;
        } else {

          var sum = 0;
          var i = 0;

          angular.forEach(data,function(v,k){
            sum = sum + parseInt(v[key]);
            i++;
          });

          return (sum/i).toFixed(2);
        }      
            
    }
})

  .controller("ratingsCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile){
    window.scope = $scope;

    $scope.descending = false;
    $scope.setup = function(){

      $http.get('/api/v1/ratings.json').then(function(response){
        $scope.ratings = response.data;
      });
    };

    $scope.sortBy = function(sortAttribute){
      $scope.sortByAttribute = sortAttribute;
      $scope.descending = !$scope.descending;
    };

  }]);
}());

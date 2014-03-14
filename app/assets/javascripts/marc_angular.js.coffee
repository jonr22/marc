@Marc = angular.module 'Marc', ['ngResource', 'ngRoute']

@Marc.config ['$httpProvider', '$locationProvider', ($httpProvider, $locationProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
  # $locationProvider.html5Mode(true).hashPrefix('!')
]

@Marc.config ['$routeProvider', ($routeProvider) ->
  $routeProvider.
    when('/seasons',
      templateUrl: '../templates/admin/seasons.html'
      controller: 'SeasonsController'
    ).
    when('/divisions',
      templateUrl: '../templates/admin/divisions.html'
      controller: 'DivisionsController'
    ).
    when('/race_classes',
      templateUrl: '../templates/admin/race_classes.html'
      controller: 'RaceClassesController'
    ).
    when('/drivers',
      templateUrl: '../templates/admin/drivers.html'
      controller: 'DriversController'
    ).
    when('/schedule',
      templateUrl: '../templates/admin/races.html'
      controller: 'RacesController'
    ).
    when('/results',
      templateUrl: '../templates/admin/results.html'
      controller: 'ResultsController'
    )
]

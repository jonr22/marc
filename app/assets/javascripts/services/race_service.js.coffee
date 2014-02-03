@Marc.factory 'raceService', ['$resource', ($resource) ->
  $resource '/races/:id.json', {id: '@id'},
    update:
      method: 'PUT'
      isArray: false
]

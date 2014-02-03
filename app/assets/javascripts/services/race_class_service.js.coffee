@Marc.factory 'raceClassService', ['$resource', ($resource) ->
  $resource '/race_classes/:id.json', {id: '@id'},
    update:
      method: 'PUT'
      isArray: false
]
